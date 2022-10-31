function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'townie-bf'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
end

local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('Cutscene1-Intro');
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end