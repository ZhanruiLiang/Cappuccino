package{
	include "preinclude.as";

	public class Test extends Sprite{
		private var tr:TraceText;
		public function Test():void{
			tr = new TraceText("Init");
			addChild(tr);

			var str:String = "<favor> <a>fuck<c>fuckfuckfuck</c></a> <b>cckk</b> </favor>";
			var myXML:XML = XML(str);
			myXML.appendChild(XML("<who>raper</who>"));

			tr.text = "X:" + myXML.toString();
		}
	}
}
