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


	xx = 925
	xx2 = 925
	yy = 0 --100
	yy2 = 350
	ofs = 30
	ofs2 = 30

-- background shit
	makeLuaSprite('PSIIGrid', 'PSIIGrid', -125, -500);
	setLuaSpriteScrollFactor('PSIIGrid', 1, 1);
	addLuaSprite('PSIIGrid', false);
	
	makeAnimatedLuaSprite('beryl', 'NeifirstAura', 575, -505);
	setLuaSpriteScrollFactor('static', 1, 1);
	addAnimationByPrefix('beryl', "Vibe", "NeifirstAura Vibe", 24, true);
	addLuaSprite('beryl', false);
        objectPlayAnimation('beryl', 'Vibe', true);
		
	makeLuaSprite('PSIIParty', 'PSIIParty', -425, 600);
	setLuaSpriteScrollFactor('PSIIParty', 1, 1);
	addLuaSprite('PSIIParty', true);
	scaleObject('PSIIParty', 1.1, 1);
	
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
