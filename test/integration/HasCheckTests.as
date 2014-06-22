package integration {
import flexunit.framework.Assert;

import integration.helper.TestHelper;

import mindscriptact.signalsExpress.SignalExpress;

/**
 * params specified
 * @author Raimundas Banevicius (http://mvcexpress.org/)
 */
public class HasCheckTests {

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

	public function hasCallback_notAdded_false():void {
		var signal:SignalExpress = new SignalExpress(String);

		Assert.assertFalse("Should NOT have callback added.", signal.has(testObject.callBack_no_params));
	}

	[Test]

	public function hasCallback_added_true():void {
		var signal:SignalExpress = new SignalExpress(String);

		signal.add(testObject.callBack_no_params);

		Assert.assertTrue("Should have callback added.", signal.has(testObject.callBack_no_params));
	}

	[Test]

	public function hasCallback_addedTwice_true():void {
		var signal:SignalExpress = new SignalExpress(String);

		signal.add(testObject.callBack_no_params);
		signal.add(testObject.callBack_no_params);

		Assert.assertTrue("Should have callback added.", signal.has(testObject.callBack_no_params));
	}

	[Test]

	public function hasCallback_addRemoveAdd_true():void {
		var signal:SignalExpress = new SignalExpress(String);

		signal.add(testObject.callBack_no_params);
		signal.remove(testObject.callBack_no_params);
		signal.add(testObject.callBack_no_params);

		Assert.assertTrue("Should have callback added.", signal.has(testObject.callBack_no_params));
	}

	[Test]

	public function hasCallback_removed_false():void {
		var signal:SignalExpress = new SignalExpress(String);

		signal.add(testObject.callBack_no_params);
		signal.remove(testObject.callBack_no_params);

		Assert.assertFalse("Should NOT have callback added.", signal.has(testObject.callBack_no_params));
	}

	[Test]

	public function hasCallback_removedAll_false():void {
		var signal:SignalExpress = new SignalExpress(String);

		signal.add(testObject.callBack_no_params);
		signal.removeAll();

		Assert.assertFalse("Should NOT have callback added.", signal.has(testObject.callBack_no_params));
	}


}
}