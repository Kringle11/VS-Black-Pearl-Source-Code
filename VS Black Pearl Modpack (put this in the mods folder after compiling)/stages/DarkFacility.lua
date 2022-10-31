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


	xx = 900
	xx2 = 900
	yy = 100 --200
	yy2 = 350
	ofs = 30
	ofs2 = 30

-- background shit
	makeLuaSprite('DarkGround', 'DarkGround', 0, -450);
	setLuaSpriteScrollFactor('DarkGround', 1, 1);
	addLuaSprite('DarkGround', false);

	makeAnimatedLuaSprite('static', 'StaticCom', 755, -450);
	setLuaSpriteScrollFactor('static', 1, 1.1);
	addAnimationByPrefix('static', "dance", "StaticCom dance", 24, true);
	addLuaSprite('static', false);
        objectPlayAnimation('static', 'dance', true);

	makeAnimatedLuaSprite('beryl', 'Chrysoberyl', 450, -150);
	setLuaSpriteScrollFactor('static', 1, 1);
	addAnimationByPrefix('beryl', "dance", "Chrysoberyl dance", 24, true);
	addLuaSprite('beryl', false);
        objectPlayAnimation('beryl', 'dance', true);
	
	makeLuaSprite('stainAura', 'stainAura', 0, -450);
	setLuaSpriteScrollFactor('stainAura', 1, 1);
	setObjectCamera('stainAura', 'other');	
	setProperty('stainAura.alpha', 0)
	addLuaSprite('stainAura', false);	
	
-- kill gf
        setProperty('gfGroup.visible', false);
		
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
