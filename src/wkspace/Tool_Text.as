package {
	include "preinclude.as";

	public class Tool_Text extends EditTool{
		public function Tool_Text(
				name:String = "Tool_Text",
				workspace:Workspace = null, 
				messager:Messager=null, 
				targets:Array=null):void{
			super(name, workspace, messager, targets);
		}

		override public function onMouseClick(event:MouseEvent):void{
			var target:OcTextField = OcTextField(targets[0]);
			trace("click at ",event.localX,event.localY);
			trace("target: ", target.toXML());

			target.x = event.localX;
			target.y = event.localY;
			target.update();
			workspace.addObj(target);
			//messager.send(target.toXML());
		}
	}
}
