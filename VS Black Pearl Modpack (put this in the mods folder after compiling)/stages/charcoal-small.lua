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
	yy = 100 --200
	yy2 = 350
	ofs = 25


--- Precache shit

	addCharacterToList('CharRose-Fake', 'dad')
	addCharacterToList('CharRose-Real', 'dad')

	precacheImage('RealCRose-Normal')
	precacheImage('RealCRose-Win')
	precacheImage('RealCRose-Lose')
	precacheImage('WhiteScreen')

---

	makeLuaSprite('FakeCRose-Normal', 'FakeCRose-Normal', 0, 0);
	setLuaSpriteScrollFactor('CPN', 0.95, 0.95);
	setObjectCamera('FakeCRose-Normal', 'other');
	addLuaSprite('FakeCRose-Normal', false);
  	setProperty('FakeCRose-Normal.alpha', 0);
	
	makeLuaSprite('FakeCRose-Win', 'FakeCRose-Win', 0, 0);
	setLuaSpriteScrollFactor('CPW', 0.95, 0.95);
	setObjectCamera('FakeCRose-Win', 'other');			
	addLuaSprite('FakeCRose-Win', false);
	setProperty('FakeCRose-Win.alpha', 0);
	
	makeLuaSprite('FakeCRose-Lose', 'FakeCRose-Lose', 0, 0);
	setLuaSpriteScrollFactor('CPL', 0.95, 0.95);
	setObjectCamera('FakeCRose-Lose', 'other');			
	addLuaSprite('FakeCRose-Lose', false);
	setProperty('FakeCRose-Lose.alpha', 0);	
	
	makeLuaSprite('CharcoalHall', 'CharcoalHall', -1600, -1700);
	setLuaSpriteScrollFactor('CharcoalHall', 1, 1);
	addLuaSprite('CharcoalHall', false);
	
	makeLuaSprite('CharcoalDarkness', 'CharcoalDarkness', -1600, -1700);
	setLuaSpriteScrollFactor('CharcoalDarkness', 1, 1);
	addLuaSprite('CharcoalDarkness', true);

	makeLuaSprite('BlackScreen', 'BlackScreen', 0, 0);
	setLuaSpriteScrollFactor('WS', 3, 3);
	setObjectCamera('BlackScreen', 'other');			
	addLuaSprite('BlackScreen', false);	
	setProperty('BlackScreen.alpha', 0);

  	makeLuaSprite('WhiteScreen', 'WhiteScreen', 0, 0);
	setScrollFactor('WS', 3, 3);
	setObjectCamera('WhiteScreen', 'other');		
	addLuaSprite('WhiteScreen', false);	
	setProperty('WhiteScreen.alpha', 0);
	
	-- with addLuaSprite, the farther up it is on the script is how far back it is in layers
	luaDebugMode = true
	
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

  if curStep > 193 and curStep < 223 and getProperty('BlackScreen.alpha') < 1 or curStep > 1428 and curStep < 1453 and getProperty('BlackScreen.alpha') < 1 then
  
	setProperty('BlackScreen.alpha', getProperty('BlackScreen.alpha') + 0.01)

  end

  if curStep == 269 then
  
	setProperty('WhiteScreen.alpha', 1)
	triggerEvent('Change Character', 'dad', 'fard')
	setProperty('FakeCRose-Normal.alpha', 1);
	setProperty('FakeCRose-Win.alpha', 1);
	setProperty('FakeCRose-Lose.alpha', 1);
	
  end
  
  if curStep > 270 and curStep < 300 and getProperty('WhiteScreen.alpha') > 0 or curStep > 1455 and curStep < 1485 and getProperty('WhiteScreen.alpha') > 0 then
  
	setProperty('BlackScreen.alpha', 0)
	setProperty('WhiteScreen.alpha', getProperty('WhiteScreen.alpha') - 0.05)

  end

---

