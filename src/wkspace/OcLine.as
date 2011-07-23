package{
	include "preinclude.as";

	public class OcLine extends OcDisPlayObject{
		public var x1,y1,x2,y2:Number,
			   thick:Number,
			   lineStyle,
			   arrowStyle:String;
		//lineStyle const
		const public var LS_NORMAL:uint = 0;
		//arrowStyle const
		const public var AS_NONE:uint = 0;
		const public var AS_POINTER:uint = 1;

		public function OcLine():void{
			x1 = y1 = x2 = y2 = 0;
			thick = 1;
			lineStyle = LS_NORMAL;
			arrowStyle = AS_NONE;
		}
/*public function lineStyle(
	thickness:Number = NaN,
	color:uint = 0,
	alpha:Number = 1.0,
	pixelHinting:Boolean = false, 
	scaleMode:String = "normal", 
	caps:String = null, 
	joints:String = null,
	miterLimit:Number = 3):void
  */
		override function update():void{
			with(_disp.graphics){
				clear();
				lineStyle(thick, color1, alpha);
				moveTo(x1, y1);
				lineTo(x2, y2);
			}
			drawArrow(_disp.graphics);
		}

		protected function drawArrow(graphics:Graphics):void{
			with(graphics){
				if(arrowStyle == LS_NONE){
					//none 
				}else if(arrowStyle == LS_POINTER){
					//TODO: add a arrow shape
				}
			}
		}
	}
}
