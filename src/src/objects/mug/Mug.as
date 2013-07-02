package objects.mug
{
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Mug extends Sprite
	{
		
		protected var _touched:Boolean=false;
		protected var _switchMugTime:Number=0;
		protected var _mugImage:Image;
		
		public function Mug()
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			drawMug();
		}
		protected function drawMug():void
		{					
			_mugImage.x=-_mugImage.width/2;
			_mugImage.y=-_mugImage.height/2;
			this.addChild(_mugImage);
			
		}
		public function deleteMe(gameLost:Boolean=false):void
		{
			this.removeEventListeners();
			this.dispose();			
			this.parent.removeChild(this);
		}

		public function get touched():Boolean
		{
			return _touched;
		}
		
		public function set touched(value:Boolean):void
		{
			_touched = value;
		}
		public function get switchMugTime():Number
		{
			return _switchMugTime;
		}
		public function set switchMugTime(value:Number):void
		{
			_switchMugTime = value;
		}
	}
}