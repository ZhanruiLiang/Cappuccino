package{
	include "preinclude.as";

	public class ToolManager{
		/*link to this workspace
		   */
		public var workspace:Workspace;

		/*The targets to be created
		  */
		public var targets:Array;

		/* use this massager to send message
		*/
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
			workspace = null;
			targets = [];
			tools = [];
		}

		public function clearTarget():void{
			targets = [];
			if(currentTool) currentTool.targets = targets;
		}

		public function addTarget(target:OcObject):void{
			//targets.push(target.clone() as OcObject);
			targets.push(target);
		}

		public function addTool(et:EditTool):void{
			tools.push(et);
			et.workspace = workspace;
			et.messager = messager;
			et.targets = targets;
		}

		public function changeToTool(toolName:String):void{
			if(currentTool)
				cancelTool(currentTool);
			currentTool = null;
			
			var tool:EditTool;
			for each(var t:EditTool in tools){
				if(t.name == toolName){
					tool = t; break;
				}
			}
			
			if(tool){
				applyTool(tool);
				currentTool = tool;
			}			
		}
		private function cancelTool(tool:EditTool):void{
			for each(var pair:Array in eventMap){
					tool.workspace.removeEventListener(pair[0],tool[pair[1]]);
			}
		}
		private function applyTool(tool:EditTool):void{
			tool.workspace = workspace;
			tool.targets = targets;
			tool.messager = messager;
			for each(var pair:Array in eventMap){
				tool.workspace.addEventListener(pair[0], tool[pair[1]]);
				trace("pair ",pair[0], tool[pair[1]])
			}
		}
	}
}
