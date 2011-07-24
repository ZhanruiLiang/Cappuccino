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

		//member
		public function OcObject(name0:String = ""):void{
			name = name0;
			startTime = endTime = page = 0;
			fields.push("name");
			fields.push("startTime");
			fields.push("endTime");
			fields.push("page");
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
			for each(var node:XML in objXML){
				if(!hasOwnProperty(node.name()))
					return false;
			}
			for each(node in objXML){
				this[node.name()] = node[node.name()];
			}
			return true;
		}
	}
}
