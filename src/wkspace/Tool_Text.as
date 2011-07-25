package {
	include "preinclude.as";

	public class Tool_Text extends EditTool{
		public function Tool_Text(
				workspace:Workspace = null, 
				messager:Messager=null, 
				targets:Array=null):void{
			super(workspace, messager, targets);
		}

		override public function onMouseClick(event:MouseEvent):void{
			var target:OcTextField = OcTextField(target[0]);
			target.x = event.localX;
			target.y = event.localY;
			target.update();
			workspace.addObj(target);
			messager.send(target.toXML());
		}
	}
}
