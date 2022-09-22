function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Pico_Bullets' then --Check if the note on the chart is a Bullet Note
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteskins/Pico_Bullets'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashHue', 0); --custom notesplash color, why not
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashSat', -20);
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashBrt', 1);

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); --Miss has penalties
			end
		end
	end
end

dodgeAnimations = {'dodgeLEFT', 'dodgeDOWN', 'dodgeUP', 'dodgeRIGHT'}
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'Pico_Bullets' then
		playSound('picoshoot', 0.5);
		characterPlayAnim('boyfriend', dodgeAnimations[noteData+1], true);
		setProperty('boyfriend.specialAnim', true);

		local animToPlay = '';
		if noteData == 0 then
			animToPlay = 'boyfriend dodgeLEFT';
		elseif noteData == 1 then
			animToPlay = 'boyfriend dodgeDOWN';
		elseif noteData == 2 then
			animToPlay = 'boyfriend dodgeUP';
		elseif noteData == 3 then
			animToPlay = 'boyfriend dodgeRIGHT';
		end
		characterPlayAnim('dad', 'singRIGHT-alt', true);
		setProperty('dad.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == 'Pico_Bullets' then
		setProperty('health', getProperty('health')-1);
		runTimer('bleed', 0.2, 20);
		playSound('picoshoot', 0.6);
		characterPlayAnim('boyfriend', 'hurt', true);
        characterPlayAnim('dad', 'singRIGHT-alt', true);
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.001);
	end
end