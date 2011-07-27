package {
	public class OcObject{
		import flash.display.*;
		import flash.text.*;
		import flash.utils.*;
		import flash.events.*;
		//data
		public var name:String;
		public var startTime:int,
			   endTime:int;
		public var page:uint;

		protected var fields:Array = [];
		protected var types:Array = [];

		//member
		public function OcObject(objXML:XML = null):void{
			fields.push("name", "startTime", "endTime", "page");
			types.push("String", "int", "int", "uint");
			if(! objXML){
				startTime = endTime = page = 0;
			}else{
				fromXML(objXML);
			}
		}

		protected function fromXML(objXML:XML):void{
			try{
				for each(var node:XML in objXML.children()){
					if(!hasOwnProperty(node.name()))
						throw Error("bad XML syntax?");
				}
			}catch(e:Error){
				Tracer.trace(e.message);
				return;
			}
			for(var i:int = 0; i < fields.length; i++){
				var ClassRef:Class = getDefinitionByName(types[i]) as Class;
				this[fields[i]] = ClassRef(objXML[fields[i]]);
			}
		}

		public function clone():Object {
			return UtilFunctions.clone(this);
		}

		public function toXML():XML{
			var objXML:XML = <a/>;
			objXML.setName(getQualifiedClassName(this));
			for each( var f:String in fields){
				objXML[f] = this[f];
			}
			return objXML;
		}

	}
}
