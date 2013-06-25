package objects.customer
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	
	import starling.display.Sprite;

	public class CustomerManager extends Sprite
	{
		private var addCustomerTimer:Timer;
		private var customers:Vector.<Customer> = new Vector.<Customer>;
		
		public function CustomerManager()
		{
			initTimer();
		}
		
		private function initTimer():void
		{
			addCustomerTimer = new Timer(2000 , 0);
			addCustomerTimer.addEventListener(TimerEvent.TIMER , addCustomer);
			addCustomerTimer.start();
		}
		
		protected function addCustomer(event:TimerEvent):void
		{
			// losowanie typu klienta
			var dawrCustomerNr:Number = (Math.floor(Math.random() *3));
			
			var newCustomer:Customer = new Customer(dawrCustomerNr);
			addChild(newCustomer);
		}
	}
}