package screens
{
	import events.CustomTouchEvent;
	
	import levels.*;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
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
	
			level1.addEventListener(CustomTouchEvent.TABLE_TOUCHED , tableTouched);
			level1.addEventListener(CustomTouchEvent.TAP_TOUCHED , tapTouched);
			
		}
		
		private function tapTouched(e:CustomTouchEvent):void
		{
			level1.bartender.y = LevelsProperties.tablesPositionY[e.which];
			level1.bartender.x = LevelsProperties.bartenderDefaultX;
		}
		
		private function tableTouched(e:CustomTouchEvent):void
		{
			level1.bartender.y = LevelsProperties.tablesPositionY[e.which];
			level1.bartender.x = e.x;
		}
	}
}