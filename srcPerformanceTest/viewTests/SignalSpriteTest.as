/**
 * Created by Deril on 2014.06.24.
 */
package viewTests {
import flash.events.MouseEvent;

import org.osflash.signals.natives.base.SignalSprite;

public class SignalSpriteTest extends SignalSprite {
	public function SignalSpriteTest() {
		super();
	}

	public function trigger():void {
		dispatchEvent(new MouseEvent(MouseEvent.CLICK));
	}
}
}
