package objects
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import events.GameLostEvent;
	
	import objects.customer.Customer;
	
	import resources.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Mug extends Sprite
	{
		private var deleteTimer:Timer = new Timer(500,1);
		private var _whichCustomer:uint;
		private var _touched:Boolean=false;
		private var _switchMugTime:Number=0;
		
		public function Mug():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			drawMug();
		}
		
		private function drawMug():void
		{
			var mugFullImage:Image = new Image(Assets.getTexture("MugFull"));			
			mugFullImage.x=-mugFullImage.width/2;
			mugFullImage.y=-mugFullImage.height/2;
			this.addChild(mugFullImage);
			
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
		public function deleteMe(gameLost:Boolean=false):void
		{
			
			this.removeEventListeners();
			this.dispose();
			if (gameLost)
				dispatchEvent(new GameLostEvent(GameLostEvent.LOST_EVENT,GameLostEvent.MUG_TABLE_END, true)); //dispatch przed usunięciem!
			this.parent.removeChild(this);
			
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
		
		//// interface do obsługi stanów kufla
		 
		/**
		 * pokaż pełen kufel (jak idzie do klienta)
		 */
		public function showFull():void
		{
			this.visible=true;
		}
		/**
		 * pokaż pusty kufel (jak wraca od klienta)
		 */
		public function showEmpty():void
		{
			this.visible=true;	
		}
		/**
		 * rozbicie pelnego kufla o sciane (puszczony, brak klienta)
		 */
		public function crashFull():void
		{
			this.visible=true;			
			deleteTimer.start();			
		}
		/**
		 * rozbicie pustego (wracał od klienta)
		 */
		public function crashEmpty():void
		{
			this.visible=true;
		}
		/**
		 * ukrycie kufla
		 */
		public function hide():void
		{
			this.visible=false;
		}

		public function get whichCustomer():uint
		{
			return _whichCustomer;
		}

		public function get touched():Boolean
		{
			return _touched;
		}

		public function get switchMugTime():Number
		{
			return _switchMugTime;
		}

		public function set whichCustomer(value:uint):void
		{
			_whichCustomer = value;
		}

		public function set touched(value:Boolean):void
		{
			_touched = value;
		}

		public function set switchMugTime(value:Number):void
		{
			_switchMugTime = value;
		}


	}
}