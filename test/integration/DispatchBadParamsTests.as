package integration {
import integration.helper.TestHelper;

import mindscriptact.signalsExpress.SignalExpress;

/**
 * bad params.
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class DispatchBadParamsTests {

	private var testObject:TestHelper;

	[Before]

	public function runBeforeEveryTest():void {
		testObject = new TestHelper();
	}

	[After]

	public function runAfterEveryTest():void {
		testObject = null;
	}

	//--------------------

	[Test(expects='ArgumentError')]

	public function badParamConfig_oneParam_error():void {
		CONFIG::debug {

			var signal:SignalExpress = new SignalExpress(int);

			signal.add(testObject.callBack_str_Param);

			signal.dispatch("Break");

			return;
		}
		throw ArgumentError("Fail for release!");
	}

	[Test(expects='ArgumentError')]

	public function badParamConfig_twoParams_error():void {
		CONFIG::debug {

			var signal:SignalExpress = new SignalExpress(String, int);

			signal.add(testObject.callBack_intStr_Params);

			signal.dispatch(1, "Break!");

			return;
		}
		throw ArgumentError("Fail for release!");
	}

	[Test(expects='ArgumentError')]

	public function badParamConfig_fiveParams_error():void {
		CONFIG::debug {

			var signal:SignalExpress = new SignalExpress(String, int, Boolean, int, String);

			signal.add(testObject.callBack_intStrIntStrInt_Params);

			signal.dispatch(1, "2", "Break!", "4", 5);

			return;
		}

		throw ArgumentError("Fail for release!");
	}

}
}