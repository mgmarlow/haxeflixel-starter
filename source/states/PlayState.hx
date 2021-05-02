package states;

import flixel.FlxG;
import flixel.FlxState;

class PlayState extends FlxState {
	public function new() {
		super();
	}

	override public function update(elapsed:Float) {
		if (FlxG.keys.justPressed.ESCAPE) {
			openSubState(new PauseSubState());
		}
	}
}
