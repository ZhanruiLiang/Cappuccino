package {
	import flash.display.*;
	public class OcDisplayObject extends OcObject {
		//data members
		public var x:Number,y:Number,z:Number,
			   rotation:Number;
		protected var _width:Number,
				  _height:Number,
				  _xscale:Number,
				  _yscale:Number;
		public var alpha:Number,
			   brightness:Number,
			   sharpness:Number;
		public var color1:uint,
			   color2:uint;

		/*
		   attention, fromXML() should be overloaded
		   */
		protected var _disp:DisplayObject; // this should alloc memory by derive classes 

		//methods
		public function OcDisplayObject(objXML:XML = null):void{
			fields.push("x", "y", "z", "rotation", "width", "height", "xscale", "yscale", "alpha", "brightness", "sharpness", "color1", "color2");
			types.push("Number","Number","Number","Number","Number","Number","Number","Number","Number","Number","Number","uint","uint");

			if(objXML){
				fromXML(objXML);
			}else{
				x = 0;
				y = 0;
				z = 0;
				rotation = 0;
				_width = 0;
				_height = 0;
				_xscale = 1;
				_yscale = 1;
				alpha = 1;
				brightness = 1;
				sharpness = 1;
				color1 = color2 = 0x000000;
			}
		}

		public function update():void{
			_disp.x = x;
			_disp.y = y;
			_disp.rotation = rotation;
			_disp.scaleX = xscale;
			_disp.scaleY = yscale;
			_disp.alpha = alpha;
		}

		public function display():DisplayObject{
			return _disp;
		}

		//TODO: modify the setters
		public function set width(v:Number):void{
			_width = v;
		}
		public function set height(v:Number):void{
			_height = v;
		}
		public function set xscale(v:Number):void{
			_xscale = v;
		}
		public function set yscale(v:Number):void{
			_yscale = v;
		}

		public function get width():Number{
			return _width;
		}
		public function get height():Number{
			return _height;
		}
		public function get xscale():Number{
			return _xscale;
		}
		public function get yscale():Number{
			return _yscale;
		}
	}
}
