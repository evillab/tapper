package resources
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assets
	{
		//welcome screen 
		[Embed(source="../../assets/graphics/welcomeScreen/background.png")]
		public static const WelcomeScreenBg:Class;
		
		[Embed(source="../../assets/graphics/welcomeScreen/barEndBartender.png")]
		public static const BarEndBartender:Class;
		
		[Embed(source="../../assets/graphics/welcomeScreen/beer.png")]
		public static const Beer:Class;
		
		[Embed(source="../../assets/graphics/welcomeScreen/boards.png")]
		public static const Boards:Class;
		
		[Embed(source="../../assets/graphics/welcomeScreen/eyes.png")]
		public static const Eyes:Class;
		
		[Embed(source="../../assets/graphics/welcomeScreen/bartenderWithBeer.png")]
		public static const BartenderWithBeer:Class;
		
		

		[Embed(source="../../assets/graphics/table.png")]
		public static const Table:Class;
		

		[Embed(source="../../assets/graphics/tap.png")]
		public static const Tap:Class;
		
		//customers
		[Embed(source="../../assets/graphics/customer1.png")]
		public static const Customer1:Class;
		
		[Embed(source="../../assets/graphics/customer2.png")]
		public static const Customer2:Class;
		
		[Embed(source="../../assets/graphics/customer3.png")]
		public static const Customer3:Class;
		
		// bartender
		[Embed(source="../../assets/graphics/bartender/bartender.png")]
		public static const Bartender:Class;
		
		//mug
		[Embed(source="../../assets/graphics/mug/mug_empty.png")]
		public static const MugEmpty:Class;
		
		[Embed(source="../../assets/graphics/mug/mug_full.png")]
		public static const MugFull:Class;
		
		private static var gameTexture:Dictionary = new Dictionary();
		private static var gameTextureAtlas : TextureAtlas;
	
		public static function getTexture(name:String):Texture
		{
			if(gameTexture[name] == undefined)
			{
				var bitmap:Bitmap = new Assets[name]();
				gameTexture[name] = Texture.fromBitmap(bitmap);
			}
			
			return gameTexture[name];
		}
		
		
	}
}