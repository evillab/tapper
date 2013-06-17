package screens
{
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class InGameScreen extends Sprite
	{
		public function InGameScreen()
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
			
			// for test
			//add
		}
	}
}