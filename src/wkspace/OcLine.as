﻿package {
	import flash.display.*;

	public class OcLine extends OcDisplayObject{
		public var x1:Number,y1:Number,x2:Number,y2:Number,
			   thickness:Number,
			   lineStyle:uint,
			   arrowStyle:uint;
		//lineStyle const
		public const LS_NORMAL:uint = 0;
		//arrowStyle const
		public const AS_NONE:uint = 0;
		public const AS_POINTER:uint = 1;

		//methods
		//TODO: rearrange the x,y,z... attributes
		public function OcLine(objXML:XML = null):void{
			fields.push("x1", "y1", "x2", "y2", "thickness", "lineStyle", "arrowStyle");
			types.push("Number", "Number", "Number", "Number", "Number", "uint", "uint");
			var pos:int = fields.indexOf("color2");
			fields.splice(pos,1);
			types.splice(pos,1);

			if(!objXML){
				x1 = y1 = x2 = y2 = 0;
				thickness = 1;
				lineStyle = LS_NORMAL;
				arrowStyle = AS_NONE;
				_disp = new Sprite();
				with(_disp){
					x = 0; y = 0;
				}
			}
			else{
				fromXML(objXML);
				_disp = new Sprite();
				update();
			}
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
		override public function update():void{
			with(Sprite(_disp).graphics){
				clear();
				lineStyle(thickness, color1, alpha, 
						false, 
						LineScaleMode.NORMAL,
						CapsStyle.SQUARE,
						JointStyle.BEVEL);
				moveTo(x1, y1);
				lineTo(x2, y2);
			}
			if(arrowStyle != AS_NONE)
				drawArrow(Sprite(_disp).graphics);
		}

		protected function drawArrow(graphics:Graphics):void{
			with(graphics){
				if(arrowStyle == AS_POINTER){
					//TODO: add a arrow shape
				}
			}
		}
	}// end of class OcLine
}
