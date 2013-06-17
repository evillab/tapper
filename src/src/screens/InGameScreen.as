package screens
{
	import levels.*;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class InGameScreen extends Sprite
	{
		private var level1:Level1;
		public function InGameScreen()
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
			
			level1 = new Level1();
			addChild(level1);
		}
	}
}