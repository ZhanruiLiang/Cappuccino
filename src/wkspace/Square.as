package{
	include "preinclude.as";

	public class Square extends Sprite{
		public function Square(w:Number = 0, h:Number = 0):void{
			with(this.graphics){
				lineStyle(1);
				beginFill(0x2200FF, 0.7);
				drawRect(0, 0, w, h);
				endFill();
			}
		}
	}
}
