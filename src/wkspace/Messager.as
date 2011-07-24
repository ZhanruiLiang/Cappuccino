package {
	import flash.utils.*;
	import flash.events.*;
	import flash.external.ExternalInterface;
	import flash.system.Security;

	public class Messager{
		private var responseFunc:Function;
		// Constructor
		public function Messager():void{
			var timer_addCall:Timer = new Timer(500);
			timer_addCall.addEventListener(TimerEvent.TIMER, tryRegister);
			timer_addCall.start();
		}

		public function setResponseFunc(func:Function):void{
			responseFunc = func;
		}

		private function isReady():Boolean{
			return Boolean(ExternalInterface.call("getIsReady"));
		}
		private function tryRegister(e:TimerEvent):void{
			if(ExternalInterface.available && isReady()){
				ExternalInterface.addCallback("recieveMsg", recieveMsg);
				Timer(e.target).stop();
			}
		}

		private function recieveMsg(msg:*):void{
			responseFunc(XML(msg));
		}
	}
}
