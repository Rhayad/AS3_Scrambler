package models
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;
	
	import org.osmf.layout.AbsoluteLayoutFacet;
	import org.osmf.net.dynamicstreaming.INetStreamMetrics;
	
	public class ScrambleModel extends EventDispatcher
	{
		private var _scrambleStrength:int;
		
		public function ScrambleModel(target:IEventDispatcher=null)
		{
			super(target);
			
			scrambleStrength = 0;
		}
		
		//bekommt text und ruft scramblefunktion auf die alle Wörter >3 scrambled
		public function scrambleText(text:String):String
		{
			
			text = text.replace(/[a-z]{4,}/gi, scrambleWord);
			
			return text;
		}
		
		//bekommt ein Word, dass mit schwitchTwoRandomChars so oft wie scramblestrength die Buchstaben vertauscht und zurückgibt
		private function scrambleWord(word:String,... args):String
		{
			var scrambledWord:String = word;
			
			for (var i:int = 0; i < scrambleStrength; i++) {
				scrambledWord = switchTwoRandomChars(scrambledWord);
			}
			
			return scrambledWord;
		}
		
		//Funktion holt sich erst 2 beliebige Nummern, danach setzt es sie in die richtige Reihenfolge, dann wird das Wort Stück für Stück
		//zusammengesetzt... wenn der IndexfirstChar mit i der Forschleife übereinstimmt, wird der Buchstabe von Index drangehängt...
		private function switchTwoRandomChars (word:String):String {
			var firstCharIndex:int = Utility.randomNumberBetween(1,word.length-2);
			var secondCharIndex:int = Utility.randomNumberBetween(1,word.length-2);
			
			if (firstCharIndex > secondCharIndex) {
				var temp:int = firstCharIndex;
				firstCharIndex = secondCharIndex;
				secondCharIndex = temp;
			}
			
			var tempScrambledWord:String = "" ;
			
			for (var i:int = 0; i< word.length; i++) {
				if (i == firstCharIndex) {
					tempScrambledWord += word.charAt(secondCharIndex);
				} else if ( i == secondCharIndex) {
					tempScrambledWord += word.charAt(firstCharIndex);
				} else tempScrambledWord += word.charAt(i);
			}
			
			return tempScrambledWord;
		}

		public function get scrambleStrength():int
		{
			return _scrambleStrength;
		}

		public function set scrambleStrength(value:int):void
		{
			_scrambleStrength = value;
		}

	}
}