//audio_master_gain(100);

function playBattleTheme(){
	audio_play_sound(global.musicBattle, 10, true);
}

function playBossTheme(){
	audio_play_sound(global.musicBoss, 10, true);
}

function playDungeonTheme(){
	audio_play_sound(global.musicDungeon, 10, true);
}

function stopBattleTheme(){
	audio_stop_sound(global.musicBattle);
	audio_stop_sound(global.musicBoss);
}

function stopDungeonTheme(){
	audio_stop_sound(global.musicDungeon);
}

function hitSFX(){
	audio_play_sound(snd_physHit1, 5, false);
}

function critSFX(){
	audio_play_sound(snd_critHit1, 5, false);
}

function magicSFX(){
	audio_play_sound(snd_magicAttack, 5, false);
}

function winSFX(){
	audio_play_sound(snd_battleWin, 5, false);
}

function loseSFX(){
	audio_play_sound(snd_lose, 5, false);
}

function missSFX(){
	audio_play_sound(snd_missSFX, 5, false);
}