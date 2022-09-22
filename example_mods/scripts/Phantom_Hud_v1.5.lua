-- PhantomHud v2 by MayroDev
-- Thanks to SaraHUD,RamenDominoes and to some random guys in discord
--------------------------------------------------------------------
--                           CONFIGS
--------------------------------------------------------------------

--timebar color
timeBarColor = 'FFFFFF' -- default: FFFFFF

--side info
sideinfo = true -- default: true

--Keystrokes
keystrokes = true -- default: true

--keystrokes colors
LeftKeyColor = 'FFFFFF' -- default: FFFFFF
DownKeyColor = 'FFFFFF' -- default: FFFFFF
UpKeyColor = 'FFFFFF' -- default: FFFFFF
RightKeyColor = 'FFFFFF' -- default: FFFFFF

--keystrokes letters colors
LeftLetterColor = 'FFFFFF' -- default: FFFFFF
DownLetterColor = 'FFFFFF' -- default: FFFFFF
UpLetterColor = 'FFFFFF' -- default: FFFFFF
RightLetterColor = 'FFFFFF' -- default: FFFFFF

--keystrokes letters(pressed) colors
LeftLetterPressedColor = '7f7f7f' -- default: 7f7f7f
DownLetterPressedColor = '7f7f7f' -- default: 7f7f7f
UpLetterPressedColor = '7f7f7f' -- default: 7f7f7f
RightLetterPressedColor = '7f7f7f' -- default: 7f7f7f

--keystoke text
LeftKeyText = 'Left' -- default: Left
DownKeyText = 'Down' -- default: Down
UpKeyText = 'Up' -- default: Up
RightKeyText = 'Right' -- default: Right

--HEY!! animation
heyanim = true -- default: true
heyanimkey = 'space' -- default: space

--botplay text
botplaytext = "BOTPLAY" -- default: BOTPLAY

--background
Transparency = 0.7 -- default: 0.7
BorderColor = 'FFFFFF' -- default: FFFFFF
LaneOffset = 9 -- default: 9
local UnderLayWidth = 470 -- default: 470
local BorderWidth = 6 -- default: 6

--combo offset
local comboOffsetW = {0, 0, -167, 0}

--healthbar settings
local border_color = "000000" -- default: 000000
local override_colors = false -- default: false
local override_p1_color = "00ffff" -- default: 00ffff
local override_p2_color = "ff0000" -- default: ff0000

--------------------------------------------------------------------
--                           CODE
--------------------------------------------------------------------

--healthbar stuff
local p1_offset_x = -26 -- default: -26
local p1_offset_y = 0 -- default: 0
local p2_offset_x = 26 -- default: 26
local p2_offset_y = 0 -- default: 0

local style = "edge" -- inner, center, edge, outer

local width = 400 -- default: 593
local height = 20 -- default: 11

local bar_offset_x = 0 -- default: 0
local bar_offset_y = 0 -- default: 0
local border_thickness = 4 -- default: 4

--side info
notehitlol = 0

--healthbar code stuff
local function to_hex(rgb)
    return string.format("%x", (rgb[1] * 0x10000) + (rgb[2] * 0x100) + rgb[3])
end

local sprite_border = "healthbar_border"
local sprite_p1 = "healthbar_p1"
local sprite_p2 = "healthbar_p2"

local bar_origin_x 
local bar_origin_y

