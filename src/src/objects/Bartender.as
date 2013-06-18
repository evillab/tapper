package objects
{
	import resources.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Bartender extends Sprite
	{
		public function Bartender():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			drawBartender();
		}
		
		private function drawBartender():void
		{
			var tableImage:Image = new Image(Assets.getTexture("Bartender"));
			this.addChild(tableImage);
		}
		///interface obslugujacy barmana
		
	}
	
}