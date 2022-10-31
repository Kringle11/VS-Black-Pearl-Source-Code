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

	
	xx = 160
	xx2 = 700
	yy = -500 --200
	yy2 = 350
	ofs = 50
	
---
	makeLuaSprite('CharPink-Normal', 'CharPink-Normal', 0, 0);
	setLuaSpriteScrollFactor('CPN', 0.95, 0.95);
	setObjectCamera('CharPink-Normal', 'other');			
	addLuaSprite('CharPink-Normal', false);	
	
	makeLuaSprite('CharPink-Win', 'CharPink-Win', 0, 0);
	setLuaSpriteScrollFactor('CPW', 0.95, 0.95);
	setObjectCamera('CharPink-Win', 'other');			
	addLuaSprite('CharPink-Win', false);	
	
	makeLuaSprite('CharPink-Lose', 'CharPink-Lose', 0, 0);
	setLuaSpriteScrollFactor('CPL', 0.95, 0.95);
	setObjectCamera('CharPink-Lose', 'other');			
	addLuaSprite('CharPink-Lose', false);		
	
---
	
	makeLuaSprite('CharcoalHall', 'CharcoalHall', -1600, -1700);
	setLuaSpriteScrollFactor('CharcoalHall', 1, 1);
	addLuaSprite('CharcoalHall', false);
	
	makeLuaSprite('CharcoalDarkness', 'CharcoalDarkness', -1600, -1700);
	setLuaSpriteScrollFactor('CharcoalDarkness', 1, 1);
	addLuaSprite('CharcoalDarkness', true);
	
	-- with addLuaSprite, the farther up it is on the script is how far back it is in layers
	--luaDebugMode = true
	
    setProperty('defaultCamZoom', 0.6)

	setProperty('cameraSpeed', 2.0)
	--setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'exe_gameover');
	--setPropertyFromClass('GameOverSubstate', 'endSoundName', 'exe_gameOverEnd');
	
    setPropertyFromClass('GameOverSubstate', 'characterName', 'townie-bf'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx'); --put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
	
end

function onUpdate()
	
  if getProperty('health') >= 1.625 then

	setProperty('CharPink-Lose.alpha', 1);
	setProperty('CharPink-Normal.alpha', 0);
	setProperty('CharPink-Win.alpha', 0);

	setProperty('CharPink-Lose.x', getProperty('iconP2.x') - 95)
	setProperty('CharPink-Lose.y', getProperty('iconP2.y') - 100)
	setProperty('CharPink-Lose.scale.x', getProperty('iconP2.scale.x'))
	setProperty('CharPink-Lose.scale.y', getProperty('iconP2.scale.y')) 
 
  end
  
  if getProperty('health') <= 0.375 then

	setProperty('CharPink-Win.alpha', 1);
	setProperty('CharPink-Normal.alpha', 0);
	setProperty('CharPink-Lose.alpha', 0);
	
	setProperty('CharPink-Win.x', getProperty('iconP2.x') - 95)
	setProperty('CharPink-Win.y', getProperty('iconP2.y') - 100)
	setProperty('CharPink-Win.scale.x', getProperty('iconP2.scale.x'))
	setProperty('CharPink-Win.scale.y', getProperty('iconP2.scale.y'))
  
  end
  
  if getProperty('health') < 1.625 and getProperty('health') > 0.375 then
 
	setProperty('CharPink-Normal.alpha', 1); 
	setProperty('CharPink-Lose.alpha', 0);
	setProperty('CharPink-Win.alpha', 0);
	
	setProperty('CharPink-Normal.x', getProperty('iconP2.x') - 95)
	setProperty('CharPink-Normal.y', getProperty('iconP2.y') - 100)
	setProperty('CharPink-Normal.scale.x', getProperty('iconP2.scale.x'))
	setProperty('CharPink-Normal.scale.y', getProperty('iconP2.scale.y'))
	
  end
	
end


function onStepHit()

	if followchars == true then --true then
		
        if mustHitSection == false then
           
		   setProperty('defaultCamZoom', 0.4)
		   
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
           
		   setProperty('defaultCamZoom', 0.6)
		   
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
