package models
{
	import models.ScrambleModel;
	
	public class PredefinedTextField extends CenterTextField
	{
		private var allTexts:Array;
		private var scrambleModel:ScrambleModel;
		private var index:int;
		
		public function PredefinedTextField(cWidth:int, cHeight:int, cYPosition:int, cStageWidth:int)
		{
			// Übergabe der Constructordaten an das parent Element
			super(cWidth, cHeight, cYPosition, cStageWidth);
			
			this.border = true;
			
			//add predefined texts to an array
			
			var germanTexts:Array = new Array(6);
			var englishTexts:Array = new Array(6);
			
			germanTexts[0] = "Willkommen beim Textscrambler \n\n Die These ist: um einen Text zu lesen müssen die Wörter in einem Text nicht zwingend in der richtigen Reihenfolge sein, sondern nur der erste und der letzte Buchstabe richtig stehen, sowie die richtige Anzahl der Buchstaben enthalten sein. \n\n Um dies auszuprobieren wähle den Button “new Text”. Beim neuen Text stelle mit der Leiste die gewünschte Scramblestufe ein, drücke den Button “Scramble” und schaue ob es funtioniert. \n\n Mit der Stufe “0” kannst Du den Originaltext lesen und mit “Instructions” kommst Du zur Anleitung zurück.";
			germanTexts[1] = "Bill Gates geht am Privatstrand seiner Villa spazieren. Auf einmal wird eine alte Flasche an Land gespült. Er nimmt sie, öffnet sie und es erscheint ein Flaschengeist. Danke für deine Rettung aus der Flasche, Bill. Du hast nun einen Wunsch frei. Was es auch sei, ich werde ihn dir erfüllen. Gates überlegt und meint dann: Hier ist eine Landkarte mit allen Krisen- und Kriegsgebieten der Erde. Ich möchte, daß dort überall Frieden herrscht. Der Geist nimmt die Karte, stöhnt, und meint: Das ist einfach zuviel. Hunderte von Kriegen, hassende Menschen, religiöse Fanatiker. Ich bin doch nur ein einfacher Flaschengeist, das kann ich nicht alles wieder geradebiegen. Hast du nicht noch irgendeinen anderen Wunsch? Ich hätte da noch einen. Ich möchte, daß alle gröberen Fehler aus Windows 2000 verschwinden. Darauf der Flaschengeist: Zeig mir doch nochmal die Landkarte...";
			germanTexts[2] = "Ein Chirurg, ein Architekt und ein NT-Netzwerkverwalter streiten, wessen Berufsstand der Älteste sei. Der Chirurg: Gott entnahm Adam eine Rippe und schuf Eva. Die erste Tat war eine Operation! Der Architekt widerspricht: Vor Adam und Eva herrschte das Chaos. Gott baute die Welt. Die erste Tat war folglich eine architektonische Leistung. Der NT-Netzwerkverwalter trumpft auf: Und von wem stammt das Chaos? Von wem wohl?";
			germanTexts[3] = "Auf einer Wirtschaftskonferenz unterhalten sich der saudische König und Bill Gates. Der saudische König prahlt: Der Ölpreis ist seit Jahren so hoch, ich hab so viel verdient, ich könnte die ganze Welt kaufen! Bill Gates: Ich verkauf aber nicht.";
			germanTexts[4] = "Ein Mann mittleren Alters kauft einen Drucker. Kommt an nächsten Tag wieder mit dem Ding unterm Arm in den Laden. Der Drucker druckt nicht... Wo haben Sie den denn angeschlossen? Ganz normal in die Steckdose. Nein, wo am Computer meine ich...! Computer hab ich nich, ich will nur drucken.";
			germanTexts[5] = "Die Post hat eine Bill Gates-Sondermarke herausgebracht. Es stellt sich aber heraus, dass diese auf den Briefen nicht hält. Eine Untersuchungskommission attestiert, dass sowohl die Briefmark als auch der verwendete Klebstoff völlig in Ordnung sind. Das Problem ist, die Leute spucken alle auf die falsche Seite.";
			
			englishTexts[0] = "Welcome to the Textscrambler \n\n The thesis: if you want to read a text, the letters in a word don´t need to be in the right order, unless the first and the last letter are in the right place and that the word has the correct number of letters. \n\n If you want to check the thesis, press the new text button. For the scrambling strength use the slider, press the scramble button and try if it works. \n\n With level 0 you can read the original text again and with the instruction button you`ll come back here.";
			englishTexts[1] = "A French maid was tidying up for a wealthy computer whiz. She commented that he had a nice PC. He looked frustrated and said, Yeah, it's top of the line, but I can't seem to get any programs to start up. You wouldn't happen to know how these gizmos work, do you? She replied, I'm sorry monsieur, I would love to help you, but oh la la, I don't do Windows!";
			englishTexts[2] = "Jesus and Satan were having an ongoing argument about who was better on his computer. They had been going at it for days, and God was tired of hearing all of the bickering.Finally God said, Cool it. I am going to set up a test that will run two hours and I will judge who does the better job. So Satan and Jesus sat down at the keyboards and typed away. They moused. They did spreadsheets. They wrote reports. They sent faxes. They sent e-mail. They sent out e-mail with attachments. They downloaded. They did some genealogy reports. They made cards. They did every known job. But ten minutes before their time was up, lightning suddenly flashed across the sky, thunder rolled, the rain poured and, of course, the electricity went off. Satan stared at his blank screen and screamed every curse word known in the underworld. Jesus just sighed. The electricity finally flickered back on and each of them restarted their computers. Satan started searching frantically, screaming It's gone! It's all gone! I lost everything when the power went out! Meanwhile, Jesus quietly started printing out all of his files from the past two hours. Satan observed this and became irate. Wait! He cheated, how did he do it? God shrugged and said, Jesus saves.";
			englishTexts[3] = "A blonde was telling a brunette that her computer broke. So the brunette said she would check the blonde's e-mail for her. The blonde said, Cool! E-mail me and tell me what I got. ";
			englishTexts[4] = "One day, Saint Peter called up to Heaven Bill Clinton, Colin Powell, and Bill Gates. He said to them, I've called you here because you are the 3 most influential spokepersons in the world. Go back to Earth and tell everyone there is a God, but he's blowing up the world tomorrow. So, Bill Clinton went back and said, Fellow Americans, I have some good news and some bad news. The good news is there is a God, and the bad news is he's blowing up the world tomorrow. Colin Powell went back and said, I have some bad news and some good news. The bad news is there is a God and the good news is he's blowing up the world tomorrow. Then, Bill Gates went down, gathered up all his computer buddies on the Internet and said, I have some good news. The first part of the good news is I've been voted one of the 3 most influential spokespersons in the world. The other good news is the Y2K problem is solved.";
			englishTexts[5] = "Bill Gates is hanging out with the chairman of General Motors. If automotive technology had kept pace with computer technology over the past few decades, boasts Gates, you would now be driving a V-32 instead of a V-8, and it would have a top speed of 10,000 miles per hour. Or, you could have an economy car that weighs 30 pounds and gets a thousand miles to a gallon of gas. In either case, the sticker price of a new car would be less than $50. Sure, says the GM chairman. But would you really want to drive a car that crashes four times a day?";
			
			allTexts = new Array(germanTexts, englishTexts);
			
			scrambleModel = new ScrambleModel();
		}
		
		// holen des richtigen Texts für die Sprache
		public function setTextFromIndex (language:int, textNumber:int):void {
			index = textNumber;
			this.text = allTexts[language][textNumber];
		}
		
		//benutzt setter für strength von Scramblemodel
		public function scrambleText(scrambleStrength:int):void {
			scrambleModel.scrambleStrength = scrambleStrength;
			this.text = scrambleModel.scrambleText(this.text);
		}
		
		public function getIndex ():int {
			return index;
		}
	}
}