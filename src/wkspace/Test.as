package{
	include "preinclude.as";

	public class Test extends Sprite{
		private var tr:TraceText;
		public function Test():void{
			tr = new TraceText("Init");
			addChild(tr);

			var myXML:XML= 
				<favor> 
					<a>
						<c>fuckfuckfuck</c>
					</a>
					<b>cckk</b>
				</favor>;

			//myXML.appendChild(XML("<who>raper</who>"));
			myXML.who = "raper";
			myXML.setName("fffff");

			tr.text = "X:" + myXML.toString();

			tr.text = "";
			var arr:Array;
			arr = [ 1, 5 ,2];
			arr.sort();
			tr.text = String(arr);

			var a,b:int;
			tr.text = typeof b;
		}
	}
}
