function onCreate()
    setPropertyFromClass('GameOverSubstate', 'characterName', 'BF-Reanimated-dead'); --Character json file for the death animation
    setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'BF_Dies_Sound'); --put in mods/sounds/
    setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'BF_GameOver'); --put in assets/shared/music/
    setPropertyFromClass('GameOverSubstate', 'endSoundName', 'BF_GameOver_End'); --put in assets/shared/music/
end