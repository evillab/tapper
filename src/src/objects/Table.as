package objects
{
	import flash.utils.getTimer;
	
	import events.CustomTouchEvent;
	
	import levels.LevelsProperties;
	
	import objects.customer.Customer;
	
	import resources.Assets;
	import resources.Utils;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	
	public class Table extends Sprite
	{
		private var tableContainer:Sprite;
		private var tapContainer:Sprite;
		private var _tableNr:uint;
		private var _mugVector:Vector.<Mug> = new Vector.<Mug>;
		private var _customerVector:Vector.<Customer> = new Vector.<Customer>;
		
		private var _customerTime:Number=0;
		
		
		public function Table():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
			_customerTime = getTimer() + (Utils.randomNumber(15,30)*100);
		}
		
		public function createMug():void
		{
			var mug:Mug = new Mug();
			mug.x = tableContainer.width-30;
			_mugVector.push(mug);
			addChild(mug);
		}
		
		private function createCustomer():void
		{
			var dawrCustomerNr:Number = (Math.floor(Math.random() *3));		
			var customer:Customer = new Customer(dawrCustomerNr);			
			_customerVector.push(customer);
			addChild(customer);
		}
		
		public function onEnterFrame():void
		{
			for(var i:uint=0; i<_mugVector.length; i++)
			{
				if(_mugVector[i].x<=0)
				{					
					_mugVector[i].crashFull();	
					_mugVector.splice(i,1);
					return;				
				}
				else
				{	
					_mugVector[i].x-=2;	
					if (_mugVector[i].x%14==0)						
						_mugVector[i].scaleX*=-1;
				}				
			}
			for(var j:uint=0; j<_customerVector.length; j++)
			{
				_customerVector[j].x+=((Utils.randomNumber(1,10)+_customerVector[j].xSpeed) /20);													
			}
			checkToCreateCustomer();
		}
		
		private function checkToCreateCustomer():void
		{
			
			
			if (getTimer()>_customerTime)
			{
				_customerTime = getTimer() + (Utils.randomNumber(LevelsProperties.customerRate[0],LevelsProperties.customerRate[1])*100);
				createCustomer();
			}
			
		}
		private function onAddedToStage():void
		{
			drawTable();
			drawTap();
		}
		
		// dodanie grafiki baru
		private function drawTable():void
		{
			tableContainer = new Sprite();
			
			var tableImage:Image = new Image(Assets.getTexture("Table"));
			tableContainer.addChild(tableImage);
			
			addChild(tableContainer);
			tableContainer.addEventListener(TouchEvent.TOUCH , tableTouched);
		}
		
		// przechwycenie kliknięcia w bar
		private function tableTouched(e:TouchEvent):void
		{
			var touches:Vector.<Touch> = e.touches;
			if(touches.length)
			{
				if (e.touches[0].phase==TouchPhase.BEGAN || e.touches[0].phase == TouchPhase.ENDED)
				{
					var touchX:Number = (touches[0] as Touch).globalX;
					dispatchEvent(new CustomTouchEvent(CustomTouchEvent.TABLE_TOUCHED,e.touches[0].phase,_tableNr, touchX , true));
				}
			}
		}
		
		// dodanie grafiki kranu
		private function drawTap():void
		{
			tapContainer = new Sprite();
			
			var tapImage:Image = new Image(Assets.getTexture("Tap"));
			tapContainer.addChild(tapImage);
			
			tapContainer.x = tableContainer.width + LevelsProperties.spaceBetweenTableAndTap;
			
			addChild(tapContainer);
			
			tapContainer.addEventListener(TouchEvent.TOUCH , tapTouched);
		}
		
		// przechwycenie kliknięcia w kran
		private function tapTouched(e:TouchEvent):void
		{
						
			if (e.touches[0].phase==TouchPhase.BEGAN || e.touches[0].phase == TouchPhase.ENDED) 
				dispatchEvent(new CustomTouchEvent(CustomTouchEvent.TAP_TOUCHED,e.touches[0].phase , _tableNr, 0 , true));			
		}

		/**
		 *  ustawia numer (liczbe porządkową) baru - potrzebne do przenoszenia barmana w kliknięte miejsce
		 */
		public function set tableNr(value:uint):void
		{
			_tableNr = value;
		}

	}
}