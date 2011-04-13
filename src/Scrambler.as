package
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	
	import models.Button;
	import models.CenterTextField;
	import models.PredefinedTextField;
	import models.Slider;
	import models.Utility;
	
	public class Scrambler extends Sprite
	{
		private var mainTextField:PredefinedTextField;
		private var header:CenterTextField;
		private var newTextButton:Button;
		private var scrambleButton:Button;
		private var instructionButton:Button;
		private var languageButton:Button;
		private var scrambleStrengthSlider:Slider;
		private var language:int;
		private var headerSize:TextFormat;
		
		public function Scrambler()
		{	
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;		
			
			//default language = german, set 1 for English
			language = 0;
			
			//Setzen der Überschrift
			header = new CenterTextField(330,30,20, stage.stageWidth);
			headerSize = new TextFormat();
			headerSize.size = 26;
			header.text ="Welcome to the Textscrambler";
			header.setTextFormat(headerSize);
			addChild(header);
			
			mainTextField = new PredefinedTextField(600,200,80, stage.stageWidth);
			mainTextField.setTextFromIndex(language,0);
			addChild(mainTextField);
			
			newTextButton = new Button(stage.stageWidth / 2 - 40, 380, 100, 25, "New Text");
			addChild(newTextButton);
			newTextButton.addEventListener(MouseEvent.CLICK, newTextClickHandler);
			
			scrambleButton = new Button(stage.stageWidth / 2 - 40, 430, 100, 25, "Scramble");
			addChild(scrambleButton);
			scrambleButton.addEventListener(MouseEvent.CLICK, scrambleClickHandler);
			
			instructionButton = new Button(stage.stageWidth / 2 - 40, 480, 100, 25, "Instructions");
			addChild(instructionButton);
			instructionButton.addEventListener(MouseEvent.CLICK, instructionClickHandler);
			
			languageButton = new Button(stage.stageWidth / 2 - 40, 530, 100, 25, "Language DE / EN");
			addChild(languageButton);
			languageButton.addEventListener(MouseEvent.CLICK, languageClickHandler);
			
			scrambleStrengthSlider = new Slider(0, 5, stage.stageWidth / 2 - 100, 330, 200, 10);
			addChild(scrambleStrengthSlider);
			
		}
		
		//holen eines zufälligen Textes, falls gleiche Zahl wiederkommt nochmal holen der Nummer
		private function newTextClickHandler (event:MouseEvent):void {
			var textNumber:int = Utility.randomNumberBetween(1,5);
			
			while (textNumber == mainTextField.getIndex()) {
				textNumber = Utility.randomNumberBetween(1,5);
			}
			
			trace (textNumber);
			
			mainTextField.setTextFromIndex(language, textNumber);
		}
		
		private function scrambleClickHandler (event:MouseEvent):void {
			
			mainTextField.setTextFromIndex(language, mainTextField.getIndex());
						
			mainTextField.scrambleText(scrambleStrengthSlider.value);
		}
		
		private function instructionClickHandler (event:MouseEvent):void {
			
			mainTextField.setTextFromIndex(language, 0);
		}
		
		private function languageClickHandler (event:MouseEvent):void {
			if (language == 0) {
				language = 1;
			} else {
				language = 0;
			}
			mainTextField.setTextFromIndex(language, 0);
		}
	}
}