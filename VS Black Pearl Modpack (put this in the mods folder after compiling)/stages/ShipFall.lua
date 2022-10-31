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

local Peb1ACCEL= 1.1;
local Peb2ACCEL= 1.4;
local Peb3ACCEL= 1.2;
local Burn1ACCEL= 1.5;

function onCreate()


	xx = 800
	xx2 = 1100
	yy = -100 --200
	yy2 = 200
	ofs = 30
	ofs2 = 30
	
--- Precache shit

	addCharacterToList('black-pearl-v4-insane_STAIN', 'dad')

	precacheImage('WhiteScreen')
	
-- background shit


	makeLuaSprite('StarSpace', 'StarSpace',-550, -650);
	setLuaSpriteScrollFactor('StarSpace', 0.5, 0.5);
	addLuaSprite('StarSpace', false);
	scaleObject('StarSpace', 0.8, 0.8)
	
	makeLuaSprite('EarthMoon', 'EarthMoon', -800, -500);
	setLuaSpriteScrollFactor('EarthMoon', 0.9, 0.9);
	addLuaSprite('EarthMoon', false);
	scaleObject('EarthMoon', 1, 1)
	
	makeAnimatedLuaSprite('beryl2', 'burnBop', 2500, -2500);
	setLuaSpriteScrollFactor('static2', 1, 1);
	addAnimationByPrefix('beryl2', "burning", "burnBop burning", 24, true);
	addLuaSprite('beryl2', false);
        objectPlayAnimation('beryl2', 'burning', true);	

	makeLuaSprite('Pebble1', 'Pebble1', -10, 0);
	setLuaSpriteScrollFactor('Pebble1', 1, 1);
	addLuaSprite('Pebble1', false);

	makeLuaSprite('Pebble2', 'Pebble2', 900, 0);
	setLuaSpriteScrollFactor('Pebble2', 1, 1);
	addLuaSprite('Pebble2', false);

	makeLuaSprite('Pebble3', 'Pebble3', 1800, 0);
	setLuaSpriteScrollFactor('Pebble3', 1, 1);
	addLuaSprite('Pebble3', false);
	
	makeAnimatedLuaSprite('beryl', 'shipBop', -350, -600);
	setLuaSpriteScrollFactor('static', 1, 1);
	addAnimationByPrefix('beryl', "rumble", "shipBop rumble", 24, true);
	addLuaSprite('beryl', false);
        objectPlayAnimation('beryl', 'rumble', true);
	
	makeLuaSprite('stainAura', 'stainAura', 0, -450);
	setLuaSpriteScrollFactor('stainAura', 1, 1);
	setObjectCamera('stainAura', 'other');	
	setProperty('stainAura.alpha', 0)
	addLuaSprite('stainAura', false);		

  	makeLuaSprite('WhiteScreen', 'WhiteScreen', 0, 0);
	setScrollFactor('WS', 3, 3);
	setObjectCamera('WhiteScreen', 'other');
	setProperty('WhiteScreen.alpha', 1)	
	addLuaSprite('WhiteScreen', false);		
end


function onUpdate()
	songPos = getSongPosition()
	local currentBeat = (songPos/5000)*(curBpm/60) --some flying shit from vs nonsense or somethin i didnt make this but its pretty cool so credits to whoever made it

		if curStep > 0 then
			doTweenY('opponentmove', 'dad', 200*math.sin((currentBeat+12*12)*math.pi), 3)
			doTweenX('disruptor2', 'disruptor2.Yellow', 0 - 60*math.sin((currentBeat+1*0.1)*math.pi), 6)
			doTweenY('disruptor2', 'disruptor2.Yellow', 0 - 16*math.sin((currentBeat+1*1)*math.pi), 6)
		
		end

		  if curStep > 50 and curStep < 400 and getProperty('WhiteScreen.alpha') > 0 then
		  
			setProperty('WhiteScreen.alpha', getProperty('WhiteScreen.alpha') - 0.0015)	
			
		  end

		  if curStep > 2144 and curStep < 2180 and getProperty('WhiteScreen.alpha') < 1 then
		  
			setProperty('WhiteScreen.alpha', getProperty('WhiteScreen.alpha') + 0.07)

		  end
				
		  if curStep == 2176 then

			triggerEvent('Change Character', 'dad', 'black-pearl-v4-insane_STAIN')
				
		  end		
				
		  if curStep > 2240 and curStep < 2290 and getProperty('WhiteScreen.alpha') > 0 then
		  
			setProperty('WhiteScreen.alpha', getProperty('WhiteScreen.alpha') - 0.05)	
			
		  end
		 
		  --doTweenY('Pebble1', 'Pebble1', 4000*math.sin((currentBeat+12*12)*math.pi), 0.01)		  
		  --spaghetti code ahead
		  
		  --PEBBLE 1
		  Peb1ACCEL = Peb1ACCEL * 1.01
		  setProperty('Pebble1.y', getProperty('Pebble1.y') - (2 * Peb1ACCEL))
		  
		  if getProperty('Pebble1.y') < -1000 then
			setProperty('Pebble1.y', 1500)
			Peb1ACCEL = 1.1
		  end

		  --PEBBLE 2
		  Peb2ACCEL = Peb2ACCEL * 1.012
		  setProperty('Pebble2.y', getProperty('Pebble2.y') - (2 * Peb2ACCEL))
		  
		  if getProperty('Pebble2.y') < -1000 then
			setProperty('Pebble2.y', 2000)
			Peb2ACCEL = 1.4
		  end
		  
		  --PEBBLE 3
		  Peb3ACCEL = Peb3ACCEL * 1.015
		  setProperty('Pebble3.y', getProperty('Pebble3.y') - (2 * Peb3ACCEL))
		  
		  if getProperty('Pebble3.y') < -1000 then
			setProperty('Pebble3.y', 1700)
			Peb3ACCEL = 1.2
		  end
		  
	      --BURN 1
		  Burn1ACCEL = Burn1ACCEL * 1.003
		  setProperty('beryl2.x', getProperty('beryl2.x') - (2 * Burn1ACCEL))
		  setProperty('beryl2.y', getProperty('beryl2.y') + 5)
		  
		  if getProperty('beryl2.x') < -25000 then
			setProperty('beryl2.x', 2500)
			setProperty('beryl2.y', -2500)
			Burn1ACCEL = 1.5
		  end

end

function onStartCountdown() --how to unfuck starting camera position ez fix --this isn't really necessary cause of the white screen but might as well do it
    triggerEvent('Camera Follow Pos',900,100)	
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
