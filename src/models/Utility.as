package models
{
	public class Utility
	{
		//Zahl zwischen 0 und 1 * Index zwischen 1,01 und word.length,99999999da floor, es immer auf eine ganze Zahl abrundet (deswegen +1)
		public static function randomNumberBetween (low:Number, high:Number):int {
			return Math.floor(low + (Math.random() * (high - low + 1)));
		}
	}
}