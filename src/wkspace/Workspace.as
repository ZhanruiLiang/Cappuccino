package {
	import flash.display.*;
	import flash.text.*;
	import flash.utils.*;
	import flash.events.*;

	public class Workspace extends Sprite {
		//data
		public var objs:Array;
		public var left:Number, right:Number, bottom:Number, top:Number;

		//methods
		//	constructor
		public function Workspace():void{
			objs = [];
			
			var width0:Number = 550;
			var height0:Number = 400;
			var blurX:Number, blurY:Number;
			
			blurX = 4;
			blurY = 3;
			
			left = (Work.outerWidth- width0)/2;
			right = left + width0;
			top = (Work.outerHeight- height0)/2;
			bottom = top + height0;
			
			with(graphics){
				beginFill(0xFFFFFF, 0);
				drawRect(0, 0, Work.outerWidth, Work.outerHeight);
				endFill();

				beginFill(0x9c9c9c, 0.5);
				drawRoundRect(left-blurX, top-blurY,
						width0 + 2 * blurX,
						height0 + 2 * blurY,
						blurX, blurY);
				endFill();

				beginFill(0xEEEEEE, 1);
				drawRect(left, top, width0, height0);
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
