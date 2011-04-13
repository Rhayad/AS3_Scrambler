package models
{
	import flash.display.Sprite;
	
	public class CircleSprite extends Sprite
	{
		private var radius:int;
		
		public function CircleSprite(cRadius:int)
		{
			super();
			
			radius = cRadius;
		
			render();
		}
		
		public function render():void {
			graphics.beginFill(0x000000,1);
			graphics.drawCircle(0, 0, radius);
			graphics.endFill();	
		}
	}
}