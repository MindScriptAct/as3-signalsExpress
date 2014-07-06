package eventTest.starlingView
{
	import flash.geom.Point;
	import flash.geom.Rectangle;

	import starling.display.DisplayObject;
	import starling.display.Sprite;
	import starling.events.Touch;
	import starling.events.TouchEvent;
	import starling.events.TouchPhase;
	import starling.textures.Texture;

	public dynamic class TouchSpriteTest extends Sprite
	{

		private var isDragging : Boolean = false;
		private var dragOffsetX : Number = 0;
		private var dragOffsetY : Number = 0;
		private var maskWidth : Number = 0;
		private var maskVector : Vector.<uint>;
		private static var sHelperRect : Rectangle = new Rectangle();
		private static var sHelperTouches : Vector.<Touch> = new <Touch>[];
		private static var sHelperPoint : Point = new Point();

		public function TouchSpriteTest(_maskVector : Vector.<uint> = null, _maskWidth : Number = 0)
		{





			super();

			if (_maskVector != null)
			{
				if (!_maskWidth)
				{
					throw new Error("If setting a touch mask, you must set the width as well");
				}
				maskWidth = Math.round(_maskWidth);
				maskVector = _maskVector;
			}

			addTouchListener();

		}

		public function addTouchListener()
		{
			this.addEventListener(TouchEvent.TOUCH, gotTouch);
		}
		public function removeTouchListener()
		{
			this.removeEventListener(TouchEvent.TOUCH, gotTouch);
		}

		private function gotTouch(touchEvent : TouchEvent)
		{
			var touch : Touch;

			sHelperTouches.length = 0;
			touchEvent.getTouches(this, null, sHelperTouches);
			for each(touch in sHelperTouches)
			{
				dispatchEventWith(touch.phase, false, {touch : touch});
				if (isDragging)
				{
					if (touch.phase == TouchPhase.BEGAN)
					{
						touch.getLocation(this.parent, sHelperPoint);
						dragOffsetX = (sHelperPoint.x - this.x);
						dragOffsetY = (sHelperPoint.y - this.y);
						updateDrag(touch);
					}
					else if (touch.phase == TouchPhase.MOVED)
					{
						updateDrag(touch);
					}
				}
			}
		}

		public function startDrag()
		{
			isDragging = true;
		}

		public function stopDrag()
		{
			isDragging = false;
		}

		private function updateDrag(touch : Touch)
		{
			var targetLocation : Point = touch.getLocation(this.parent);
			this.x = targetLocation.x - dragOffsetX;
			this.y = targetLocation.y - dragOffsetY;
		}

		override public function hitTest(localPoint : Point, forTouch : Boolean = false) : DisplayObject
		{
			if (maskWidth)
			{
				if (getBounds(this, sHelperRect).containsPoint(localPoint))
				{
					return(testAlpha(localPoint) ? this : null);
				}
			}

			return(super.hitTest(localPoint, forTouch));
		}

		private function testAlpha(localPoint : Point) : Boolean
		{
			var color : uint;
			var alpha : uint = 0;
			var intendedOffset : Number = maskWidth * int(localPoint.y) + int(localPoint.x);
			if (intendedOffset >= 0 && intendedOffset <= maskVector.length)
			{
				color = maskVector[intendedOffset];
				alpha = 0xFF000000 & color;
			}

			return(alpha ? true : false);

		}
	}
}
