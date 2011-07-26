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
		public function OcObject(name0:String = ""):void{
			name = name0;
			startTime = endTime = page = 0;
			fields.push("name", "startTime", "endTime", "page");
			types.push("String", "int", "int", "uint");
		}

		public function toXML():XML{
			var objXML:XML = <a/>;
			objXML.setName(getQualifiedClassName(this));
			for each( var f:String in fields){
				objXML[f] = this[f];
			}
			return objXML;
		}

		public function fromXML(objXML:XML):Boolean{
			for each(var node:XML in objXML.children()){
				trace(node.name());
				if(!hasOwnProperty(node.name()))
					return false;
			}
			for(var i:int = 0; i < fields.length; i++){
				var v:*;
				switch(types[i]){
					case "int": v = int(objXML[fields[i]]); break;
					case "uint": v = uint(objXML[fields[i]]); break;
					case "Number": v = Number(objXML[fields[i]]); break;
					case "Boolean": v = Boolean(objXML[fields[i]]); break;
					case "String": v = String(objXML[fields[i]]); break;					
				}
				trace(fields[i],types[i]);
				this[fields[i]] = v;
				
			}
			return true;
		}
	}
}
