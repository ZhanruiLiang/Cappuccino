package{
	include "preinclude.as";

	public class Workspace extends Sprite implements IDisplayable{
		//data
		public var objs:Array;

		//member
		public function Workspace():void{
		}

		public function addObj(obj:OcObject):void{
		}

		public function delObj(objName:String):Boolean{
		}

		public function getObjByName(objName:String):OcObject{
		}

		//	display
		public function update():void{
		}
		public function display():DisplayObject{
			return this;
		}

		private function objDepthCompare(a,b:OcObject):int{
			// a < b , -1
			// b < a , 1
			// a = b , 0
			if(! (a is IDisplayable)) return -1;
			else if(!(b is IDisplayable)) return 1;
			else{
				var res:int = a.z-b.z;
				if(res > 0) return  1;
				else if(res < 0) return -1;
				else return 0;
			}
		}
	}
}
