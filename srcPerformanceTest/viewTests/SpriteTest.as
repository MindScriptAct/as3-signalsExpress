/**
 * Created by Deril on 2014.06.24.
 */
package viewTests {
import flash.display.Sprite;
import flash.events.MouseEvent;

public class SpriteTest extends Sprite {

	public function SpriteTest() {
	}

	public function trigger():void {
		dispatchEvent(new MouseEvent(MouseEvent.CLICK));
	}
}
}
