package{
	include "preinclude.as";

	public class ToolManager{
		public var messager:Messager;
		private var tools:Array;
		private var currentTool:EditTool;
		private const eventMap:Array = 
			[[MouseEvent.CLICK, "onMouseClick"],
			[MouseEvent.DOUBLE_CLICK, "onMouseDClick"],
			[MouseEvent.DOWN, "onMouseDown"],
			[MouseEvent.MOVE, "onMouseMove"],
			[MouseEvent.OUT, "onMouseOut"],
			[MouseEvent.UP, "onMouseUp"],
			[MouseEvent.WHEEL, "onMouseWheel"]];

		public function ToolManager():void{
			tools = [new Tool_Text()];
			currentTool = tools[0];
		}

		public function addTool(et:EditTool):void{
			tools.push(et);
		}

		public changeToTool(et:EditTool):void{
			try{
				for each(var pair:String in eventMap){
					current.workspace.removeEventListener(pair[0]);
					if(!et[pair[1]])
						throw Error(pair);
					else
						et.workspace.addEventListener(pair[0], et[pair[1]]);
				}

				et.messager = messager;
				//TODO set targets for et
			}
			catch(err){
				trace(err);
			}
		}
	}
}
