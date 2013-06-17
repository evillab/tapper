package
{
	import screens.InGameScreen;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Game extends Sprite
	{
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE , onAddedToStage);
			
			initTestGame();
		}
		
		private function initTestGame():void
		{
			var inGame:InGameScreen = new InGameScreen();
			addChild(inGame);
		}
	}
}