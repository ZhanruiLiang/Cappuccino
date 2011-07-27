package {
	include "preinclude.as";

	public class Work extends Sprite{
		private var fsFlag:Boolean; // FULLSCREEN flag
		private var messager:Messager;
		private var wkspaces:Array;
		private var currentWkspace:Workspace;
		private var toolmgr:ToolManager;
		private var hinterMgr:HinterManager;
		private const fps:Number = 54;

		public function Work():void{
			//set the fullscreen flag to false

			fsFlag = false;
			//trace for debug
			addChild(Tracer.init());
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
			toolmgr.workspace = currentWkspace;
			//hinter manager
			hinterMgr = new HinterManager();
			hinterMgr.x = 100;
			hinterMgr.y = 300;
			addChild(hinterMgr);

			//start main loop
			var delta_time:Number = 1000/fps;
			var timer_mainLoop:Timer = new Timer(delta_time);
			timer_mainLoop.addEventListener(TimerEvent.TIMER, mainLoop);
			timer_mainLoop.start();


			//test
			test_init();
			//test_hinter();
		}


		private var line:OcLine;
		private var tool:Tool_Text;
		private function test_init():void{
			var myXML:XML = 
				<OcTextField>
  <name>text1</name>
  <startTime>0</startTime>
  <endTime>0</endTime>
  <page>0</page>
  <x>0</x>
  <y>0</y>
  <z>0</z>
  <rotation>0</rotation>
  <width>100</width>
  <height>25</height>
  <xscale>1</xscale>
  <yscale>1</yscale>
  <alpha>1</alpha>
  <brightness>1</brightness>
  <sharpness>1</sharpness>
  <color1>0</color1>
  <color2>0</color2>
  <fontsize>10</fontsize>
  <text>Input your contents here</text>
  <font>Arial</font>
  <bold>false</bold>
  <italic>false</italic>
  <vertical>false</vertical>
</OcTextField>;
			var myTarget:OcTextField = new OcTextField();
			myTarget.fromXML(myXML);
			
			tool = new Tool_Text("a");
			toolmgr.targets.push(myTarget);
			toolmgr.addTool(tool);
			toolmgr.changeToTool("a");
			
			var stxt:Sprite = new Sprite();
			var txt:TextField = new TextField();
			txt.width = 80;
			txt.height = 40;
			txt.text = "Change to text tool";
			stxt.addChild(txt);
			hinterMgr.addHinter(stxt);
		}

		private function test_loop():void{
			
		}

		private function test_init1():void{
			var t:OcTextField = new OcTextField("text1");
			t.text = "Input your contents here";
		}

		/*
		private function test_hinter():void{
			addEventListener(MouseEvent.CLICK, 
			  function(e:MouseEvent):void{
			  hinterMgr.addHinter(new square());
			  });
		}
		*/

		private function mainLoop(e:TimerEvent):void{
			//this is the main loop
			hinterMgr.loop();
		}

		private function response(msg:XML):void{
			Tracer.tr.text = msg.toString();
		}

		private function switchFullScreen(mEvent:MouseEvent):void{
			fsFlag = !fsFlag;
			if(fsFlag)
				stage.displayState = StageDisplayState.FULL_SCREEN;
			else
				stage.displayState = StageDisplayState.NORMAL;
		}
	}
}
