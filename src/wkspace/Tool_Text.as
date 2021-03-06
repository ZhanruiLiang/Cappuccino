﻿package {
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
			if(dragging) return;
			var target:OcTextField = targets[0] as OcTextField;

			p1 = workspace.globalToLocal(new Point(event.stageX, event.stageY));
			target.x = p1.x;
			target.y = p1.y;
			with(target.display() as TextField){
				selectable = false;
				editable = false;
				border = true;
			}
			//TODO: egg pain ..... remove this 
			target.text = "x,y = " + target.x + ' ' + target.y;
			//
			target.update();
			workspace.addObj(target);
			//send the ADD msg
			//TODO
			// send the finish message
			//TODO
		}

		private var p1:Point, p2:Point,
				dragging:Boolean = false;

		override public function onMouseDown(event:MouseEvent):void{
			dragging = false;
			onMouseClick(event);
			dragging = true;
		}

		override public function onMouseMove(event:MouseEvent):void{
			if(dragging){
				p2 = workspace.globalToLocal(new Point(event.stageX, event.stageY));
				var target:OcTextField = targets[0] as OcTextField;
				target.width = p2.x - p1.x;
				target.height = p2.y - p1.y;
				target.update();
				//send the msg
				//TODO
			}
		}

		override public function onMouseUp(event:MouseEvent):void{
			if(!dragging) return;
			dragging = false;

			var target:OcTextField = targets[0] as OcTextField;
			with(target.display() as TextField){
				//editable = true;
				border = false;
			}
			//send the ADD msg
			//TODO
			//send the finish msg
			//TODO
		}
	}
}
