package
{
	import starling.display.Sprite;
	
	public class Game extends Sprite
	{
		public function Game()
		{
			
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			this.removeEventListener(starling.events.Event.ADDED_TO_STAGE , onAddedToStage);
		}
	}
}