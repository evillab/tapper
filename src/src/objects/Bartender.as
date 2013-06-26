package objects
{
	import events.GameLostEvent;
	
	import resources.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Bartender extends Sprite
	{
		public static const MUG_FULL:String = "mug_full"; //już pełen kufel
		private var _canRunAlongTable:Boolean = false;
		
		
		public function Bartender():void
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			drawBartender();
		}
		
		private function drawBartender():void
		{
			var bartenderImage:Image = new Image(Assets.getTexture("Bartender"));
			bartenderImage.y = -(bartenderImage.height/3);
			this.addChild(bartenderImage);
		}
		///interface do bsługi stanów barmana
		/**
		 * stoi - default
		 */
		public function standAnim():void
		{
			
		}
		/**
		 * barman przemieszcza się pomiędzy stołami, wraca do początku stołu (szybka animacja)
		 */		
		public function smokeAnim():void
		{
			
		}
		/**
		 * bieg po pusty kufel, napiwki (animacja z prawej do lewej)
		 */
		public function runAnim():void
		{
			
		}
		/**
		 * nalewanie kufla (daje dispatch jak jest pełny)
		 */
		public function fillMugAnim():void
		{
			
			dispatchEvent(new Event(Bartender.MUG_FULL));
		}
		/**
		 * wysyłanie kufla do klienta
		 */
		public function serveMugAnim():void
		{
			
		}
		/**
		 * animacja wygranego poziomu
		 */
		public function levelWinAnim():void
		{
			
		}
		/**
		 * animacja przegranego poziomu
		 */
		public function levelLostAnim(whatKind:String):void
		{
			if(whatKind==GameLostEvent.MUG_TABLE_END)
				trace("ROZJEBAŁEM PEŁNY KUFEL!");
			else if(whatKind==GameLostEvent.CLIENT_TABLE_END)
				trace("WKURWIONY KLIENT!");
		}

		public function get canRunAlongTable():Boolean
		{
			return _canRunAlongTable;
		}

		public function set canRunAlongTable(value:Boolean):void
		{
			_canRunAlongTable = value;
		}
	

		
	}
	
}