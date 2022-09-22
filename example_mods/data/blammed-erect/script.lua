function onCreate()

    makeAnimatedLuaSprite('Incoming', 'Warning', -600, 200);
    scaleObject('Incoming', 0.95, 0.95);
    addAnimationByPrefix('Incoming', 'beep', 'beep', 1, true);
    setObjectCamera('Incoming', 'hud');
    addLuaSprite('Incoming');

    makeLuaSprite('Square', 'empty', 0, 0, true);
    makeGraphic('Square', 2000, 2000, '000000');
    setObjectCamera('Square', 'game');
    setLuaSpriteScrollFactor('Square', 0, 0);
    addLuaSprite('Square', true);

end

function onSongStart()
    doTweenAlpha('Square1', 'Square', 0, 3, 'linear');
end

function onUpdate(elapsed)
    objectPlayAnimation('Incoming', 'beep');
end

function onStepHit()
    if curStep == 36 then
        removeLuaSprite('Square', true);
        doTweenX('IncomingTweenX1', 'Incoming', 50, 1.5, 'cubeInOut');
    end
    if curStep == 122 then
        doTweenX('IncomingTweenX2', 'Incoming', -600, 1.25, 'cubeInOut');
    end
    if curStep == 158 then
        removeLuaSprite('Incoming', true);
    end
    if curStep == 910 then
        makeLuaSprite('Hud Top', 'empty', 0, -450, true);
        makeGraphic('Hud Top', 2000, 500, '000000');
        setObjectCamera('Hud Top', 'hud');
        setProperty('Hud top.alpha', 1);
        addLuaSprite('Hud Top');

        makeLuaSprite('Hud Bottom', 'empty', 0, 700, true);
        makeGraphic('Hud Bottom', 2000, 500, '000000');
        setObjectCamera('Hud Bottom', 'hud');
        setProperty('Hud Bottom.alpha', 1);
        addLuaSprite('Hud Bottom');

        setProperty('camGame.angle', 10);
    end
    if curStep == 913 then
        setProperty('Hud Bottom.y', 650);
        setProperty('Hud Top.y', -430);

        setProperty('camGame.angle', -10);
    end
    if curStep == 916 then
        setProperty('Hud Bottom.y', 625);
        setProperty('Hud Top.y', -400);

        setProperty('camGame.angle', 10);
    end
    if curStep == 919 then
        setProperty('camGame.angle', 0);
    end
    if curStep == 1055 then
        doTweenY('See ya1', 'Hud Top', -800, 0.5, 'cubeInOut');
        doTweenY('See ya2', 'Hud Bottom', 950, 0.5, 'cubeInOut');
    end
    if curStep == 1069 then
        removeLuaSprite('Hud Top', true);
        removeLuaSprite('Hud Bottom', true);
    end
end