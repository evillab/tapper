package screens
{
	import starling.display.Sprite;
	import starling.events.Event
	
	public class WelcomeScreen extends Sprite
	{
		public function WelcomeScreen()
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onnAddedToStage);
		}
		
		private function onnAddedToStage():void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE , onnAddedToStage);
			
			drawScreen();
		}
		
		private function drawScreen():void
		{
			// TODO: grafiki , przyciski , nawigacja
		}
	}
}