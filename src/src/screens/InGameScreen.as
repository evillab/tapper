package screens
{
	import flash.utils.getTimer;
	
	import events.CustomTouchEvent;
	import events.GameLostEvent;
	
	import levels.Level1;
	import levels.LevelsProperties;
	
	import score.Score;
	
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchPhase;
	
	public class InGameScreen extends Sprite
	{
		private var level1:Level1;
		private var mugFillStartTime:Number;
		private var _currentTap:uint;
		private var _scoreCounter:Score;
		
		public function InGameScreen()
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE , onAddedToStage);			
			addScoreCounter();
			level1 = new Level1();
			addChild(level1);	
			addListeners();						
		}
		private function addScoreCounter():void
		{
			_scoreCounter = new Score();
			_scoreCounter.x = LevelsProperties.SCORE_COUNTER_X;
			addChild(_scoreCounter);
		}
		
		private function addListeners():void
		{
			level1.addEventListener(CustomTouchEvent.TABLE_TOUCHED , tableTouched);
			level1.addEventListener(CustomTouchEvent.TAP_TOUCHED , tapTouched);
			level1.addEventListener(GameLostEvent.LOST_EVENT, gameLost);			
			this.addEventListener(Event.ENTER_FRAME , onEnterFrame);
		}
		
		private function gameLost(e:GameLostEvent):void
		{			
							
			removeListeners();
			trace("GRA PRZEGRANA, POWÓD: "+e.lostReason);
			level1.bartender.levelLostAnim(e.lostReason);	
		}
		
		private function removeListeners():void
		{
			this.removeEventListeners();
			level1.removeEventListener(CustomTouchEvent.TABLE_TOUCHED , tableTouched);
			level1.removeEventListener(CustomTouchEvent.TAP_TOUCHED , tapTouched);
			level1.removeEventListener(GameLostEvent.LOST_EVENT, gameLost);
		}		
		
		private function onEnterFrame():void
		{
			if(level1.bartender.canRunAlongTable)
				level1.bartender.x --;
			for(var i:uint =0; i< LevelsProperties.numberOfTables ; i++)
			{
				level1.tables[i].onEnterFrame();
			}
		}
		
		private function tapTouched(e:CustomTouchEvent):void
		{
			if(e.phase==TouchPhase.BEGAN)
			{
				_currentTap = e.which;
				level1.bartender.y = LevelsProperties.tablesPositionY[e.which];
				level1.bartender.x = LevelsProperties.bartenderDefaultX;
				mugFillStartTime = getTimer();
				level1.bartender.fillMugAnim();
			}
			if(e.phase==TouchPhase.ENDED)
			{
				checkFillTime();
			}

		}
		
		private function checkFillTime():void
		{
			if (getTimer()>=mugFillStartTime+LevelsProperties.MUG_FILL_TIME)
			{				
				level1.bartender.serveMugAnim();
				level1.tables[_currentTap].createMug();
			}
			else
			{
				level1.bartender.standAnim();
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