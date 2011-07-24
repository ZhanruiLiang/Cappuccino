package {
	include "preinclude.as";

	public class Work extends Sprite{
		private var tr:TraceText; 
		private var fsFlag:Boolean; // FULLSCREEN flag
		private var messager:Messager;
		private var wkspc:Workspace;
		private var tool1:EditTool;
		private const fps:Number = 54;

		public function Work():void{
			//set the fullscreen flag to false
			tr = new TraceText("Init");
			fsFlag = false;
			//trace for debug
			addChild(tr);
			//
			messager = new Messager;
			messager.setResponseFunc(response);
			//workspace
			wkspc = new Workspace();
			addChild(wkspc);

			//start main loop
			var delta_time:Number = 1000/fps;
			var timer_mainLoop:Timer = new Timer(delta_time);
			timer_mainLoop.addEventListener(TimerEvent.TIMER, mainLoop);
			timer_mainLoop.start();


			//test
			test_init();
		}


		private var line:OcLine;
		private function test_init():void{
			line = new OcLine();
			line.thickness = 12;
			line.color1 = 0xFF0033;
			line.update();
			wkspc.addObj(line);
		}

		private function test_loop():void{
			line.x1 = line.display().mouseX;
			line.y1 = line.display().mouseY;
			line.update();
		}

		private function mainLoop(e:TimerEvent):void{
			//this is the main loop
			test_loop();
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
