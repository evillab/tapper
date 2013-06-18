package
{
	import com.demonsters.debugger.MonsterDebugger;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import starling.core.Starling;
	
	[SWF(frameRate="60", width="800", height="480", backgroundColor="0x000000")]
	public class tapper extends Sprite
	{
		private var _starling:Starling;
		
		public function tapper()
		{
			super();
			
			// support autoOrients
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			initMonsterDebugger();
			initStarling();
		}
		
		private function initStarling():void
		{
			_starling = new Starling(Game , stage);
			_starling.antiAliasing= 1;
			_starling.start();
		}
		
		private function initMonsterDebugger():void
		{
			MonsterDebugger.initialize(this);
		}
	}
}