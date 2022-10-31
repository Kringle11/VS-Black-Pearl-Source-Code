function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Stain Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'Stain_Notes'); --Change texture

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
			    setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --If true then the note can be missed without penalties
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
local poisonTimer = 0;
local poisonMultiply = 0;

function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == "Stain Note" then
       --B^U
	     poisonTimer = poisonTimer + 300;
		 poisonMultiply = poisonMultiply + 1;
         setProperty('stainAura.alpha', 0.75);
	end 
end

function onUpdate(elapsed)
  if poisonTimer > 0 then
	
	setProperty('stainAura.x', getProperty('iconP1.x'))
	setProperty('stainAura.y', getProperty('iconP1.y'))
	
    setProperty('stainAura.angle', getProperty('stainAura.angle') + 3 * poisonMultiply);
    poisonTimer = poisonTimer - 1;
	setProperty('health', getProperty('health') - 0.0005 * poisonMultiply);
	
	 if poisonTimer < 80 then 
	   setProperty('stainAura.alpha', getProperty('stainAura.alpha') - 0.01);   
     end	
	
	 if poisonTimer < 1 then 
	   setProperty('stainAura.alpha', 0);
	   setProperty('stainAura.angle', 0);
	   poisonTimer = 0;
       poisonMultiply = 0;	   
     end
  end
end