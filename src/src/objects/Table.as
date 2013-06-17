package objects
{
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import resources.Assets;
	
	public class Table extends Sprite
	{
		public function Table():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			drawTable();
		}
		
		private function drawTable():void
		{
			var tableImage:Image = new Image(Assets.getTexture("Table"));
			this.addChild(tableImage);
		}
	}
}