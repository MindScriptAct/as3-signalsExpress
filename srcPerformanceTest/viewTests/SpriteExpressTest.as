/**
 * Created by Deril on 2014.06.24.
 */
package viewTests {
import flash.events.MouseEvent;

import mindscriptact.flashSignals.display.SpriteExpress;

public class SpriteExpressTest extends SpriteExpress {

	public function SpriteExpressTest() {
		super();
	}

	public function trigger():void {
		dispatchEvent(new MouseEvent(MouseEvent.CLICK));
	}


}
}
