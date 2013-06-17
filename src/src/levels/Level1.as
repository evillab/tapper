package levels
{
	import objects.Mug;
	import objects.Table;
	
	import starling.display.Sprite;
	import starling.events.Event;

	public class Level1 extends Sprite
	{
		
		public function Level1()
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			addTable();
			AddMug();
		}
		
		private function AddMug():void
		{
			var mug:Mug = new Mug();
			addChild(mug);
		}
		
		private function addTable():void
		{
			var table:Table = new Table();
			table.x = 30;
			table.y = 250;
			addChild(table);
		}
	}
}