local p_origin_y
function onCreatePost()
    --healthbar stuff
    setProperty("healthBarBG.visible", false)
    setProperty("healthBar.visible", false)

    bar_origin_x = 100
    bar_origin_y = 52
    p_origin_y = getProperty("iconP1.y")

    makeLuaSprite(sprite_border, "",
        bar_origin_x - border_thickness + bar_offset_x,
        bar_origin_y - border_thickness + bar_offset_y
    )
    makeGraphic(sprite_border,
        width + (border_thickness * 2),
        height + (border_thickness * 2),
        border_color
    )
    addLuaSprite(sprite_border, true)
    setObjectCamera(sprite_border, "hud")
    setObjectOrder(sprite_border, 0)

    makeLuaSprite(sprite_p1, "",
        bar_origin_x + (width / 2) + bar_offset_x,
        bar_origin_y + bar_offset_y
    )
    makeGraphic(sprite_p1,
        (width / 2),
        height,
        override_colors and override_p1_color or to_hex(getProperty("boyfriend.healthColorArray"))
    )
    addLuaSprite(sprite_p1, true)
    setObjectCamera(sprite_p1, "hud")
    setObjectOrder(sprite_p1, 2)
    setProperty(sprite_p1 .. ".origin.x", getProperty(sprite_p1 .. ".width"))

    makeLuaSprite(sprite_p2, "",
        bar_origin_x + bar_offset_x,
        bar_origin_y + bar_offset_y
    )
    makeGraphic(sprite_p2,
        (width / 2),
        height,
        override_colors and override_p2_color or to_hex(getProperty("dad.healthColorArray"))
    ) 
    addLuaSprite(sprite_p2, true)
    setObjectCamera(sprite_p2, "hud")
    setObjectOrder(sprite_p2, 1)
    setProperty(sprite_p2 .. ".origin.x", 0)

    --misses
    makeLuaText('misses', 'Misses: ' .. getProperty('songMisses'), 200, 0, 590);
	setTextAlignment('misses', 'left')
	setProperty('misses.x', 50)
	setTextSize('misses', 20)
	addLuaText('misses');
    --score
	makeLuaText('score', 'Score: ' .. score, 200, 0, 620);
	setTextAlignment('score', 'left')
	setProperty('score.x', 50)
	setTextSize('score', 20)
	addLuaText('score');
    --rating
	makeLuaText('rating', 'Rating: ' .. getProperty('ratingName'), 600, 0, 650);
	setTextAlignment('rating', 'left')
	setProperty('rating.x', 50)
	setTextSize('rating', 20)
	addLuaText('rating');

	setTextString('scoreTxt', 'Rating: ' .. getProperty(rating))
	setProperty('scoreTxt.visible', false)

        --keystrokes
    if keystrokes == true then
        makeLuaSprite('upButton', nil, 500, 540)
        makeGraphic('upButton', 65, 65)

        makeLuaSprite('downButton', nil, 500, 610)
        makeGraphic('downButton', 65, 65)

        makeLuaSprite('leftButton', nil, 430, 610)
        makeGraphic('leftButton', 65, 65)

        makeLuaSprite('rightButton', nil, 570, 610)
        makeGraphic('rightButton', 65, 65)

        makeLuaSprite('3', nil, 500, 540)
        makeGraphic('3', 65, 65, UpKeyColor)

        makeLuaSprite('2', nil, 500, 610)
        makeGraphic('2', 65, 65, DownKeyColor)

        makeLuaSprite('1', nil, 430, 610)
        makeGraphic('1', 65, 65, LeftKeyColor)

        makeLuaSprite('4', nil, 570, 610)
        makeGraphic('4', 65, 65, RightKeyColor)

        addLuaSprite('upButton', true)
        setObjectCamera('upButton', 'hud')

        addLuaSprite('downButton', true)
        setObjectCamera('downButton', 'hud')

        addLuaSprite('leftButton', true)
        setObjectCamera('leftButton', 'hud')

        addLuaSprite('rightButton', true)
        setObjectCamera('rightButton', 'hud')

        addLuaSprite('3', true)
        setObjectCamera('3', 'hud')
	    setProperty('3.alpha', 0)

        addLuaSprite('2', true)
        setObjectCamera('2', 'hud')
	    setProperty('2.alpha', 0)

        addLuaSprite('1', true)
        setObjectCamera('1', 'hud')
	    setProperty('1.alpha', 0)

        addLuaSprite('4', true)
        setObjectCamera('4', 'hud')
	    setProperty('4.alpha', 0)


        makeLuaText('upText', UpKeyText, 60, getProperty('upButton.x'), getProperty('upButton.y') + 20)
        setTextAlignment('upText', 'center')
        setObjectCamera('upText', 'hud')
        setTextSize('upText', 20)
        setTextBorder('upText', 0, 000000)
        addLuaText('upText')

        makeLuaText('downText', DownKeyText, 60, getProperty('downButton.x'), getProperty('downButton.y') + 20)
        setTextAlignment('downText', 'center')
        setObjectCamera('downText', 'hud')
        setTextSize('downText', 20)
        setTextBorder('downText', 0, 000000)
        addLuaText('downText')

        makeLuaText('leftText', LeftKeyText, 60, getProperty('leftButton.x') + 2, getProperty('leftButton.y') + 20)
        setTextAlignment('leftText', 'center')
        setObjectCamera('leftText', 'hud')
        setTextSize('leftText', 20)
        setTextBorder('leftText', 0, 000000)
        addLuaText('leftText')

        makeLuaText('rightText', RightKeyText, 65, getProperty('rightButton.x') - 1, getProperty('rightButton.y') + 20)
        setTextAlignment('rightText', 'center')
        setObjectCamera('rightText', 'hud')
        setTextSize('rightText', 20)
        setTextBorder('rightText', 0, 000000)
        addLuaText('rightText')
    end

    --keystrokes
    if keystrokes == true then
        if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
        
        makeLuaSprite('upButton', nil, 500, 540)
        makeGraphic('upButton', 65, 65)

        makeLuaSprite('downButton', nil, 500, 610)
        makeGraphic('downButton', 65, 65)

        makeLuaSprite('leftButton', nil, 430, 610)
        makeGraphic('leftButton', 65, 65)

        makeLuaSprite('rightButton', nil, 570, 610)
        makeGraphic('rightButton', 65, 65)

        makeLuaSprite('3', nil, 500, 540)
        makeGraphic('3', 65, 65, UpKeyColor)

        makeLuaSprite('2', nil, 500, 610)
        makeGraphic('2', 65, 65, DownKeyColor)

        makeLuaSprite('1', nil, 430, 610)
        makeGraphic('1', 65, 65, LeftKeyColor)

        makeLuaSprite('4', nil, 570, 610)
        makeGraphic('4', 65, 65, RightKeyColor)

    elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == true then

        makeLuaSprite('upButton', nil, 1100 - 30, 540)
        makeGraphic('upButton', 65, 65)

        makeLuaSprite('downButton', nil, 1100 - 30, 610)
        makeGraphic('downButton', 65, 65)

        makeLuaSprite('leftButton', nil, 1030 - 30, 610)
        makeGraphic('leftButton', 65, 65)

        makeLuaSprite('rightButton', nil, 1170 - 30, 610)
        makeGraphic('rightButton', 65, 65)

        makeLuaSprite('3', nil, 1100 - 30, 540)
        makeGraphic('3', 65, 65, UpKeyColor)

        makeLuaSprite('2', nil, 1100 - 30, 610)
        makeGraphic('2', 65, 65, DownKeyColor)

        makeLuaSprite('1', nil, 1030 - 30, 610)
        makeGraphic('1', 65, 65, LeftKeyColor)

        makeLuaSprite('4', nil, 1170 - 30, 610)
        makeGraphic('4', 65, 65, RightKeyColor)

    end
        addLuaSprite('upButton', true)
        setObjectCamera('upButton', 'hud')

        addLuaSprite('downButton', true)
        setObjectCamera('downButton', 'hud')

        addLuaSprite('leftButton', true)
        setObjectCamera('leftButton', 'hud')

        addLuaSprite('rightButton', true)
        setObjectCamera('rightButton', 'hud')

        addLuaSprite('3', true)
        setObjectCamera('3', 'hud')
	    setProperty('3.alpha', 0)

        addLuaSprite('2', true)
        setObjectCamera('2', 'hud')
	    setProperty('2.alpha', 0)

        addLuaSprite('1', true)
        setObjectCamera('1', 'hud')
	    setProperty('1.alpha', 0)

        addLuaSprite('4', true)
        setObjectCamera('4', 'hud')
	    setProperty('4.alpha', 0)


        makeLuaText('upText', UpKeyText, 60, getProperty('upButton.x'), getProperty('upButton.y') + 20)
        setTextAlignment('upText', 'center')
        setObjectCamera('upText', 'hud')
        setTextSize('upText', 20)
        setTextBorder('upText', 0, 000000)
        addLuaText('upText')

        makeLuaText('downText', DownKeyText, 60, getProperty('downButton.x'), getProperty('downButton.y') + 20)
        setTextAlignment('downText', 'center')
        setObjectCamera('downText', 'hud')
        setTextSize('downText', 20)
        setTextBorder('downText', 0, 000000)
        addLuaText('downText')

        makeLuaText('leftText', LeftKeyText, 60, getProperty('leftButton.x') + 2, getProperty('leftButton.y') + 20)
        setTextAlignment('leftText', 'center')
        setObjectCamera('leftText', 'hud')
        setTextSize('leftText', 20)
        setTextBorder('leftText', 0, 000000)
        addLuaText('leftText')

        makeLuaText('rightText', RightKeyText, 65, getProperty('rightButton.x') - 1, getProperty('rightButton.y') + 20)
        setTextAlignment('rightText', 'center')
        setObjectCamera('rightText', 'hud')
        setTextSize('rightText', 20)
        setTextBorder('rightText', 0, 000000)
        addLuaText('rightText')
    end
