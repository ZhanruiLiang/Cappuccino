package{
	include "preinclude.as";

	public class Work extends Sprite{
		private var tr:TraceText; 
		private var fsFlag:Boolean; // FULLSCREEN flag
		private var messager:Messager;

		public function Work():void{
			//set the fullscreen flag to false
			tr = new TraceText("Init");
			fsFlag = false;
			tr.addEventListener(MouseEvent.CLICK, switchFullScreen);
			//trace for debug
			addChild(tr);
			//
			messager = new Messager;
			messager.setResponseFunc(response);
		}

		private function response(msg:XML):void{
			tr.text = msg.toString();
		}

		private function switchFullScreen(mEvent:MouseEvent):void{
			fsFlag = !fsFlag;
			tr.text = String(fsFlag);
			if(fsFlag)
				stage.displayState = StageDisplayState.FULL_SCREEN;
			else
				stage.displayState = StageDisplayState.NORMAL;
		}
	}
}
