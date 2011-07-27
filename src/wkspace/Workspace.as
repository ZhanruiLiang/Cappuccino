package {
	import flash.display.*;
	import flash.text.*;
	import flash.utils.*;
	import flash.events.*;

	public class Workspace extends Sprite {
		//data
		public var objs:Array;

		//methods
		//	constructor
		public function Workspace():void{
			objs = [];
			
			with(graphics){
				lineStyle(0);
				beginFill(0x999999, 0.1);
				drawRect(5, 5, 500, 400);
				endFill();
			}
		}

		public function addObj(obj:OcObject):void{
			objs.push(obj);
			if(obj is OcDisplayObject){
				addChild((obj as OcDisplayObject).display());
			}
		}

		public function delObj(objName:String):Boolean{
			var obj:OcObject = getObjByName(objName);
			if(! obj) return false;
			objs.splice(objs.indexOf(obj),1);
			return true;
		}

		public function getObjByName(objName:String):OcObject{
			for(var i:int = 0; i < objs.length; i++)
				if(objs[i].name == objName)
					return objs[i];
			return null;
		}

		//	update the objects' order
		public function update():void{
			for(var i:int = 0; i < numChildren; i++){
				removeChildAt(i);
			}
			objs.sort(objDepthCompare);
			for each(var obj:OcObject in objs){
				if(obj is OcDisplayObject){
					OcDisplayObject(obj).update();
					addChild(OcDisplayObject(obj).display());
				}
			}
			//TODO: some objs should be hid;
		}

		private function objDepthCompare(a:OcObject,b:OcObject):int{
			// a < b , -1
			// b < a , 1
			// a = b , 0
			if(! (a is OcDisplayObject)) return -1;
			else if(!(b is OcDisplayObject)) return 1;
			else{
				var res:int = OcDisplayObject(a).z-OcDisplayObject(b).z;
				if(res > 0) return  1;
				else if(res < 0) return -1;
				else return 0;
			}
		}
	}
}
