package objects
{
	import events.GameLostEvent;
	
	import resources.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class EmptyMug extends Sprite
	{
		public function EmptyMug()
		{
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			drawMug();			
		}
		
		private function drawMug():void
		{
			var mugEmpytImage:Image = new Image(Assets.getTexture("MugEmpty"));			
			mugEmpytImage.x=-mugEmpytImage.width/2;
			mugEmpytImage.y=-mugEmpytImage.height/2;
			this.addChild(mugEmpytImage);			
		}
		
		public function deleteMe(gameLost:Boolean=false):void
		{			
			this.removeEventListeners();
			this.dispose();
			if (gameLost)
				dispatchEvent(new GameLostEvent(GameLostEvent.LOST_EVENT,GameLostEvent.MUG_TABLE_END, true)); //dispatch przed usunięciem!
			this.parent.removeChild(this);
			
		}
	}
}