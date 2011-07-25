package{
	include "preinclude.as";

	/* The hinter manager
	 */

	public class HinterManager extends Sprite{
		protected var hinters:Array;
		protected const SEP:Number = 5;

		public function HinterManager():void{
			hinters = [];
		}

		public function loop():void{
			var last:Hinter = null;
			for each(var h:Hinter in hinters){
				if(h.stopped)
				{
					hinters.splice(hinters.indexOf(h),1);
					removeChild(h);
				}
				else{
					if(last == null )
						h.x = h.y = 0;
					else{
						h.x = last.x + last.width + SEP;
						h.y = 0;
					}
					last = h;
				}
			}
		}

		public function addHinter(content:Sprite):void{
			var hinter:Hinter = new Hinter(content);
			if(hinters.length > 0){
				var last:Hinter = hinters[hinters.length-1];
				hinter.x = last.x + last.width + SEP;
				hinter.y = 0;
			}else{
				hinter.x = 0;
				hinter.y = 0;
			}
			hinters.push(hinter);
			addChild(hinter);
		}
	}
}
