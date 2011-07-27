package {
	/*
	   The EditTool , the base class of all other edit tools.
	   Each tool is linked to a workspace, it works there. It use a messager to send messages, it will send a message about what it has done when finish editing. 
	   Something important is that a edit tool will never create a target, it only modifies the target in the targets Array

	   */
	public class EditTool{
		include "preinclude.as";

		/*link to this workspace
		   */
		public var workspace:Workspace;

		/*The targets to be modified
		  */
		public var targets:Array;

		/*The messager, to send out message, when something is done. 
		   */
		public var messager:Messager;
		
		public var name:String;


		public function EditTool(
				name:String = "EditTool",
				workspace:Workspace = null, 
				messager:Messager=null, 
				targets:Array=null):void{

			this.name = name;
			this.workspace = workspace;
			this.messager = messager;
			this.targets = targets;
		}


		public function onMouseDown(event:MouseEvent):void{
		}
		public function onMouseMove(event:MouseEvent):void{
		}
		public function onMouseUp(event:MouseEvent):void{
		}
		public function onMouseOut(event:MouseEvent):void{
		}
		public function onMouseClick(event:MouseEvent):void{
		}
		public function onMouseDClick(event:MouseEvent):void{
		}
		public function onMouseWheel(event:MouseEvent):void{
		}
	}
}
