package objects
{
	import levels.LevelsProperties;
	
	import resources.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Table extends Sprite
	{
		private var tableContainer:Sprite;
		private var tapContainer:Sprite;
		
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
		}
		
		private function drawTap():void
		{
			tapContainer = new Sprite();
			
			var tapImage:Image = new Image(Assets.getTexture("Tap"));
			tapContainer.addChild(tapImage);
			
			tapContainer.x = tableContainer.width + LevelsProperties.spaceBetweenTableAndTap;
			
			addChild(tapContainer);
		}
	}
}