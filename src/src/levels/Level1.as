package levels
{

	import levels.LevelsProperties;
	
	import objects.Bartender;
	import objects.Table;
	
	import resources.Assets;
	
	import score.Score;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;


	public class Level1 extends Sprite
	{
		private var _tables:Vector.<Table> = new Vector.<Table>;
		private var _bartender:Bartender;
		private var _scoreCounter:Score;
	
		
		public function Level1()
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
			drawBackground();			
			addBartender();
			addTables();			
						
		}
		
		private function drawBackground():void
		{
			var bg:Image =  new Image(Assets.getTexture("BackgroundL1"));
			this.addChild(bg);
		}
		
		// dodanie barmana 
		private function addBartender():void
		{
			_bartender = new Bartender();
			_bartender.x= LevelsProperties.bartenderDefaultX;
			_bartender.y = LevelsProperties.bartenderDefaultY;
			addChild(_bartender);	
		}
		
		// dodanie obiektów baru i kranu
		private function addTables():void
		{
			for(var i:uint =0; i< LevelsProperties.numberOfTables ; i++)
			{	
				var table:Table = new Table(LevelsProperties.tablesWidth[i], 35 );
				table.tableNr = i;
				table.bartender = _bartender;
				table.x = LevelsProperties.tablesPositionX[i];
				table.y = LevelsProperties.tablesPositionY[i];
				addChild(table);
				
				_tables.push(table);
			}	
		}

		public function get bartender():Bartender
		{
			return _bartender;
		}

		public function set bartender(value:Bartender):void
		{
			_bartender = value;
		}
		public function get tables():Vector.<Table>
		{
			return _tables;
		}
		
		public function set tables(value:Vector.<Table>):void
		{
			_tables = value;
		}
		
	}
}