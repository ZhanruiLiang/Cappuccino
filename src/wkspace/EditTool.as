package {
	public class EditTool{
		include "preinclude.as";

		/*link to this workspace
		   */
		public var workspace:Workspace;

		/*The targets to be created
		  */
		public var targets:Array;

		/*The messager, to send out message 
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
