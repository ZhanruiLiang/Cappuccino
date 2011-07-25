package{
	include "preinclude.as";

	/* The hinter, usage: 
	 * 		var ht:Hinter = new Hinter(mySprite);
	 */
	public class Hinter extends Sprite{
		protected var t1:Number, t2:Number, t3:Number, tNow:Number,
				timer_loop:Timer;
		protected var delta_t:Number;

		protected var _content:Sprite;
		protected var _stop:Boolean;

		public function Hinter(content0:Sprite = null,
				dt:Number = 1000.0/24):void{
			delta_t = dt;
			content = content0;

			t1 = 700;
			t2 = t1 + 2500;
			t3 = t2 + 800;

			tNow = 0;
			timer_loop = new Timer(delta_t);
			timer_loop.addEventListener(TimerEvent.TIMER, func_loop);
			timer_loop.start();
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

		protected function func_loop(event:TimerEvent):void{
			var c:Number = func1(tNow);
			_content.alpha = c;
			_content.scaleX = c;
			_content.scaleY = c;

			if(c < 0.001){
				timer_loop.removeEventListener(TimerEvent.TIMER, func_loop);
				timer_loop.stop();
				_stop = true;
			}
		}

		
	}
}
