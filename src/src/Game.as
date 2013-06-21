package
{
	import screens.InGameScreen;
	import screens.WelcomeScreen;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import events.NavigationEvent;
	
	public class Game extends Sprite
	{
		private var _welcomeScreen:WelcomeScreen;
		public function Game()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE , onAddedToStage);
			
			initWelcomeScreen();
			//initTestGame();
		}
		
		private function initWelcomeScreen():void
		{
			_welcomeScreen = new WelcomeScreen();
			addChild(_welcomeScreen);
			this.addEventListener(NavigationEvent.CHANGE_SCREEN , onScreenChanged);
		}
		
		private function initTestGame():void
		{
			var inGame:InGameScreen = new InGameScreen();
			addChild(inGame);
		}
		
		private function onScreenChanged(event:NavigationEvent):void
		{
			switch(event.params.id)
			{
				case "play" :
					_welcomeScreen.disposeTemporarily();
					initTestGame();
					break;
			}
		}
	}
}