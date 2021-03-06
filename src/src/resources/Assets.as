package resources
{
	import flash.display.Bitmap;
	import flash.utils.Dictionary;
	
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;
	
	public class Assets
	{
		//menu
		[Embed(source="../../assets/graphics/table.png")]
		public static const Table:Class;
		
		[Embed(source="../../assets/graphics/mug.png")]
		public static const Mug:Class;
		
		[Embed(source="../../assets/graphics/tap.png")]
		public static const Tap:Class;
		
		[Embed(source="../../assets/graphics/bartender.png")]
		public static const Bartender:Class;
		
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