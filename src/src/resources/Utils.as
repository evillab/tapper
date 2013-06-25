package resources
{
	public class Utils
	{
		public static function randomNumber(min:Number, max:Number):Number {
			return Math.floor(Math.random() * (1 + max - min) + min);
		}

	}
}