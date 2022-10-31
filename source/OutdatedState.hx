package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxSubState;
import flixel.text.FlxText;
import flixel.util.FlxColor;
import flixel.effects.FlxFlicker;
import lime.app.Application;
import flixel.addons.transition.FlxTransitionableState;
import flixel.tweens.FlxTween;
import flixel.util.FlxTimer;

class OutdatedState extends MusicBeatState
{
	public static var leftState:Bool = false;

	var warnText:FlxText;
	override function create()
	{
		super.create();

		var bg:FlxSprite = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
		var bg:FlxSprite = new FlxSprite().loadGraphic(Paths.image('Scrunkle'));
		bg.screenCenter();
		bg.alpha = 0.5;
		add(bg);

		warnText = new FlxText(0, 0, FlxG.width,
			"Hey there,
			if you're interested in this mod's source code, please check out
			my github (Kringle11) by pressing any button, or proceed normally by pressing ESC.
			\n
			DISCLAIMER: This mod contains bright lights and flashing images that may cause discomfort or seizures for people with epilepsy.\n
			Do not continue if you have a history of epilepsy or believe to have the condition. Viewer discretion is advised.
			\n
			Besides that, thank you for downloading my mod! Aside from a few resources (e.g. MaxiGamer's SU font and LetterY's camera code) this is mainly a one person project.\n
			Credits to tposejank for Extra Keys, Revolver-D for the Black Pearl AU and all the voice actors, artists and other people that have contributed to the SU community!
			",
			32);
		warnText.setFormat("VCR OSD Mono", 32, FlxColor.WHITE, CENTER);
		warnText.screenCenter(Y);
		add(warnText);

                #if android
                addVirtualPad(NONE, A_B);
                #end
	}

	override function update(elapsed:Float)
	{
		if(!leftState) {
			if (controls.ACCEPT) {
				leftState = true;
				CoolUtil.browserLoad("https://github.com/Kringle11");
			}
			else if(controls.BACK) {
				leftState = true;
			}

			if(leftState)
			{
				FlxG.sound.play(Paths.sound('cancelMenu'));
				leftState = false;
				FlxTween.tween(warnText, {alpha: 0}, 1, {
					onComplete: function (twn:FlxTween) {
						MusicBeatState.switchState(new MainMenuState());
					}
				});
			}
		}
		super.update(elapsed);
	}
}
