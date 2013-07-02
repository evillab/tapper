package levels
{
	public class LevelsProperties
	{
		// parametry wspólne dla wszystkich leveli
		public static const SCORE_COUNTER_X:Number = 700;
		public static const MUG_FILL_TIME:uint = 500; // czas nalewania kufla w milisekundach
		public static const CUSTOMER_BACK_SPACE:uint=100;
		
		// LEVEL1
		public static const numberOfTables:uint = 3;
		public static const spaceBetweenTableAndTap:Number = 200;
		public static const tablesPositionX:Vector.<Number> = new <Number>[120,102,85];
		public static const tablesPositionY:Vector.<Number> = new <Number>[235,314,396];
		public static const tablesWidth:Vector.<Number> = new <Number>[370,435,500];
		public static const tablesHeight:Vector.<Number> = new <Number>[55,50,45];
		public static const bartenderDefaultX:Number = 540;
		public static const bartenderDefaultY:Number = 270;
		public static const bartenderXPositionNearTable:Number = 430;
		public static const BARTENDER_POSITION_Y:Vector.<uint> =  new <uint>[190,270,340];
		public static const BARTENDER_POSITION_X:Vector.<uint> =  new <uint>[500,540,590];
		public static const customerRate:Vector.<uint> = new <uint>[70,110];
		
		public static const tapsPositionX:Vector.<Number> = new <Number>[455,526,591];
		public static const tapsPositionY:Vector.<Number> = new <Number>[-48,-42,-43];
		
		//LEVEL2
	}
}