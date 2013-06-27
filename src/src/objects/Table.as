package objects
{	
	import com.demonsters.debugger.MonsterDebugger;
	
	import flash.utils.getTimer;
	
	import events.CustomTouchEvent;
	import events.GameLostEvent;
	
	import levels.Level1;

	import levels.LevelsProperties;
	
	import objects.customer.Customer;
	
	import resources.Assets;
	import resources.Utils;
	
	import starling.display.Image;
	import starling.display.Quad;
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
		private var _tableWidth:Number;
		private var _tableHeight:Number;
		
		
		
		private var _customerTime:Number=0;
		
		
		
		public function Table(_width:Number , _height:Number):void
		{
			_tableWidth = _width;
			_tableHeight = _height;
			
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
			_customerTime = getTimer() + (Utils.randomNumber(15,30)*100);
			
			
			
		}
		
		public function createMug():void
		{
			var mug:Mug = new Mug();
			mug.x = tableContainer.width-30;
			_mugVector.push(mug);
			mug.switchMugTime = getTimer()+100;
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
			
			
			var custLength:uint = _customerVector.length;
			for(var j:uint=0; j<custLength; j++)
			{
					
				if( _customerVector[j].x >tableContainer.width-_customerVector[j].width)
				{					
					dispatchEvent(new GameLostEvent(GameLostEvent.LOST_EVENT,GameLostEvent.CLIENT_TABLE_END, true)); //dispatch przed usunięciem!
					return;
				}
				else
				{
				_customerVector[j].x+=((Utils.randomNumber(1,6)+_customerVector[j].xSpeed) /20);
				}
			}
			checkToCreateCustomer();
			
			var mugLength:uint = _mugVector.length;
			for(var i:uint=0; i<mugLength; i++)
			{
				if (_mugVector[i].touched)
				{
					_customerVector[_mugVector[i].whichCustomer].x-=LevelsProperties.CUSTOMER_BACK_SPACE;
					if (_customerVector[_mugVector[i].whichCustomer].x<=0)
						deleteCustomer(_mugVector[i].whichCustomer);					
					_mugVector[i].deleteMe(false);
					_mugVector.splice(i,1);					
					return;						
				}
				else
				{
				
					if(_mugVector[i].x<=0)
					{					
						_mugVector[i].crashFull();	
						_mugVector.splice(i,1);
						return;				
					}
					else
					{	
						_mugVector[i].checkCollision(_customerVector);
						_mugVector[i].x-=2;	
						if (getTimer()>=_mugVector[i].switchMugTime)						
						{
							_mugVector[i].scaleX*=-1;
							_mugVector[i].switchMugTime = getTimer()+100;
						}
					}
				}
			}
		}
		private function deleteCustomer(which:uint):void
		{
			removeChild(_customerVector[which]);
			_customerVector.splice(which,1);
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
			
			var quad:Quad = new Quad(_tableWidth, _tableHeight , 0x00ff00);
			quad.alpha = 0;
			tableContainer.addChild(quad);
			
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
			
			tapContainer.x = LevelsProperties.tapsPositionX[_tableNr];
			tapContainer.y = LevelsProperties.tapsPositionY[_tableNr];
			
			addChild(tapContainer);
			
			tapContainer.addEventListener(TouchEvent.TOUCH , tapTouched);
		}
		
		// przechwycenie kliknięcia w kran
		private function tapTouched(e:TouchEvent):void
		{
			if(e.touches[0].phase==TouchPhase.BEGAN)
			{	
				tapContainer.x -=20;
				tapContainer.y +=10;
				tapContainer.rotation = -.5;
			}	
			else if(e.touches[0].phase==TouchPhase.ENDED)
			{
				tapContainer.x +=20;
				tapContainer.y -=10;
				tapContainer.rotation =0;
			}
						
			if (e.touches[0].phase==TouchPhase.BEGAN || e.touches[0].phase == TouchPhase.ENDED) 
			{
				
				dispatchEvent(new CustomTouchEvent(CustomTouchEvent.TAP_TOUCHED,e.touches[0].phase , _tableNr, 0 , true));
					
			}		
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