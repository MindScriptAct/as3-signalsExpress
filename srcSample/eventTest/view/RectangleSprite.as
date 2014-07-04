package eventTest.view
{
	import flash.display.Sprite;

	public class RectangleSprite extends Sprite
	{
		public function RectangleSprite(color : uint)
		{
			this.graphics.beginFill(color, 0.8);
			this.graphics.drawRect(0, 0, 100, 100);
			this.graphics.endFill();

		}
	}
}
