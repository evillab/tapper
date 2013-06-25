package score
{
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.text.TextField;
	
	public class Score extends Sprite
	{
		private var _scoreTextField:TextField;
		private var _score:int=0;
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
			_scoreTextField.text = _score.toString();
			addChild(_scoreTextField);			
		}
		public function addScore(points:uint):void
		{
			_score+=points;
			_scoreTextField.text = _score.toString();
			
		}
		public function removeScore(points:uint):void
		{
			if (_score>0)
			{
				if(_score<points) _score=points
				
				_score-=points;
			}
				_scoreTextField.text = _score.toString();
			
		}
		public function resetScore():void
		{
			_score=0;
			_scoreTextField.text = _score.toString();
		}
	}
}