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
		public function OcTextField(objXML:XML = null):void{
			fields.push("fontsize", "text", "font", "bold", "italic", "vertical");
			types.push("uint", "String", "String", "Boolean", "Boolean", "Boolean");

			if(objXML){
				fromXML(objXML);
				_disp = new TextField();
				update();
			}else{
				fontsize = 10;
				font = "Arial";
				text = "";
				bold = false;
				italic = false;
				vertical = false;
				_disp = new TextField();
			}
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
