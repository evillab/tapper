package screens
{
	import events.NavigationEvent;
	
	import resources.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	import starling.filters.BlurFilter;
	import starling.text.TextField;
	import starling.events.Touch;
	import starling.events.TouchPhase;
	
	public class WelcomeScreen extends Sprite
	{
		private var _playGameBtn:Sprite;
		private var _optionsBtn:Sprite;
		
		public function WelcomeScreen()
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onnAddedToStage);
		}
		
		private function onnAddedToStage():void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE , onnAddedToStage);
			
			drawScreen();
			addNaviButtons();
		}
		
		private function addNaviButtons():void
		{
			// play btn
			_playGameBtn = new Sprite();
			var playGameTf:TextField = generateTextField("Play");
			_playGameBtn.addChild(playGameTf);
			_playGameBtn.x = 160 ; 
			_playGameBtn.y = 290;
			addChild(_playGameBtn);
			_playGameBtn.addEventListener(TouchEvent.TOUCH, buttonClicked); 
			
			// options btn
			_optionsBtn = new Sprite();
			var optionsTf:TextField = generateTextField("Options");
			_optionsBtn.addChild(optionsTf);
			_optionsBtn.x = 160 ; 
			_optionsBtn.y = 330;
			addChild(_optionsBtn);
		}
		
		private function buttonClicked(e:TouchEvent):void
		{
			var touches:Vector.<Touch> = e.touches;
			if(touches.length)
			{
				if(e.touches[0].phase==TouchPhase.BEGAN)
					this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN ,{id : "play"} , true));
			}
		}
		
		// wygenerowanie pola tekstowego - paramet przekazywany jest labelka na przycisku
		private function generateTextField(label:String):TextField
		{
			var tf:TextField = new TextField(100, 40 , label);
			tf.color = 0xffffff;
			tf.fontSize = 22;
			
			var _filter:BlurFilter = BlurFilter.createGlow(0x000000,5,10 ,.7);
			_filter.blurX = .6;
			_filter.blurY = .6;
			tf.filter = _filter;
			return tf;
		}
		
		// add background image to screen
		private function drawScreen():void
		{
			var background:Image = new Image(Assets.getTexture("WelcomeScreenBg"));
			addChild(background);
		}
		
		// dispose screen - after clicked PLAY
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
	}
}