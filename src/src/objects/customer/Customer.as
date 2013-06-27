package objects.customer
{
	
	import resources.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Customer extends Sprite
	{
		private var _type:uint;
		private var _points:uint;
		private var _xSpeed:uint;
		private var _mugPosition:int;
		private var _drinking:Boolean = false;
		
		public function Customer(type:uint)
		{
			super();
			_type = type;
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
			drawCustomer();
			setCustomerParameters();
			
		}
		
		private function setCustomerParameters():void
		{
			_points = CustomerProperties.CUSTOMER[_type][0];
			_xSpeed = CustomerProperties.CUSTOMER[_type][2];
		}
		
		//dodanie grafiki klienta
		private function drawCustomer():void
		{
			var customerImage:Image =  new Image(Assets.getTexture(CustomerProperties.CUSTOMER[_type][1]));
			customerImage.y = - (customerImage.height);
			addChild(customerImage);
		}

		public function get xSpeed():uint
		{
			return _xSpeed;
		}

		public function get mugPosition():int
		{
			return _mugPosition;
		}

		public function get drinking():Boolean
		{
			return _drinking;
		}

		public function set mugPosition(value:int):void
		{
			_mugPosition = value;
		}

		public function set drinking(value:Boolean):void
		{
			_drinking = value;
		}


	}
}