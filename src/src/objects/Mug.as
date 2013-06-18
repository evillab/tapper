package objects
{
	import resources.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Mug extends Sprite
	{
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
		}
		
		//// interface do obsługi zdarzeń kufla
		 
		/**
		 * pokaż pełen kufel (jak idzie do klienta)
		 */
		public function showFull():void
		{
			
		}
		/**
		 * pokaż pusty kufel (jak wraca od klienta)
		 */
		public function showEmpty():void
		{
			
		}
		/**
		 * rozbicie pelnego kufla o sciane (puszczony, brak klienta)
		 */
		public function crashFull():void
		{
			
		}
		/**
		 * rozbicie pustego (wracał od klienta)
		 */
		public function crashEmpty():void
		{
			
		}
	}
}