if curStep > 269 then

  if getProperty('health') >= 1.625 then

	setProperty('FakeCRose-Lose.alpha', 1);
	setProperty('FakeCRose-Normal.alpha', 0);
	setProperty('FakeCRose-Win.alpha', 0);

	setProperty('FakeCRose-Lose.x', getProperty('iconP2.x') - 115)
	setProperty('FakeCRose-Lose.y', getProperty('iconP2.y') - 70)
	setProperty('FakeCRose-Lose.scale.x', getProperty('iconP2.scale.x'))
	setProperty('FakeCRose-Lose.scale.y', getProperty('iconP2.scale.y')) 
 
  end
  
  if getProperty('health') <= 0.375 then

	setProperty('FakeCRose-Win.alpha', 1);
	setProperty('FakeCRose-Normal.alpha', 0);
	setProperty('FakeCRose-Lose.alpha', 0);
	
	setProperty('FakeCRose-Win.x', getProperty('iconP2.x') - 115)
	setProperty('FakeCRose-Win.y', getProperty('iconP2.y') - 70)
	setProperty('FakeCRose-Win.scale.x', getProperty('iconP2.scale.x'))
	setProperty('FakeCRose-Win.scale.y', getProperty('iconP2.scale.y'))
  
  end
  
  if getProperty('health') < 1.625 and getProperty('health') > 0.375 then
 
	setProperty('FakeCRose-Normal.alpha', 1); 
	setProperty('FakeCRose-Lose.alpha', 0);
	setProperty('FakeCRose-Win.alpha', 0);
	
	setProperty('FakeCRose-Normal.x', getProperty('iconP2.x') - 115)
	setProperty('FakeCRose-Normal.y', getProperty('iconP2.y') - 70)
	setProperty('FakeCRose-Normal.scale.x', getProperty('iconP2.scale.x'))
	setProperty('FakeCRose-Normal.scale.y', getProperty('iconP2.scale.y'))
	
  end

  if getProperty('health') >= 1.625 then

	setProperty('RealCRose-Lose.alpha', 1);
	setProperty('RealCRose-Normal.alpha', 0);
	setProperty('RealCRose-Win.alpha', 0);

	setProperty('RealCRose-Lose.x', getProperty('iconP2.x') - 115)
	setProperty('RealCRose-Lose.y', getProperty('iconP2.y') - 70)
	setProperty('RealCRose-Lose.scale.x', getProperty('iconP2.scale.x'))
	setProperty('RealCRose-Lose.scale.y', getProperty('iconP2.scale.y')) 
 
  end
  
  if getProperty('health') <= 0.375 then

	setProperty('RealCRose-Win.alpha', 1);
	setProperty('RealCRose-Normal.alpha', 0);
	setProperty('RealCRose-Lose.alpha', 0);
	
	setProperty('RealCRose-Win.x', getProperty('iconP2.x') - 115)
	setProperty('RealCRose-Win.y', getProperty('iconP2.y') - 70)
	setProperty('RealCRose-Win.scale.x', getProperty('iconP2.scale.x'))
	setProperty('RealCRose-Win.scale.y', getProperty('iconP2.scale.y'))
  
  end
  
  if getProperty('health') < 1.625 and getProperty('health') > 0.375 then
 
	setProperty('RealCRose-Normal.alpha', 1); 
	setProperty('RealCRose-Lose.alpha', 0);
	setProperty('RealCRose-Win.alpha', 0);
	
	setProperty('RealCRose-Normal.x', getProperty('iconP2.x') - 115)
	setProperty('RealCRose-Normal.y', getProperty('iconP2.y') - 70)
	setProperty('RealCRose-Normal.scale.x', getProperty('iconP2.scale.x'))
	setProperty('RealCRose-Normal.scale.y', getProperty('iconP2.scale.y'))
	
  end
  
end

end

function onStepHit()

----------------

  if curStep == 1454 then
  
	removeLuaSprite('FakeCRose-Win', true)
	removeLuaSprite('FakeCRose-Normal', true)
	removeLuaSprite('FakeCRose-Lose', true)
  
    triggerEvent('Change Character', 'dad', 'CharRose-Real')

	makeLuaSprite('RealCRose-Normal', 'RealCRose-Normal', 0, 0);
	setScrollFactor('CPN', 0.95, 0.95);
	setObjectCamera('RealCRose-Normal', 'other');			
	addLuaSprite('RealCRose-Normal', false);	
	
	makeLuaSprite('RealCRose-Win', 'RealCRose-Win', 0, 0);
	setScrollFactor('CPW', 0.95, 0.95);
	setObjectCamera('RealCRose-Win', 'other');			
	addLuaSprite('RealCRose-Win', false);	
	
	makeLuaSprite('RealCRose-Lose', 'RealCRose-Lose', 0, 0);
	setScrollFactor('CPL', 0.95, 0.95);
	setObjectCamera('RealCRose-Lose', 'other');			
	addLuaSprite('RealCRose-Lose', false);	

  	makeLuaSprite('WhiteScreen', 'WhiteScreen', 0, 0);
	setScrollFactor('WS', 3, 3);
	setObjectCamera('WhiteScreen', 'other');	
	
	removeLuaSprite('WhiteScreen', false);	
	addLuaSprite('WhiteScreen', false);	

	removeLuaSprite('BlackScreen', true)

  end
----------------

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
