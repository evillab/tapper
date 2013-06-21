package objects
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import resources.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.utils.deg2rad;
	import starling.utils.rad2deg;
	
	public class Mug extends Sprite
	{
		private var deleteTimer:Timer = new Timer(500,1);
		public function Mug():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			drawMug();
		}
		
		private function drawMug():void
		{
			var tableImage:Image = new Image(Assets.getTexture("Mug"));
			this.addChild(tableImage);
			deleteTimer.addEventListener(TimerEvent.TIMER_COMPLETE, removeMe);
		}
		/**
		 * usuwanie kufla
		 */
		public function removeMe(e:TimerEvent=null):void
		{			
			deleteTimer.removeEventListener(TimerEvent.TIMER_COMPLETE, removeMe);
			this.removeEventListeners();
			this.dispose();
			this.parent.removeChild(this);
			
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
			this.rotation=deg2rad(270);
			this.x-=20;
			this.y+=60;
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
	}
}