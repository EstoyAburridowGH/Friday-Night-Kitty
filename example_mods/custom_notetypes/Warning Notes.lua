function onCreate()
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Warning Notes' then
            setPropertyFromGroup('unspawnNotes', i, 'texture', 'WARNINGNOTE_assets')

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false);
			end

			if getPropertyFromClass('Warning', 'canAppear') == false then
				removeFromGroup('unspawnNotes', i);
			end
		end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Warning Notes' then
        characterPlayAnim('dad', 'attack', true)
        setProperty('dad.specialAnim', true)

        characterPlayAnim('boyfriend', 'dodge', true)
        setProperty('boyfriend.specialAnim', true)
		
        cameraShake('camGame', 0.01, 0.2)

		playSound('20220417-1_360p', 1)
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Warning Notes' then
		playSound('20220417-1_360p', 1)
        setProperty('health', -1)
	end
end