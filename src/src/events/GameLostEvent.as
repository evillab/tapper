package events
{
	import starling.events.Event;
	
	public class GameLostEvent extends Event		
	{
		public static const LOST_EVENT:String = "lost_event";
		//
		public static const MUG_TABLE_END:String = "mug_table_end"; // kufel poleciał do końca stołu i się rozbił
		public static const CLIENT_TABLE_END:String = "client_table_end";
		
		public var lostReason:String;
		
		public function GameLostEvent(type:String, _lostReason:String, bubbles:Boolean=false, data:Object=null)
		{
			super(type, bubbles, data);
			this.lostReason = _lostReason;
		}
	}
}