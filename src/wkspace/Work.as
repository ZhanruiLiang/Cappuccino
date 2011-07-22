package{
	include "preinclude.as";

	public class Work extends Sprite{
		private var tr:TraceText; 
		private var fsFlag:Boolean; // FULLSCREEN flag

		public function Work():void{
			fsFlag = false;
			tr = new TraceText("Init");
			addChild(tr);
			tr.addEventListener(MouseEvent.CLICK, switchFullScreen);
			parent.addChild(this);
			register_func();
		}

		private function switchFullScreen(mEvent:MouseEvent):void{
			fsFlag = !fsFlag;
			tr.text = String(fsFlag);
			if(fsFlag)
				stage.displayState = StageDisplayState.FULL_SCREEN;
			else
				stage.displayState = StageDisplayState.NORMAL;
		}

		private function isReady():Boolean{
			return Boolean(ExternalInterface.call("getIsReady"));
		}

		private function tryRegister(e:TimerEvent):void{
			if(ExternalInterface.available && isReady()){
				ExternalInterface.addCallback("recieveMsg", recieveMsg);
				Timer(e.target).stop();
			}
		}

		private function recieveMsg(msg:String):void{
			responseMsg(msg);
		}

		private function responseMsg(msg:String):void{
			tr.text = msg;
		}

		private function register_func():void{
			var timer_addCall:Timer = new Timer(500);
			timer_addCall.addEventListener(TimerEvent.TIMER, tryRegister);
			timer_addCall.start();
		}
	}
}
