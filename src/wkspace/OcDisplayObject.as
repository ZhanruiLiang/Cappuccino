package{
	public class OcDisPlayObject extends OcObject implements IDisplayable{
		//data members
		public var x,y,z,
			   rotation:Number;
		protected var _width,_height,_xscale,_yscale:Number;
		protected var _disp:DisplayObject;
		public var alpha,bright,sharp:Number;
		public var color1,color2:uint;

		//methods
		public function OcDisPlayObject():DisplayObject{
			x = 0;
			y = 0;
			z = 0;
			rotation = 0;
			width = 0;
			height = 0;
			xscale = 1;
			yscale = 1;
			alpha = 1;
			bright = 1;
			sharp = 1;
			color1 = color2 = 0x000000;
		}

		public function update():void{
		}

		public function display():DisplayObject{
			return _disp;
		}

		public function set width(v:Number):void{
		}
		public function set height(v:Number):void{
		}
		public function set xscale(v:Number):void{
		}
		public function set yscale(v:Number):void{
		}

		public function get width():Number{
		}
		public function get height():Number{
		}
		public function get xscale():Number{
		}
		public function get yscale():Number{
		}
	}
}
