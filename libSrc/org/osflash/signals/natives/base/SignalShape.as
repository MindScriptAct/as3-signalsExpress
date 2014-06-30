package org.osflash.signals.natives.base {
import flash.display.Shape;

import org.osflash.signals.natives.sets.DisplayObjectSignalSet;

/**
 * @author Simon Richardson - me@simonrichardson.info
 */
public class SignalShape extends Shape {

	private var _signals:DisplayObjectSignalSet;

	public function get signals():DisplayObjectSignalSet {
		return _signals ||= new DisplayObjectSignalSet(this);
	}
}
}
