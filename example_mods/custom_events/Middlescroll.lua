--'"Edited my own script to use in a mod. Nice." -Miner

function onEvent(name, value1, value2)
    if name == 'Middlescroll' then
        if not middlescroll then
	        if value1 == 'On' then
                noteTweenAlpha('note movement1', 0, 0, value2, 'cubeInOut')
                noteTweenAlpha('note movement2', 1, 0, value2, 'cubeInOut')
                noteTweenAlpha('note movement3', 2, 0, value2, 'cubeInOut')
                noteTweenAlpha('note movement4', 3, 0, value2, 'cubeInOut')
                noteTweenX('note movement5', 4, 412, value2, 'cubeInOut')
                noteTweenX('note movement6', 5, 524, value2, 'cubeInOut')
                noteTweenX('note movement7', 6, 636, value2, 'cubeInOut')
                noteTweenX('note movement8', 7, 748, value2, 'cubeInOut')
                noteTweenX('note movement9', 0, 412, value2, 'cubeInOut')
                noteTweenX('note movement10', 1, 524, value2, 'cubeInOut')
                noteTweenX('note movement11', 2, 636, value2, 'cubeInOut')
                noteTweenX('note movement12', 3, 748, value2, 'cubeInOut')
            end
		    if value1 == 'Off' then
                noteTweenAlpha('note movement1', 0, 1, value2, 'cubeInOut')
                noteTweenAlpha('note movement2', 1, 1, value2, 'cubeInOut')
                noteTweenAlpha('note movement3', 2, 1, value2, 'cubeInOut')
                noteTweenAlpha('note movement4', 3, 1, value2, 'cubeInOut')
                noteTweenX('note movement5', 4, 732, value2, 'cubeInOut')
                noteTweenX('note movement6', 5, 844, value2, 'cubeInOut')
                noteTweenX('note movement7', 6, 956, value2, 'cubeInOut')
                noteTweenX('note movement8', 7, 1068, value2, 'cubeInOut')
                noteTweenX('note movement9', 0, 92, value2, 'cubeInOut')
                noteTweenX('note movement10', 1, 204, value2, 'cubeInOut')
                noteTweenX('note movement11', 2, 316, value2, 'cubeInOut')
                noteTweenX('note movement12', 3, 428, value2, 'cubeInOut')
		    end
        end
    end
end
