package{
	public class OcObject{
		//data
		public var name:String;
		public var startTime,endTime:int;
		public var page:uint;

		//member
		public function OcObject(name0:String):void{
			name = name0;
		}

		public function toXML():XML{
			var objXML:XML = 
				<OcObject>
					<name>{name}</name>
					<startTime>{startTime}</startTime>
					<endTime>{endTime}</endTime>
					<page>{page}<page>
				</OcObject>
		}
	}
}
