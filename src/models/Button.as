package models
{
	import flash.display.BitmapData;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFieldAutoSize;
	
	import org.osmf.net.StreamingURLResource;
	import org.osmf.net.dynamicstreaming.INetStreamMetrics;
	
	public class Button extends Sprite
	{
		public static const UP:String = "up";
		public static const OVER:String = "over";
		public static const DOWN:String = "down";
		public static const triggersToStates:Object = {
			mouseUp: OVER,
			mouseDown: DOWN,
			mouseOver: UP,
			mouseOver: OVER
		}
		
		private var _mouseState:String;
		
		private var buttonWidth:int;
		private var buttonHeight:int;
		private var buttonX:int;
		private var buttonY:int;
		private var buttonText:String;
		private var textField:TextField;
		
		public function Button(cX:int, cY:int, cWidth:int, cHeight:int, cButtonText:String)
		{
			super();
			
			addEventListener(MouseEvent.MOUSE_OVER, mouseHandler);
			addEventListener(MouseEvent.MOUSE_OUT, mouseHandler);
			addEventListener(MouseEvent.MOUSE_UP, mouseHandler);
			addEventListener(MouseEvent.MOUSE_DOWN, mouseHandler);
			addEventListener(MouseEvent.CLICK, mouseHandler);
			
			buttonWidth = cWidth;
			buttonHeight = cHeight;
			buttonX = cX;
			buttonY = cY;
			buttonText = cButtonText;
			
			textField = new TextField;
			textField.autoSize = TextFieldAutoSize.CENTER;
			textField.text = buttonText;
			textField.x = buttonX;
			textField.y = buttonY + 5;
			textField.width = buttonWidth;
			textField.height = buttonHeight;
			addChild(textField);
			
			render();
		}
		
		public function get mouseState():String
		{
			return _mouseState;
		}
		
		public function set mouseState(value:String):void
		{
			if (value == _mouseState)
				return;
			
			_mouseState = value;
			render();
		}
		
		public function mouseHandler(e:MouseEvent):void {
			
			mouseState = triggersToStates[e.type];
		}
		
		public function render():void {
			graphics.clear();
			var alpha:Number = 1;
			var color:uint = 0xCCCCCC;
			
			if (mouseState == UP) {
				alpha = 0;
			}
			graphics.lineStyle(2, 0x000000, alpha);
			
			if (mouseState == DOWN) {
				color = 0x666666;
			}
					
			graphics.beginFill(color);
			graphics.drawRect(buttonX, buttonY, buttonWidth, buttonHeight);
			graphics.endFill();	
		}
		
	}
}