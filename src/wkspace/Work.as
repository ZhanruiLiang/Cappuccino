package {
	include "preinclude.as";
	//[SWF(width="20", height="400", frameRate="24", backgroundColor="0x00aa00")];
	public class Work extends Sprite{
		private var fsFlag:Boolean; // FULLSCREEN flag
		private var messager:Messager;
		private var wkspaces:Array;
		private var currentWkspace:Workspace;
		private var toolmgr:ToolManager;
		private var hinterMgr:HinterManager;
		//const
		private const fps:Number = 54;
		public static const outerWidth:int = 965,
			   outerHeight:int = 565;

		public function Work():void{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			//set the fullscreen flag to false
			fsFlag = false;
			//messager
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
			//	add the Tool_Text to toolmgr
			toolmgr.addTool(new Tool_Text());
			toolmgr.addTool(new Tool_Line());

			//hinter manager
			hinterMgr = new HinterManager();
			hinterMgr.x = 100;
			hinterMgr.y = 300;
			addChild(hinterMgr);
			//tracer for debug
			addChild(Tracer.init());

			//start main loop
			var delta_time:Number = 1000/fps;
			var timer_mainLoop:Timer = new Timer(delta_time);
			timer_mainLoop.addEventListener(TimerEvent.TIMER, mainLoop);
			timer_mainLoop.start();

			//test
			test_tools_init();
			//test_response();
			//test_hinter();
		}

		private var btns:Array;
		private function test_tools_init():void{
			var btn_size:Number = 30;
			var btn_x0:Number = stage.stageWidth - btn_size * 2.2;
			var btn_y0:Number = btn_size * 0.2;

			btns = [];
			var btn_text:Button = new Button();
			btn_text.label = "Text";
			addChild(btn_text);
			btns.push(btn_text);

			var btn_line:Button = new Button();
			btn_line.label = "Line";
			addChild(btn_line);
			btns.push(btn_line);


			//stuff after click the button
			function click_btn_text(e:MouseEvent):void{
				//step 1
				toolmgr.changeToTool("Tool_Text");
				//step 2, prepare the object
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
				var myTarget:OcTextField = new OcTextField(myXML);
				//step 3
				toolmgr.clearTarget();
				toolmgr.addTarget(myTarget);
			}

			function click_btn_line(e:MouseEvent):void{
				toolmgr.changeToTool("Tool_Line");
				var myTarget = new OcLine();
				with(myTarget){
					thickness = 3;
					lineStyle = OcLine.LS_NORMAL;
				}
				toolmgr.clearTarget();
				toolmgr.addTarget(myTarget);
				trace(myTarget.toXML());
			}

			btn_text.addEventListener(MouseEvent.CLICK, click_btn_text);
			btn_line.addEventListener(MouseEvent.CLICK, click_btn_line);


			//adjust the buttons' position
			for(var i:int = 0; i < btns.length; i++){
				with(btns[i] as Button){
					width = btn_size*2;
					height = btn_size;
					x = btn_x0;
					y = btn_y0 + i * 1.2 * btn_size;
				}
			}
		}

		private var tool:Tool_Text;
		private function test_init():void{
			
		}

		private function test_response():void{
			var myXML:XML = 
<root>
	<type> MODE </type>
	<toolName> 
		Tool_Line 
	</toolName>
	<param>
		<OcLine>
			<name>line1</name>
			<startTime>0</startTime>
			<endTime>0</endTime>
			<page>0</page>
			<x>0</x>
			<y>0</y>
			<z>0</z>
			<rotation>0</rotation>
			<width>0</width>
			<height>0</height>
			<xscale>1</xscale>
			<yscale>1</yscale>
			<alpha>1</alpha>
			<brightness>1</brightness>
			<sharpness>1</sharpness>
			<color1>0</color1>
			<x1>0</x1>
			<y1>0</y1>
			<x2>0</x2>
			<y2>0</y2>
			<thickness>3</thickness>
			<lineStyle>0</lineStyle>
			<arrowStyle>0</arrowStyle>
		</OcLine>
	</param>
	</root>
			response(myXML);
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
			if(msg.type.text().toString() == "MODE"){
				//change mode
				toolmgr.changeToTool(msg.toolName.text());
				//clear targets
				toolmgr.clearTarget();
				//prepare new targets
				for each(var param:XML in msg.param.elements()){
					trace(param.name());
					var objType:Class = getDefinitionByName(param.name()) as Class;
					toolmgr.addTarget(new objType(param));
				}
			}
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
