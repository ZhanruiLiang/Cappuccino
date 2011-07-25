package {
	include "preinclude.as";

	public class Work extends Sprite{
		//tr just for debug 
		private var tr:TraceText; 

		private var fsFlag:Boolean; // FULLSCREEN flag
		private var messager:Messager;
		private var wkspaces:Array;
		private var currentWkspace:Workspace;
		private var toolmgr:ToolManager;
		private var hinterMgr:HinterManager;
		private const fps:Number = 54;

		public function Work():void{
			//set the fullscreen flag to false
			tr = new TraceText("Init");
			
			fsFlag = false;
			//trace for debug
			trace("aaaaa-------------------");
			addChild(tr);
			//
			messager = new Messager;
			messager.setResponseFunc(response);
			//workspace
			wkspaces = [];
			currentWkspace = new Workspace();
			addChild(currentWkspace);
			wkspaces.push(currentWkspace);
			//tool manager
			toolmgr = new ToolManager();
			toolmgr.messager = messager;
			//hinter manager
			hinterMgr = new HinterManager();
			addChild(hinterMgr);

			//start main loop
			var delta_time:Number = 1000/fps;
			var timer_mainLoop:Timer = new Timer(delta_time);
			timer_mainLoop.addEventListener(TimerEvent.TIMER, mainLoop);
			timer_mainLoop.start();


			//test
			test_init1();
		}


		private var line:OcLine;
		private function test_init():void{
			line = new OcLine();
			line.thickness = 12;
			line.color1 = 0xFF0033;
			line.update();
			currentWkspace.addObj(line);
		}

		private function test_loop():void{
			line.x1 = line.display().mouseX;
			line.y1 = line.display().mouseY;
			line.update();
		}

		private function test_init1():void{
			addEventListener(MouseEvent.CLICK, 
					function(e:MouseEvent):void{
						hinterMgr.addHinter(new Square(66,66));
					});
			tr.width = 100;
			tr.height = 18;
			tr.text = "Click to add a hinter";
		}

		private function mainLoop(e:TimerEvent):void{
			//this is the main loop
			//test_loop();
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
