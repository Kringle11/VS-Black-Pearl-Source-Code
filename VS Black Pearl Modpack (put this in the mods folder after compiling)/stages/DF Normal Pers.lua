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

function onCreate()


	xx = 900
	xx2 = 1100
	yy = 0 --200
	yy2 = 200
	ofs = 30
	ofs2 = 30

-- background shit

	
	makeLuaSprite('StarSpace', 'StarSpace',-250, -650);
	setLuaSpriteScrollFactor('StarSpace', 0.5, 0.5);
	addLuaSprite('StarSpace', false);
	scaleObject('StarSpace', 0.6, 0.6)
	
	makeLuaSprite('EarthMoon', 'EarthMoon', 0, -600);
	setLuaSpriteScrollFactor('EarthMoon', 0.9, 0.9);
	addLuaSprite('EarthMoon', false);
	scaleObject('EarthMoon', 0.6, 0.6)
	
	makeLuaSprite('EscapePod', 'EscapePod', -700, -650);
	setLuaSpriteScrollFactor('EscapePod', 1, 1);
	addLuaSprite('EscapePod', false);
	
	makeLuaSprite('stainAura', 'stainAura', 0, -450);
	setLuaSpriteScrollFactor('stainAura', 1, 1);
	setObjectCamera('stainAura', 'other');	
	setProperty('stainAura.alpha', 0)
	addLuaSprite('stainAura', false);		
	
end

function onStartCountdown() --how to unfuck starting camera position ez fix
    triggerEvent('Camera Follow Pos',900,0)	
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
