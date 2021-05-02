package states;

import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

class CountdownSubState extends FlxSubState {
	var actionText:String;
	var counter = 4;
	var countdown:FlxText;
	var onComplete:() -> Void;

	public function new(actionText:String, ?handleOnComplete:() -> Void) {
		this.actionText = actionText;
		onComplete = handleOnComplete;
		super();
	}

	override public function create() {
		countdown = new FlxText(0, 0, 0, '3', 64);
		countdown.screenCenter();
		add(new Overlay());
		add(countdown);

		new FlxTimer().start(1, function(timer:FlxTimer) {
			counter--;

			if (timer.loopsLeft == 0) {
				if (onComplete != null) {
					onComplete();
				}

				close();
			}
		}, counter);

		super.create();
	}

	override public function update(elapsed:Float) {
		var text = counter > 1 ? Std.string(counter - 1) : actionText;
		countdown.text = text;
		countdown.screenCenter();
		super.update(elapsed);
	}
}