end

function onRecalculateRating()
    --rating and score stuff
	setTextString('misses', 'Misses: ' .. getProperty('songMisses'));
	setTextString('rating', 'Rating: ' .. getProperty('ratingName') .. '   [' .. string.format("%.2f%%", rating * 100) .. ']   ' .. getProperty('ratingFC'));
	setTextString('score', 'Score: ' .. score);
end

function onUpdatePost()

    --healthbar stuff
    local percent_p1 = (getProperty("healthBar.percent") / 100)
    local percent_p2 = 1 - percent_p1

    local scale_p1 = (percent_p1 * 2) + (percent_p1 < 1 and 0.01 or 0)
    local scale_p2 = percent_p2 * 2
    setProperty(sprite_p1 .. ".scale.x", scale_p1)
    setProperty(sprite_p2 .. ".scale.x", scale_p2)

    local real_width_p1 = getProperty(sprite_p1 .. ".width") * scale_p1
    local real_width_p2 = getProperty(sprite_p2 .. ".width") * scale_p2

    local center_p1 = -getProperty("iconP1.frameWidth") / 2
    local center_p2 = -getProperty("iconP2.frameWidth") / 2

    local temp_x_p1 = {
        ["inner"] = bar_origin_x + real_width_p2 + p1_offset_x,
        ["center"] = bar_origin_x + real_width_p2 + (real_width_p1 / 2) + center_p1,
        ["edge"] = bar_origin_x + width + center_p1,
        ["outer"] = bar_origin_x + width + center_p1 + 150 + p1_offset_x
    }

    local temp_x_p2 = {
        ["inner"] = bar_origin_x + real_width_p2 - 150 + p2_offset_x,
        ["center"] = bar_origin_x + (real_width_p2 / 2) + center_p2,
        ["edge"] = bar_origin_x + center_p2,
        ["outer"] = bar_origin_x + center_p2 - 150 + p2_offset_x
    }

    setProperty(sprite_border .. ".x", bar_origin_x - border_thickness + bar_offset_x)
    setProperty(sprite_border .. ".y", bar_origin_y - border_thickness + bar_offset_y)

    setProperty(sprite_p1 .. ".x", bar_origin_x + (width / 2) + bar_offset_x)
    setProperty(sprite_p1 .. ".y", bar_origin_y + bar_offset_y)

    setProperty(sprite_p2 .. ".x", bar_origin_x + bar_offset_x)
    setProperty(sprite_p2 .. ".y", bar_origin_y + bar_offset_y)

    setProperty("iconP1.x", (temp_x_p1[style] or temp_x_p1["inner"]) + bar_offset_x)
    setProperty("iconP2.x", (temp_x_p2[style] or temp_x_p2["inner"]) + bar_offset_x)
    setProperty("iconP1.y", p_origin_y + bar_offset_y + p1_offset_y)
    setProperty("iconP2.y", p_origin_y + bar_offset_y + p2_offset_y)

    --Icons Stuff
    setProperty('iconP1.x', 0)
	setProperty('iconP2.x', 10000)
	if getPropertyFromClass('ClientPrefs', 'downScroll') == false then
		setProperty('iconP1.y', 0)
	end

    -- Timebar stuff
	setProperty('timeTxt.x', -20)
	setProperty('timeTxt.y', 70)
	setProperty('timeTxt.size', 20)
	setProperty('timeBar.x', 70)
	setProperty('timeBar.y', 78)
    setProperty('timeBar.color', getColorFromHex(timeBarColor))
