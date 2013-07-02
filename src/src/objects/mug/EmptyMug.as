package objects.mug
{
	import events.GameLostEvent;
	import resources.Assets;
	
	import starling.display.Image;	
	import starling.events.Event;
	import objects.Bartender;
	
	public class EmptyMug extends Mug
	{
		
		private var _tableNum:uint;
		
		
		public function EmptyMug(tableNum:uint)
		{
			_tableNum = tableNum;
			super();
		}

		override protected function drawMug():void
		{
			_mugImage = new Image(Assets.getTexture("MugEmpty"));			
			super.drawMug();			
		}
		
		override public function deleteMe(gameLost:Boolean=false):void
		{			
			if (gameLost)
				dispatchEvent(new GameLostEvent(GameLostEvent.LOST_EVENT,GameLostEvent.EMPTY_MUG_TABLE_END, true)); //dispatch przed usunięciem!
			
			super.deleteMe(gameLost);
			
		}
		public function checkCollision(bartender:Bartender):void
		{
	
			if(Math.abs(bartender.x-this.x)<bartender.width)
			{
				if (bartender.tableNum == _tableNum)
					_touched = true;
			}
						
		}


		public function get tableNum():uint
		{
			return _tableNum;
		}
		/**
		 * rozbicie pustego (wracał od klienta)
		 */
		public function crashEmpty():void
		{
			this.visible=true;
		}
				
	}
}