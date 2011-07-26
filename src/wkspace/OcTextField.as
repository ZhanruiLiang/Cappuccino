package {
	import flash.display.*;
	import flash.text.*;

	public class OcTextField extends OcDisplayObject{
		//data
		public var fontsize:uint,
			   text:String,
			   font:String,
			   bold:Boolean,
			   italic:Boolean,
			   vertical:Boolean;
		//member
		public function OcTextField(name0:String=null):void{
			super(name0);
			fields.push("fontsize", "text", "font", "bold", "italic", "vertical");
			types.push("uint", "String", "String", "Boolean", "Boolean", "Boolean");
			fontsize = 10;
			font = "Arial";
			text = "";
			bold = false;
			italic = false;
			vertical = false;
			_disp = new TextField();
			(_disp as TextField).border = true; // TODO: remove this
		}

		override public function update():void{
			with(_disp){
				text = this.text;
				x = this.x;
				y = this.y;
				width = this.width;
				height = this.height;
			}
		}
	}
}
