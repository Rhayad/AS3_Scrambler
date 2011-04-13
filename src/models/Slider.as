package models
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	public class Slider extends Sprite
	{
		private var _value:int;
		private var minValue:int;
		private var maxValue:int;
		private var length:int;
		private var radius:int;
		private var positionX:int;
		private var positionY:int;
		private var sliderValue:TextField;
		private var sliderButton:CircleSprite;
		
		public function Slider(cMinValue:int, cMaxValue:int, cPositionX:int, cPositionY:int, cLength:int, cRadius:int)
		{
			super();
			
			minValue = cMinValue;
			maxValue = cMaxValue;
			length = cLength;
			radius = cRadius;
			positionX = cPositionX;
			positionY = cPositionY;
			
			sliderValue = new TextField();
			addChild(sliderValue);
			
			sliderButton = new CircleSprite(radius);
			sliderButton.x = positionX;
			sliderButton.y = positionY;
			addChild(sliderButton);
			
			sliderButton.addEventListener(MouseEvent.MOUSE_DOWN, buttonDownHandler);
			
			render();
			
		}
		
		public function render():void {
			graphics.clear();
			graphics.beginFill(0xcccccc,1);
			graphics.drawRect(positionX, positionY, length, 2);
			graphics.endFill();
			
			sliderValue.width = length;
			sliderValue.autoSize = TextFieldAutoSize.CENTER;
			sliderValue.height = 20;
			sliderValue.x = positionX + length / 2;
			sliderValue.y = positionY + 20;
			sliderValue.text = "Scramble Strength: " + value;
			
		}
		
		private function buttonDownHandler(event:MouseEvent):void {
			stage.addEventListener(MouseEvent.MOUSE_MOVE, buttonMoveHandler);
			stage.addEventListener(MouseEvent.MOUSE_UP, buttonUpHandler);
		} 
		
		private function buttonMoveHandler(event:MouseEvent):void {
			if (event.stageX < positionX) {
				sliderButton.x = positionX;
			} else if (event.stageX > positionX + length) {
				sliderButton.x = positionX + length;
			} else {
				sliderButton.x = event.stageX;
			}
		}
		
		private function buttonUpHandler(event:MouseEvent):void {
			
			var distanceInSlider:int = event.stageX - positionX;
			var stepSize:Number = length / (maxValue - minValue);
			
			if (distanceInSlider < 0) {
				distanceInSlider = 0;
			} else if (distanceInSlider > length) {
				distanceInSlider = length;
			}
			
			value = Math.round(distanceInSlider / stepSize);
			
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, buttonMoveHandler);
			stage.removeEventListener(MouseEvent.MOUSE_UP, buttonUpHandler);
		}

		public function get value():int
		{
			return _value;
		}

		public function set value(value:int):void
		{
			_value = value;
			
			var stepSize:Number = length / (maxValue - minValue);
			sliderButton.x = positionX + value * stepSize;
			
			sliderValue.text = "Scramble Strength: " + value;			
		}
	}
}