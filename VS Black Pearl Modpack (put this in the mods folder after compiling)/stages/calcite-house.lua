local xx = 560;
local yy = 475;
local xx2 = 900;
local yy2 = 520;
local ofs = 25;
local ofs2 = 25;
local yourmom = 0;
local followchars = true;
local del = 0;
local del2 = 0;
local rings = 0
local StevPhase = 0

function onCreate()

	setProperty('camFollowPos.x', 100);
    setProperty('camFollowPos.y', 200);
	
	xx = 160
	xx2 = 700
	yy = -400 --200
	yy2 = 150
	ofs = 50
	

	
	makeLuaSprite('CalciteSky', 'CalciteSky', -1600, -1400);
	setLuaSpriteScrollFactor('CalciteSky', 0.8, 0.8);
	addLuaSprite('CalciteSky', false);	
	
	makeLuaSprite('CalciteMountain', 'CalciteMountain', 1600, -550);
	setLuaSpriteScrollFactor('CalciteMountain', 0.9, 0.9);
	addLuaSprite('CalciteMountain', false);		
	
	makeLuaSprite('CalciteHouse', 'CalciteHouse', -1600, -1700);
	setLuaSpriteScrollFactor('CalciteHouse', 1, 1);
	addLuaSprite('CalciteHouse', false);

	makeAnimatedLuaSprite('CD', 'CalciteDance', -1400, -500);
	setLuaSpriteScrollFactor('CalciteD', 1, 1);
	addAnimationByPrefix('CD', "CDance", "CalciteDance CDance", 24, true);
	addLuaSprite('CD', true);
        objectPlayAnimation('CD', 'CDance', true);
	
	makeAnimatedLuaSprite('TD', 'TourmDance', 1200, -500);
	setLuaSpriteScrollFactor('TourmD', 1, 1);
	addAnimationByPrefix('TD', "TDance", "TourmDance TDance", 24, true);
	addLuaSprite('TD', false);
        objectPlayAnimation('TD', 'TDance', true);
	setProperty('TD.scale.x', 0.8);
	setProperty('TD.scale.y', 0.8);
	

	-- with addLuaSprite, the farther up it is on the script is how far back it is in layers
	--luaDebugMode = true
	
    setProperty('defaultCamZoom', 0.45)

	setProperty('cameraSpeed', 2.0)
	--setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'exe_gameover');
	--setPropertyFromClass('GameOverSubstate', 'endSoundName', 'exe_gameOverEnd');
	
    setPropertyFromClass('GameOverSubstate', 'characterName', 'townie-bf'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
	
end


function onStepHit()

	if followchars == true then --true then
		
        if mustHitSection == false then
           
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
			
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end

			if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            
			if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
           
			if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end

            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
			
        else
		   
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs2,yy2)
            end
            
			if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs2,yy2)
            end
            
			if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs2)
            end
           
			if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs2)
            end

            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
	end
end
