package score
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class Score extends Sprite
	{
		private var _scoreTextField:TextField;
		public function Score()
		{
			super();
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
			
		}
		
		private function onAddedToStage():void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
			
			_scoreTextField = new TextField(100,30,"0");
			_scoreTextField.fontSize = 15;
			_scoreTextField.color = 0xffffff;
			_scoreTextField.bold = true;
			
			addChild(_scoreTextField);
			
		}
	}
}