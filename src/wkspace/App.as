<?xml version="1.0"?>
<mx:Application xmlns:mx="ray">
	<mx:Script>
		<![CDATA[
		import mx.core.*;
		import flash.display.*;

	public class App extends Sprite
	{
		[Embed(source="res.swf", symbol="star")]
			private var Star:Class;

		[Embed(source="res.swf", symbol="square")]
			private var Square:Class;

		[Embed(source="res.swf", symbol="circle")]
			private var Circle:Class;

		private function init():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align=StageAlign.TOP_LEFT;

			var star:Sprite = new Star();
			addChild(star);
			star.x = 100;
			star.y = 100;

			var square:Sprite = new Square();
			addChild(square);
			square.x = 200;
			square.y = 100;

			var circle:Sprite = new Circle();
			addChild(circle);
			circle.x = 300;
			circle.y = 100;
		}

		public function App():void{
			init();
		}
	}
	]]>

	</mx:Script>
</mx:Application>