package events
{
	import starling.events.Event;
	
	public class CustomTouchEvent extends Event
	{
		public static const TABLE_TOUCHED:String = "tableTouched";		
		public static const TAP_TOUCHED:String = "tapTouched";
		
		public var which:uint;
		
		public function CustomTouchEvent(type:String, _which:uint = 0 , bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
			this.which = _which;
		}
	}
}