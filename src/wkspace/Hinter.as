package{
	include "preinclude.as";

	/* The hinter, usage: 
	 * 		var ht:Hinter = new Hinter(mySprite);
	 */
	public class Hinter extends Sprite{
		protected var t1:Number, t2:Number, t3:Number, tNow:Number;
		protected var delta_t:Number;

		protected var _content:Sprite;
		protected var _stop:Boolean;

		public function Hinter(content0:Sprite = null,
				dt:Number = 1000.0/24):void{
			delta_t = dt;
			_content = content0;
			with(_content){
				x = -width/2;
				y = -height/2;
			}
			addChild(_content);
			loop();

			t1 = 900;
			t2 = t1 + 3000;
			t3 = t2 + 500;

			tNow = 0;
			_stop = false;
		}

		public function set content(newContent:Sprite):void{
			removeChild(_content);
			_content = newContent;
			addChild(_content);
		}

		public function get stopped():Boolean{
			return _stop;
		}

		protected function func1(t:Number):Number{
			if(t < t1)
				return t*0.8/t1;
			else if(t < t2)
				return 0.8;
			else if(t < t3){
				var a:Number, b:Number;
				a = 0.8/(t2-t3);
				b = 0.8 - a * t2;
				return a*t+b;
			}else 
				return 0;
		}

		public function loop():void{
			var c:Number = func1(tNow);
			alpha = c;
			scaleX = c;
			scaleY = c;

			if(tNow > t3){
				_stop = true;
			}
			tNow += delta_t;
		}

		
	}
}
