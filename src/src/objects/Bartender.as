package objects
{
	import resources.Assets;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class Bartender extends Sprite
	{
		public static const MUG_FULL:String = "mug_full"; //już pełen kufel
		
		
		
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
			var tableImage:Image = new Image(Assets.getTexture("Bartender"));
			this.addChild(tableImage);
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
		 * animacja wygranego poziomu
		 */
		public function levelWinAnim():void
		{
			
		}
		/**
		 * animacja przegranego poziomu
		 */
		public function levelLostAnim():void
		{
			
		}
		
	}
	
}