end


function onCreate()
    --healthbar text
    makeLuaText('healthText', ' ' .. math.floor(getProperty("health") * 50), 150, 100, 50)
    addLuaText('healthText')
    setTextSize('healthText', 20);
    --song name and diff
    makeLuaText('songdif', ' ' ..songName..' - '..difficultyName, 300, 90, 90)
    addLuaText('songdif')
    setTextSize('songdif', 20);
    --bg stuff
    if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then

    makeLuaSprite('UnderLay', '', ((screenWidth/1.335)-(UnderLayWidth/2)) +- LaneOffset, 0)
    makeGraphic('UnderLay', UnderLayWidth, screenHeight, '000000')
    addLuaSprite('UnderLay', false)
    setObjectCamera('UnderLay', 'HUD')
    setProperty('UnderLay.alpha', Transparency)

    makeLuaSprite('BorderLeft', '', ((screenWidth/1.335)+(UnderLayWidth/2)) +- LaneOffset, 0)
    makeGraphic('BorderLeft', BorderWidth, screenHeight, BorderColor)
    addLuaSprite('BorderLeft', false)
    setObjectCamera('BorderLeft', 'HUD')
    setProperty('BorderLeft.alpha', 1)

    makeLuaSprite('BorderRight', '', ((screenWidth/1.335)-(UnderLayWidth/2)) +- LaneOffset, 0)
    makeGraphic('BorderRight', BorderWidth, screenHeight, BorderColor)
    addLuaSprite('BorderRight', false)
    setObjectCamera('BorderRight', 'HUD')
    setProperty('BorderRight.alpha', 1)

    elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == true then

    makeLuaSprite('UnderLay', '', ((screenWidth/1.335)-(UnderLayWidth/2)) +- LaneOffset + -330, 0)
    makeGraphic('UnderLay', UnderLayWidth, screenHeight, '000000')
    addLuaSprite('UnderLay', false)
    setObjectCamera('UnderLay', 'HUD')
    setProperty('UnderLay.alpha', Transparency)

    makeLuaSprite('BorderLeft', '', ((screenWidth/1.335)+(UnderLayWidth/2)) +- LaneOffset + -330, 0)
    makeGraphic('BorderLeft', BorderWidth, screenHeight, BorderColor)
    addLuaSprite('BorderLeft', false)
    setObjectCamera('BorderLeft', 'HUD')
    setProperty('BorderLeft.alpha', 1)

    makeLuaSprite('BorderRight', '', ((screenWidth/1.335)-(UnderLayWidth/2)) +- LaneOffset + -330, 0)
    makeGraphic('BorderRight', BorderWidth, screenHeight, BorderColor)
    addLuaSprite('BorderRight', false)
    setObjectCamera('BorderRight', 'HUD')
    setProperty('BorderRight.alpha', 1)

    end

    --botplay fix
    get = getRandomInt(1,1)

    --side info
    if sideinfo == true then
        makeLuaText("tnh", 'Notes Hits: 0', 250, 0, 300);
        setObjectCamera("tnh", 'hud');
        setTextSize('tnh', 20);
        addLuaText("tnh");
        setTextAlignment('tnh', 'left')
        setProperty('tnh.x', 50)

        makeLuaText("cm", 'Combos: 0', 200, -getProperty('tnh.x'), getProperty('tnh.y') + 30);
        setObjectCamera("cm", 'hud');
        setTextSize('cm', 20);
        addLuaText("cm");
        setTextAlignment('cm', 'left')
        setProperty('cm.x', 50)

        makeLuaText("sick", 'Sicks: 0', 200, getProperty('cm.x'), getProperty('cm.y') + 30);
        setObjectCamera("sick", 'hud');
        setTextSize('sick', 20);
        addLuaText("sick");
        setTextAlignment('sick', 'left')
        setProperty('sick.x', 50)

        makeLuaText("good", 'Goods: 0', 200, getProperty('cm.x'), getProperty('sick.y') + 30);
        setObjectCamera("good", 'hud');
        setTextSize('good', 20);
        addLuaText("good");
        setTextAlignment('good', 'left')
        setProperty('good.x', 50)

        makeLuaText("bad", 'Bads: 0', 200, getProperty('cm.x'), getProperty('good.y') + 30);
        setObjectCamera("bad", 'hud');
        setTextSize('bad', 20);
        addLuaText("bad");
        setTextAlignment('bad', 'left')
        setProperty('bad.x', 50)

        makeLuaText("shit", 'Shits: 0', 200, getProperty('cm.x'), getProperty('bad.y') + 30);
        setObjectCamera("shit", 'hud');
        setTextSize('shit', 20);
        addLuaText("shit");
        setTextAlignment('shit', 'left')
        setProperty('shit.x', 50)
    end
