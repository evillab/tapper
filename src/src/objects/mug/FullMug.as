package objects.mug
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import events.GameLostEvent;
	
	import objects.customer.Customer;
	
	import resources.Assets;
	
	import starling.display.Image;
	
	
	public class FullMug extends Mug
	{
		private var deleteTimer:Timer = new Timer(500,1);
		private var _whichCustomer:uint;
		
		public function FullMug():void
		{
			super();
		}
		
		override protected function drawMug():void
		{
			_mugImage = new Image(Assets.getTexture("MugFull"));			
			super.drawMug();			
			deleteTimer.addEventListener(TimerEvent.TIMER_COMPLETE, removeTimerMe);
		}
		/**
		 * usuwanie kufla
		 */
		private function removeTimerMe(e:TimerEvent=null):void
		{			
			deleteTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, removeTimerMe);
			deleteMe(true);		
		}
		override public function deleteMe(gameLost:Boolean=false):void
		{			
			if (gameLost)
				dispatchEvent(new GameLostEvent(GameLostEvent.LOST_EVENT,GameLostEvent.MUG_TABLE_END, true)); //dispatch przed usunięciem!
			super.deleteMe(gameLost);
			
		}
		public function checkCollision(customerVector:Vector.<Customer>):void
		{
			var custLength:uint = customerVector.length;			
			for (var i:uint; i<custLength; i++)
			{				
					if(Math.abs((customerVector[i].x+customerVector[i].width)-this.x)<4)
					{
						if (customerVector[i].drinking==false)
						{
							_whichCustomer = i;						
							_touched = true;
							return;
						}
					}
			}			
		}
		
		public function crashFull():void
		{
			this.visible=true;			
			deleteTimer.start();			
		}

		public function get whichCustomer():uint
		{
			return _whichCustomer;
		}

				public function set whichCustomer(value:uint):void
		{
			_whichCustomer = value;
		}

	}
}