package objects
{
	import resources.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Mug extends Sprite
	{
		public function Mug():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			drawMug();
		}
		
		private function drawMug():void
		{
			var tableImage:Image = new Image(Assets.getTexture("Mug"));
			this.addChild(tableImage);
		}
	}
}