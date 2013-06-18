package objects
{
	import events.CustomTouchEvent;
	
	import levels.LevelsProperties;
	
	import resources.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
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
		
		private function drawTable():void
		{
			tableContainer = new Sprite();
			
			var tableImage:Image = new Image(Assets.getTexture("Table"));
			tableContainer.addChild(tableImage);
			
			addChild(tableContainer);
			tableContainer.addEventListener(TouchEvent.TOUCH , tableTouched);
		}
		
		private function tableTouched():void
		{
			trace("table");
			dispatchEvent(new CustomTouchEvent(CustomTouchEvent.TABLE_TOUCHED , _tableNr));
		}
		
		private function drawTap():void
		{
			tapContainer = new Sprite();
			
			var tapImage:Image = new Image(Assets.getTexture("Tap"));
			tapContainer.addChild(tapImage);
			
			tapContainer.x = tableContainer.width + LevelsProperties.spaceBetweenTableAndTap;
			
			addChild(tapContainer);
			tapContainer.addEventListener(TouchEvent.TOUCH , tapTouched);
		}
		
		private function tapTouched():void
		{
			trace("tap");
			dispatchEvent(new CustomTouchEvent(CustomTouchEvent.TAP_TOUCHED,_tableNr));
		}

		public function set tableNr(value:uint):void
		{
			_tableNr = value;
		}

	}
}