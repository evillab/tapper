package objects.customer
{
	import flash.display.Bitmap;
	
	import resources.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Customer extends Sprite
	{
		private var _type:uint;
		private var _points:uint;
		private var _xSpeed:uint;
		
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
			trace("typ: "+_type);
			_points = CustomerProperties.CUSTOMER[_type][0];
			_xSpeed = CustomerProperties.CUSTOMER[_type][2];
		}
		
		//dodanie grafiki klienta
		private function drawCustomer():void
		{
			var customerImage:Image =  new Image(Assets.getTexture(CustomerProperties.CUSTOMER[_type][1]));
			addChild(customerImage);
		}
	}
}