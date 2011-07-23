package{
	include "preinclude.as";

	public class OcTextField extends OcDisPlayObject{
		//data
		public var fontsize:uint,
			   text:String,
			   font:String,
			   bold,italic,vertical:Boolean;
		//member
		public function OcTextField():void{
			fontsize = 10;
			font = "Arial";
			bold = false;
			italic = false;
			vertical = false;
			_disp = new TextField();
		}

		override public function update():void{
			with(_disp){
				x = this.x;
				y = this.y;
				width = this.width;
				height = this.height;
			}
		}
	}
}
