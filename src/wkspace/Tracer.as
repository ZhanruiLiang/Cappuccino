package{
	include "preinclude.as";

	public class Tracer{
		public static var tr:TextField;

		public static function init():TextField{
			tr = new TextField();
			with(tr){
				x = 10; y = 10;
				width = 150;
				height = 100;
				text = "Tracer:";
			}
			return tr;
		}

		public static function trace(x:Object){
			if(tr)
				tr.text += String(x);
		}

		public static function clear():void{
			if(tr)
				tr.text = "Tracer:";
		}
	}
}
