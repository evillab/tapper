package screens
{
	import caurina.transitions.Tweener;
	
	import events.NavigationEvent;
	
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import resources.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.filters.BlurFilter;
	import starling.text.TextField;
	
	public class WelcomeScreen extends Sprite
	{
		private var _playGameBtn:Sprite;
		private var _optionsBtn:Sprite;
		
		private var _winkTimer:Timer = new Timer(500 , 0);

		private var eyes:Image;

		private var beer:Image;

		private var barEndBartender:Image;

		private var bartenderWithBeer:Image;
		
		public function WelcomeScreen()
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
			
			drawScreen();
			initWinkTimer();
			addNaviButtons();
		}
		
		private function initWinkTimer():void
		{
			_winkTimer.addEventListener(TimerEvent.TIMER , wink);
			_winkTimer.start();
		}
		
		protected function wink(event:TimerEvent):void
		{
			if(!eyes.visible)
			{	
				if(_winkTimer.currentCount % 3 ==0)
					eyes.visible = true;
			}	
			else
			{
				eyes.visible = false;
			}
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
					slideMug();
			}
		}
		
		private function slideMug():void
		{
			Tweener.addTween(beer , {x:500 , time:.45 , transition:"easeOutSine" , onComplete:changeScreen});
		}
		
		// po zakonczeniu animacji lecacegu kufla - odczekanie 1 sek i przejscie do gry
		private function changeScreen():void
		{
			eyes.visible = false;
			beer.visible = false;
			barEndBartender.visible = false;
			bartenderWithBeer.visible = true;
			
			_winkTimer.stop();
			_winkTimer.removeEventListener(TimerEvent.TIMER , wink);
			
			_winkTimer.delay = 1000;
			_winkTimer.repeatCount = 1;
			_winkTimer.addEventListener(TimerEvent.TIMER_COMPLETE , goToGame);
			_winkTimer.start();
			
		}
		
		protected function goToGame(event:TimerEvent):void
		{
			this.dispatchEvent(new NavigationEvent(NavigationEvent.CHANGE_SCREEN ,{id : "play"} , true));
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
			
			barEndBartender = new Image(Assets.getTexture("BarEndBartender")); 
			addChild(barEndBartender);
			
			bartenderWithBeer = new Image(Assets.getTexture("BartenderWithBeer")); 
			addChild(bartenderWithBeer);
			bartenderWithBeer.visible = false;
			
			beer = new Image(Assets.getTexture("Beer")); 
			beer.x = -80;
			beer.y = 315;
			addChild(beer);
			
			var boards:Image = new Image(Assets.getTexture("Boards")); 
			addChild(boards);
			
			eyes = new Image(Assets.getTexture("Eyes"));
			eyes.x = 570;
			eyes.y = 148;
			addChild(eyes);
			eyes.visible = false;
		}
		
		// dispose screen - after clicked PLAY
		public function disposeTemporarily():void
		{
			this.visible = false;
		}
	}
}