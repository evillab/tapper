package resources
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assets
	{
		//welcome screen background
		[Embed(source="../../assets/graphics/welcomeScreen/welcomeScreenBg.png")]
		public static const WelcomeScreenBg:Class;
		
		[Embed(source="../../assets/graphics/table.png")]
		public static const Table:Class;
		
		[Embed(source="../../assets/graphics/mug.png")]
		public static const Mug:Class;
		
		[Embed(source="../../assets/graphics/tap.png")]
		public static const Tap:Class;
		
		[Embed(source="../../assets/graphics/bartender.png")]
		public static const Bartender:Class;
		
		//customers
		[Embed(source="../../assets/graphics/customer1.jpg")]
		public static const Customer1:Class;
		
		[Embed(source="../../assets/graphics/customer2.jpg")]
		public static const Customer2:Class;
		
		[Embed(source="../../assets/graphics/customer3.jpg")]
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