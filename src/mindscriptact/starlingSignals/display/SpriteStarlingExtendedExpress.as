package mindscriptact.starlingSignals.display {
import flash.display.BitmapData;
import flash.display.Shape;
import flash.display.Sprite;
import flash.geom.Point;
import flash.geom.Rectangle;

import starling.display.DisplayObject;
import starling.display.Image;
import starling.textures.Texture;

public class SpriteStarlingExtendedExpress extends SpriteStarlingExpress {

	private var isHitExtended:Boolean;

	private var _useDebugOverlay:Boolean;

	private var hitRectangle:Rectangle;
	private var hitEllipse:Rectangle;
	private var hitPolygonPoints:Vector.<Point>;
	private var overlay:Image;

	public function SpriteStarlingExtendedExpress() {
		super();
	}


	override public function hitTest(localPoint:Point, forTouch:Boolean = false):DisplayObject {

		if (isHitExtended) {
			// when the hit test is done to check if a touch is hitting the object, invisible or
			// untouchable objects must cause the hit test to fail.
			if (forTouch && (!visible || !touchable))
				return null;

			// check hit with rectangle.
			if (hitRectangle) {
				if (hitRectangle.contains(localPoint.x, localPoint.y)) {
					return this;
				}

			} else if (hitEllipse) {

				if (hitEllipse.width <= 0 || hitEllipse.height <= 0.0) {
					return null;
				}
				var norm:Point = new Point(localPoint.x - hitEllipse.x, localPoint.y - hitEllipse.y);

				var halfWidth:Number = hitEllipse.width / 2;
				var halfHeight:Number = hitEllipse.height / 2;

				if (((norm.x * norm.x) / (halfWidth * halfWidth)) + ((norm.y * norm.y) / (halfHeight * halfHeight)) <= 1) {
					return this;
				}

			} else if (hitPolygonPoints) {

				var prevPoint:Point = hitPolygonPoints[hitPolygonPoints.length - 1];
				var currentPoint:Point;
				var isInside:Boolean// = false;

				for (var i:int = 0; i < hitPolygonPoints.length; i++) {
					currentPoint = hitPolygonPoints[i];
					if ( //
							((currentPoint.y > localPoint.y) != (prevPoint.y > localPoint.y)) //
							&& //
							(localPoint.x < (prevPoint.x - currentPoint.x) * (localPoint.y - currentPoint.y) / (prevPoint.y - currentPoint.y) + currentPoint.x) //
							) {

						isInside = !isInside;
					}

					prevPoint = currentPoint;
				}
				if (isInside) {
					return this;
				}
			}

			return null;
		}

		else {
			return super.hitTest(localPoint, forTouch);
		}
	}


	public function setHitRectangle(rectangle:Rectangle):void {
		clearHitShapes();
		hitRectangle = rectangle;
		isHitExtended = true;
		if (_useDebugOverlay) {
			drawDebugOverlay();
		}
	}

	public function setHitEllipse(ellipseBoundRectangle:Rectangle):void {
		clearHitShapes();
		hitEllipse = ellipseBoundRectangle;
		hitEllipse.x += hitEllipse.width / 2
		hitEllipse.y += hitEllipse.height / 2
		isHitExtended = true;
		if (_useDebugOverlay) {
			drawDebugOverlay();
		}
	}

	public function setHitPolygon(points:Vector.<Point>):void {
		clearHitShapes();
		if (points.length > 2) {
			hitPolygonPoints = points;
			isHitExtended = true;
			if (_useDebugOverlay) {
				drawDebugOverlay();
			}
		} else {
			trace("Warning: then setting hit area polygon corner points you need to have at least 3 points. Failing silently.");
		}
	}

	public function clearHitShapes():void {
		isHitExtended = false;

		hitRectangle = null;
		hitEllipse = null;
		hitPolygonPoints = null;

		if (overlay) {
			this.removeChild(overlay);
			overlay = null;
		}
	}

	override public function dispose():void {
		clearHitShapes();
		super.dispose();
	}

	public function set useDebugOverlay(value:Boolean):void {
		_useDebugOverlay = value;

		drawDebugOverlay();
	}

	private function drawDebugOverlay():void {
		if (overlay == null) {
			var overlayTexture:Texture;
			if (hitRectangle) {
				overlayTexture = Texture.fromColor(hitRectangle.width, hitRectangle.height, 0x55FF0000);
				overlay = new Image(overlayTexture);
				overlay.x = hitRectangle.x;
				overlay.y = hitRectangle.y;
				this.addChild(overlay);
			}
			if (hitEllipse) {

				var rect:Shape = new Shape();
				rect.graphics.lineStyle(1, 0xff0000, 1);
				rect.graphics.beginFill(0xFF0000, 0.3);
				rect.graphics.drawEllipse(1, 1, hitEllipse.width - 2, hitEllipse.height - 2);
				rect.graphics.endFill();

				var bmd:BitmapData = new BitmapData(hitEllipse.width, hitEllipse.height, true, 0);
				bmd.draw(rect);

				overlayTexture = Texture.fromBitmapData(bmd);

				overlay = new Image(overlayTexture);
				overlay.x = hitEllipse.x - hitEllipse.width / 2;
				overlay.y = hitEllipse.y - hitEllipse.height / 2;

				addChild(overlay);
			}
			if (hitPolygonPoints) {
				var shapeContainer:Sprite = new Sprite();
				rect = new Shape();
				rect.graphics.lineStyle(1, 0xff0000, 1);
				rect.graphics.beginFill(0xFF0000, 0.3);
				var point:Point = hitPolygonPoints[hitPolygonPoints.length - 1];
				rect.graphics.moveTo(point.x, point.y);
				for (var i:int = 0; i < hitPolygonPoints.length; i++) {
					point = hitPolygonPoints[i];
					rect.graphics.lineTo(point.x, point.y);
				}
				rect.graphics.endFill();

				shapeContainer.addChild(rect);

				var boundingRect:Rectangle = shapeContainer.getBounds(rect);
				rect.x = -boundingRect.x;
				rect.y = -boundingRect.y;

				bmd = new BitmapData(boundingRect.width, boundingRect.height, true, 0);
				bmd.draw(shapeContainer);

				overlayTexture = Texture.fromBitmapData(bmd);

				overlay = new Image(overlayTexture);
				overlay.x = boundingRect.x;
				overlay.y = boundingRect.y;

				addChild(overlay);

			}
		}
	}

}
}
