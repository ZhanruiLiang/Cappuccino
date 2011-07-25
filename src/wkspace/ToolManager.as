package{
	include "preinclude.as";

	public class ToolManager{
		public var messager:Messager;
		private var tools:Array;
		private var currentTool:EditTool;
		private const eventMap:Array = 
			[[MouseEvent.CLICK, "onMouseClick"],
			[MouseEvent.DOUBLE_CLICK, "onMouseDClick"],
			[MouseEvent.MOUSE_DOWN, "onMouseDown"],
			[MouseEvent.MOUSE_MOVE, "onMouseMove"],
			[MouseEvent.MOUSE_OUT, "onMouseOut"],
			[MouseEvent.MOUSE_UP, "onMouseUp"],
			[MouseEvent.MOUSE_WHEEL, "onMouseWheel"]];

		public function ToolManager():void{
			tools = [new Tool_Text()];
			currentTool = tools[0];
		}

		public function addTool(et:EditTool):void{
			tools.push(et);
		}

		public function changeToTool(et:EditTool):void{
			try{
				for each(var pair:String in eventMap){
					currentTool.workspace.removeEventListener(pair[0],currentTool[pair[1]]);
					if(!et[pair[1]])
						throw Error(pair);
					else
						et.workspace.addEventListener(pair[0], et[pair[1]]);
				}

				et.messager = messager;
				//TODO set targets for et
			}
			catch(err:Error){
				trace(err);
			}
		}
	}
}