end

function onUpdate(elapsed)
    --healthbar text
    setTextString('healthText', ' ' .. math.floor(getProperty("health") * 50))
    --hey!!
    if heyanim == true then
        if keyJustPressed(heyanimkey) then
		    characterPlayAnim('boyfriend', 'hey', true);
		    setProperty('boyfriend.emote', true);
	    end
    end
    --botplay fix
    if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
        if get == 1 then
	    	setTextString("botplayTxt", botplaytext)
            setProperty('botplayTxt.x', 740)
	        setProperty('botplayTxt.y', 300)
            setObjectCamera("botplayTxt", 'hud');
	    end
    elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
        if get == 1 then
            setTextString("botplayTxt", botplaytext)
            setProperty('botplayTxt.x', 390)
            setProperty('botplayTxt.y', 300)
            setObjectCamera("botplayTxt", 'hud');
        end
    end
    --keystrokes
    if keystrokes == true then
        if keyPressed('up') then
         setProperty('3.alpha', 1)
          cancelTween('3Fade')
           setTextColor('upText', UpLetterPressedColor)
        else
           doTweenAlpha('3Fade', '3', 0.3, 0.15, 'linear')
           setTextColor('upText', UpLetterColor)
        end

        if keyPressed('down') then
            setProperty('2.alpha', 1)
            cancelTween('2Fade')
            setTextColor('downText', DownLetterPressedColor)
        else
            doTweenAlpha('2Fade', '2', 0.3, 0.15, 'linear')
            setTextColor('downText', DownLetterColor)
        end

        if keyPressed('left') then
            setProperty('1.alpha', 1)
            cancelTween('1Fade')
            setTextColor('leftText', LeftLetterPressedColor)
        else
            doTweenAlpha('1Fade', '1', 0.3, 0.15, 'linear')
            setTextColor('leftText', LeftLetterColor)
        end

        if keyPressed('right') then
            setProperty('4.alpha', 1)
            cancelTween('4Fade')
            setTextColor('rightText', RightLetterPressedColor)
        else
            doTweenAlpha('4Fade', '4', 0.3, 0.15, 'linear')
            setTextColor('rightText', RightLetterColor)
        end
    end
    --side info
    if sideinfo == true then
        notehitloltosting = tostring(notehitlol)
        setTextString('cm', 'Combos: ' .. getProperty('combo'))
        setTextString('sick', 'Sicks: ' .. getProperty('sicks'))
        setTextString('good', 'Goods: ' .. getProperty('goods'))
        setTextString('bad', 'Bads: ' .. getProperty('bads'))
        setTextString('shit', 'Shits: ' .. getProperty('shits'))
    end
