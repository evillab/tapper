package levels
{
	
	import levels.LevelsProperties;
	
	import objects.Bartender;
	import objects.Mug;
	import objects.Table;
	
	import starling.display.Sprite;
	import starling.events.Event;


	public class Level1 extends Sprite
	{
		private var _tables:Vector.<Table> = new Vector.<Table>;

		private var _bartender:Bartender;
		
		public function Level1()
		{
			this.addEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
		}
		
		private function onAddedToStage():void
		{
			this.removeEventListener(Event.ADDED_TO_STAGE , onAddedToStage);
			addTables();
			AddMug();
			addBartender();
		}
		
		private function addBartender():void
		{
			_bartender = new Bartender();
			_bartender.x= stage.stageWidth/1.6;
			_bartender.y = stage.stageHeight/1.6;
			addChild(_bartender);	
		}
		
		private function AddMug():void
		{
			var mug:Mug = new Mug();
			mug.x = stage.stageWidth/2;
			mug.y = stage.stageHeight/2;
			addChild(mug);
		}
		
		private function addTables():void
		{
			for(var i:uint =0; i< 4 ; i++)
			{	
				var table:Table = new Table();
				table.tableNr = i;
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

		
	}
}