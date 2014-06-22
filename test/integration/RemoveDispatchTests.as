package integration {
import flexunit.framework.Assert;

import integration.helper.TestHelper;

import mindscriptact.signalsExpress.SignalExpress;

/**
 * remove dispatch
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class RemoveDispatchTests {

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

	//--------------------

	[Test]

	public function removeHandler_notAdded_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.remove(testObject.callBack_str_Param);
		signal.dispatch(testParam);

		Assert.assertEquals("Should be handled once.", 0, testObject.runCount);
		Assert.assertEquals("Param should be NOT handled.", "", testObject.runParamValue);
	}

	[Test]

	public function removeHandler_simple_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_str_Param);
		signal.remove(testObject.callBack_str_Param);
		signal.dispatch(testParam);

		Assert.assertEquals("Should be handled once.", 0, testObject.runCount);
		Assert.assertEquals("Param should be NOT handled.", "", testObject.runParamValue);
	}

	[Test]

	public function removeHandler_addRemoveAdd_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_str_Param);
		signal.remove(testObject.callBack_str_Param);
		signal.add(testObject.callBack_str_Param);
		signal.dispatch(testParam);

		Assert.assertEquals("Should be handled once.", 1, testObject.runCount);
		Assert.assertEquals("Param should be handled.", testParam, testObject.runParamValue);
	}


	[Test]

	public function removeHandler_removeAll_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_str_Param);
		signal.removeAll();
		signal.dispatch(testParam);

		Assert.assertEquals("Should be handled once.", 0, testObject.runCount);
		Assert.assertEquals("Param should be NOT handled.", "", testObject.runParamValue);
	}

	[Test]

	public function removeHandler_addAlotRemoveAll_ok():void {
		var testParam:String = String(Math.random());
		var signal:SignalExpress = new SignalExpress();

		signal.add(testObject.callBack_str_Param);
		signal.add(testObject.callBack_str_Param);
		signal.add(testObject.callBack_str_Param);
		signal.add(testObject.callBack_str_Param);
		signal.add(testObject.callBack_str_Param);
		signal.removeAll();
		signal.dispatch(testParam);

		Assert.assertEquals("Should be handled once.", 0, testObject.runCount);
		Assert.assertEquals("Param should be NOT handled.", "", testObject.runParamValue);
	}

}
}