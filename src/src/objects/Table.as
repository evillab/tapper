package objects
{
	import events.CustomTouchEvent;
	
	import levels.LevelsProperties;
	
	import resources.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Table extends Sprite
	{
		private var tableContainer:Sprite;
		private var tapContainer:Sprite;
		private var _tableNr:uint;
		
		public function Table():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			drawTable();
			drawTap();
		}
		
		// dodanie grafiki baru
		private function drawTable():void
		{
			tableContainer = new Sprite();
			
			var tableImage:Image = new Image(Assets.getTexture("Table"));
			tableContainer.addChild(tableImage);
			
			addChild(tableContainer);
			tableContainer.addEventListener(TouchEvent.TOUCH , tableTouched);
		}
		
		// przechwycenie kliknięcia w bar
		private function tableTouched(e:TouchEvent):void
		{
			var touches:Vector.<Touch> = e.touches;
			if(touches.length)
			{
				if (e.touches[0].phase==TouchPhase.BEGAN || e.touches[0].phase == TouchPhase.ENDED)
				{
					var touchX:Number = (touches[0] as Touch).globalX;
					dispatchEvent(new CustomTouchEvent(CustomTouchEvent.TABLE_TOUCHED,e.touches[0].phase,_tableNr, touchX , true));
				}
			}
		}
		
		// dodanie grafiki kranu
		private function drawTap():void
		{
			tapContainer = new Sprite();
			
			var tapImage:Image = new Image(Assets.getTexture("Tap"));
			tapContainer.addChild(tapImage);
			
			tapContainer.x = tableContainer.width + LevelsProperties.spaceBetweenTableAndTap;
			
			addChild(tapContainer);
			
			tapContainer.addEventListener(TouchEvent.TOUCH , tapTouched);
		}
		
		// przechwycenie kliknięcia w kran
		private function tapTouched(e:TouchEvent):void
		{
						
			if (e.touches[0].phase==TouchPhase.BEGAN || e.touches[0].phase == TouchPhase.ENDED) 
				dispatchEvent(new CustomTouchEvent(CustomTouchEvent.TAP_TOUCHED,e.touches[0].phase , _tableNr, 0 , true));			
		}

		/**
		 *  ustawia numer (liczbe porządkową) baru - potrzebne do przenoszenia barmana w kliknięte miejsce
		 */
		public function set tableNr(value:uint):void
		{
			_tableNr = value;
		}

	}
}