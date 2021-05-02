package states;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;

class MenuState extends FlxState {
	override public function create() {
		var title = new FlxText(0, 0, 0, 'My Game', 32);
		// Begin offscreen to tween in
		title.y -= title.height;
		title.screenCenter(FlxAxes.X);
		title.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLACK, 4);
		add(title);

		var enter = new FlxText(0, 0, 0, 'press ENTER', 16);
		enter.screenCenter();
		enter.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLACK, 2);
		enter.y += title.height + 16;
		enter.alpha = 0;
		add(enter);

		var credits = new FlxText(0, 0, 0, 'A game made by Graham Marlow', 12);
		credits.screenCenter(FlxAxes.X);
		credits.setBorderStyle(FlxTextBorderStyle.SHADOW, FlxColor.BLACK, 2);
		credits.y = FlxG.height - credits.height - 16;
		credits.alpha = 0;
		add(credits);

		FlxTween.tween(title, { y: FlxG.height / 2 - title.height / 2 }, 1, {
			ease: FlxEase.quintIn,
			onComplete: (tween:FlxTween) -> {
				FlxG.camera.shake(0.01, 0.2);
				enter.alpha = 1;
				credits.alpha = 1;
			}
		});

		super.create();
	}

	override public function update(elapsed:Float) {
		if (FlxG.keys.justPressed.ENTER) {
			FlxG.switchState(new PlayState());
		}

		super.update(elapsed);
	}
}
