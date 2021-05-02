package states;

import flixel.FlxG;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxTimer;

class PauseSubState extends FlxSubState {
	override public function create() {
		super.create();
		add(new ui.Overlay());

		var title = new FlxText(0, 0, 0, 'PAUSED', 32);
		title.x = FlxG.width / 2 - title.width / 2;
		title.y = 150;
		add(title);

		FlxTimer.globalManager.active = false;

		closeCallback = () -> {
			FlxTimer.globalManager.active = true;
		};
	}

	override public function update(elapsed:Float) {
		if (FlxG.keys.pressed.ESCAPE) {
			close();
		}

		super.update(elapsed);
	}
}
