--- Script Made By Skry#4271 ---
-- Please credit me :) --
-- Based on Sonic V2.5 --
-- You can put this in Scripts and make a credit lua in the song --
-- then use it like this --
--   function onCreatePost()
--    setTextString() --
--  end  --


enabled = true -- Set to true or false



coderUser = 'CODERUSER'--- Change to users if its only these people
composerUser = 'COMPOSERUSER'
artistUser = 'ARTISTUSER'
charterUser = 'CHARTER' 
mainColor =  '222222' -- Big Box Color
secondaryColor = '000000' -- Lines Color
SecondaryColor2 = 'FFFFFF' -- Text Color 
local speedthing = 0.6 --Speed Of it
local timething = 2.5 --Timer



function onCreate()
 if enabled == true then
      -- BIG BOX --
    makeLuaSprite('bigBox', 'BigBOX',  700, 1300)
    makeGraphic("bigBox", 700, 1300, mainColor)
    setObjectCamera('bigBox', 'other')
    setProperty('bigBox.alpha', 0.8)
    setProperty('bigBox.x', 300)
    setProperty('bigBox.y', -1300)
    addLuaSprite('bigBox', true)
    
      -- LINES FOR BIG BOX --
       ---LEFT---
    makeLuaSprite('lineLeft', 'lineLeft',  50, 1300)
    makeGraphic("lineLeft", 50, 1300, secondaryColor)
    setObjectCamera('lineLeft', 'other')
    setProperty('lineLeft.alpha', 0.85)
    setProperty('lineLeft.y', -1300)
    setProperty('lineLeft.x', 300)
    addLuaSprite('lineLeft', true)
       ---RIGHT--- 
    makeLuaSprite('lineRight', 'lineRight',  50, 1300)
    makeGraphic("lineRight", 50, 1300, secondaryColor)
    setObjectCamera('lineRight', 'other')
    setProperty('lineRight.alpha', 0.85)
    setProperty('lineRight.y', -1300)
    setProperty('lineRight.x', 950)
    addLuaSprite('lineRight', true)
       ---LINES---
    makeLuaText("CREDITSthing", "CREDITS", 1000, 0, -1000)
    makeLuaText("CODERthing", "CODER", 1000, 0, -1000)
    makeLuaText("COMPOSERthing", "COMPOSER", 1000, 0, -1000)
    makeLuaText("ARTISTthing", "ARTIST", 1000, 0, -1000)
    makeLuaText("CHARTERthing", "CHARTER", 1000, 0, -1000)
    addLuaText('CREDITSthing')
    addLuaText('CODERthing')
    addLuaText('COMPOSERthing')
    addLuaText('ARTISTthing')
    addLuaText('CHARTERthing')
      --above notes--
    setObjectCamera('CREDITSthing', 'other')
    setObjectCamera('CODERthing', 'other')
    setObjectCamera('COMPOSERthing', 'other')
    setObjectCamera('ARTISTthing', 'other')
    setObjectCamera('CHARTERthing', 'other')
    setObjectCamera('CREDITS', 'other')
    setObjectCamera('CODER', 'other')
    setObjectCamera('COMPOSER', 'other')
    setObjectCamera('ARTIST', 'other')
    setObjectCamera('CHARTER', 'other')





        -- CODER --
    makeLuaText("CODER", coderUser, 1000, 0, -1000)
    setObjectCamera('CODER', 'other')
    addLuaText('CODER')

        -- COMPOSER --
    makeLuaText("COMPOSER", composerUser, 1000, 0, -1000)
    setObjectCamera('COMPOSER', 'other')
    addLuaText('COMPOSER')

        -- ARTIST --
    makeLuaText("ARTIST", artistUser, 1000, 0, -1000)
    setObjectCamera('ARTIST', 'other')
    addLuaText('ARTIST')

         -- CHARTER --
    makeLuaText("CHARTER", charterUser, 1000, 0, -1000)
    setObjectCamera('CHARTER', 'other')
    addLuaText('CHARTER')

         -- COLORS --
    setTextColor('CREDITSthing', SecondaryColor2)
    setTextColor('CODERthing', SecondaryColor2)
    setTextColor('COMPOSERthing', SecondaryColor2)
    setTextColor('ARTISTthing', SecondaryColor2)
    setTextColor('CHARTERthing', SecondaryColor2)
    setTextColor('CODER', SecondaryColor2)
    setTextColor('COMPOSER', SecondaryColor2)
    setTextColor('ARTIST', SecondaryColor2)
    setTextColor('CHARTER', SecondaryColor2)
    

         -- largen --
     
    setTextSize('CREDITSthing', 35)
    setTextSize('CODERthing', 35)
    setTextSize('COMPOSERthing', 35)
    setTextSize('ARTISTthing', 35)
    setTextSize('CHARTERthing', 35)
    setTextSize('CODER', 35)
    setTextSize('COMPOSER', 35)
    setTextSize('ARTIST', 35)
    setTextSize('CHARTER', 35)

            -- texttAlignment --
         setProperty('CREDITSthing.x', 135)
         setProperty('CODERthing.x', 135)
         setProperty('COMPOSERthing.x', 135)
         setProperty('ARTISTthing.x', 135)
         setProperty('CHARTERthing.x', 135)
         setProperty('CREDITS.x', 135)
         setProperty('CODER.x', 135)
         setProperty('COMPOSER.x', 135)
         setProperty('ARTIST.x', 135)
         setProperty('CHARTER.x', 135)

 
 end
end
     
     
function onSongStart()
  if enabled == true then
    runTimer('ByeBye', timething)

    doTweenY("A", "bigBox", 0, speedthing, 'linear')
    doTweenY('B', 'CREDITSthing', 50, speedthing, 'linear')
	  doTweenY('C', 'CODERthing', 150, speedthing, 'linear')
    doTweenY('D', 'CODER', 200, speedthing, 'linear')
  	doTweenY('E', 'COMPOSERthing', 280, speedthing, 'linear')
    doTweenY('F', 'COMPOSER', 340, speedthing, 'linear')
	  doTweenY('G', 'ARTISTthing', 410, speedthing, 'linear')
	  doTweenY('H', 'ARTIST', 470, speedthing, 'linear')
	  doTweenY('I', 'CHARTERthing', 560, speedthing, 'linear')
    doTweenY('J', 'CHARTER', 620, speedthing, 'linear')
    doTweenY('K', 'lineLeft', 0, speedthing, 'linear')
    doTweenY('L', 'lineRight', 0, speedthing, 'linear')
  end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'ByeBye' then
        doTweenY("M", "bigBox", -1300, speedthing, 'linear')
        doTweenY('N', 'CREDITSthing', -1300, speedthing, 'linear')
        doTweenY('O', 'CODERthing', -1300, speedthing, 'linear')
        doTweenY('P', 'CODER', -1300, speedthing, 'linear')
        doTweenY('Q', 'COMPOSERthing', -1300, speedthing, 'linear')
        doTweenY('R', 'COMPOSER', -1300, speedthing, 'linear')
        doTweenY('S', 'ARTISTthing', -1300, speedthing, 'linear')
        doTweenY('T', 'ARTIST', -1300, speedthing, 'linear')
        doTweenY('U', 'CHARTERthing', -1300, speedthing, 'linear')
        doTweenY('V', 'CHARTER', -1300, speedthing, 'linear')
        doTweenY('W', 'lineLeft', -1300, speedthing, 'linear')
        doTweenY('X', 'lineRight', -1300, speedthing, 'linear')
    end
end
-- Again made by Skry#4271 --

