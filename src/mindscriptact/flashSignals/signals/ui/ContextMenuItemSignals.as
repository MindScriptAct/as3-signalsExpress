package mindscriptact.flashSignals.signals.ui {
import flash.events.ContextMenuEvent;
import flash.ui.ContextMenuItem;

import mindscriptact.flashSignals.NativeSignalExpress;
import mindscriptact.flashSignals.signals.display.NativeMenuItemsSignals;

[API("667")]
public class ContextMenuItemSignals extends NativeMenuItemsSignals {

	public function ContextMenuItemSignals(target:ContextMenuItem) {
		super(target);
	}

	public function get menuItemSelect():NativeSignalExpress {return getNativeSignal(ContextMenuEvent.MENU_ITEM_SELECT, ContextMenuEvent);}//[Event(name="menuItemSelect",type="flash.events.ContextMenuEvent")]
}
}
