package mindscriptact.flashSignals.signals.ui {
import flash.events.ContextMenuEvent;
import flash.ui.ContextMenu;

import mindscriptact.flashSignals.NativeSignalExpress;
import mindscriptact.flashSignals.signals.display.NativeMenuSignals;


public class ContextMenuSignals extends NativeMenuSignals {

	public function ContextMenuSignals(target:ContextMenu) {
		super(target);
	}

	public function get menuSelect():NativeSignalExpress {return getNativeSignal(ContextMenuEvent.MENU_SELECT, ContextMenuEvent);}//[Event(name="menuSelect",type="flash.events.ContextMenuEvent")]

}
}
