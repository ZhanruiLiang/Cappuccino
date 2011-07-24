package {
	include "preinclude.as";

	public class Tool_Text extends EditTool{
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
