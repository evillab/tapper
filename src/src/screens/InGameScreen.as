package screens
{
	import events.CustomTouchEvent;
	
	import levels.Level1;
	import levels.LevelsProperties;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
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
			
			this.addEventListener(Event.ENTER_FRAME , onEnterFrame);
			
		}
		
		private function onEnterFrame():void
		{
			if(level1.bartender.canRunAlongTable)
				level1.bartender.x --;
		}
		
		private function tapTouched(e:CustomTouchEvent):void
		{
			if(e.phase==TouchPhase.BEGAN)
			{
				level1.bartender.y = LevelsProperties.tablesPositionY[e.which];
				level1.bartender.x = LevelsProperties.bartenderDefaultX;			
			}

		}
		
		private function tableTouched(e:CustomTouchEvent):void
		{
			if(e.phase == TouchPhase.BEGAN)
			{	
				level1.bartender.y = LevelsProperties.tablesPositionY[e.which];
				level1.bartender.x = LevelsProperties.bartenderXPositionNearTable;
				level1.bartender.canRunAlongTable = true;
			}
			else if(e.phase == TouchPhase.ENDED)
			{
				level1.bartender.canRunAlongTable = false;
				level1.bartender.x = LevelsProperties.bartenderXPositionNearTable;
			}
			
			
		}
	}
}