package{
	include "preinclude.as";

	public class Test extends Sprite{
		private var tr:TraceText;
		[Embed( source = "res.swf" )]
			private var Res:Class;

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

			//var pic:BitmapAsset = new PicMother() as BitmapAsset;
			//addChild(pic);
			var mov:Sprite = new Res() as Sprite;
			addChild(mov);
		}

	}
}