end

function noteMiss()
    --miss color stuff
	setProperty('healthBar.color', getColorFromHex('5f1ea4'))
	doTweenColor('healthBar', 'healthBar', 'FFFFFF', 0.4, 'linear')
	setProperty('iconP1.color', getColorFromHex('5f1ea4'))
	doTweenColor('iconP1', 'iconP1', 'FFFFFF', 0.4, 'linear')
	setProperty('boyfriend.color', getColorFromHex('5f1ea4'))
	doTweenColor('bfColorTween', 'boyfriend', 'FFFFFF', 0.4, 'linear')
end

function onCountdownStarted()
    for i = 0, getProperty("unspawnNotes.length") do
    	if not getPropertyFromGroup("unspawnNotes", i, "mustPress") then
        	setPropertyFromGroup("unspawnNotes", i, "visible", false);
    	end
    end

    for i = 0, 3 do
        setPropertyFromGroup("opponentStrums", i, "visible", false);
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    --combo popup
    if not lowQuality then
       if not isSustainNote and getProperty('combo') > 1 then
        if getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
            makeLuaSprite('combo' .. getProperty('combo'), 'combo', 550 + comboOffsetW[3] , 350 - comboOffsetW[4] )
        elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
            makeLuaSprite('combo' .. getProperty('combo'), 'combo', 1150 + comboOffsetW[3] , 350 - comboOffsetW[4] )
        end
          setObjectCamera('combo' .. getProperty('combo'), 'hud')
          scaleObject('combo' .. getProperty('combo'), 0.55, 0.55)
          addLuaSprite('combo' .. getProperty('combo'), false)
          setProperty('combo' .. getProperty('combo') .. '.velocity.y', 500)
          setProperty('combo' .. getProperty('combo') .. '.velocity.y', -130)
          doTweenAlpha('tweenCombo3' .. getProperty('combo'), 'combo' .. getProperty('combo'), 0, 0.4, 'quartIn')
       end
    end
    --side info
    if sideinfo == true then
        if not isSustainNote then    
            notehitlol = notehitlol + 1;
            setTextString('tnh', 'Notes Hits: ' .. tostring(notehitlol))
        end
    end
end

function onTweenCompleted(tag)
if tag == 'tweenCombo3' then
removeLuaSprite('combo', true);
    end
end