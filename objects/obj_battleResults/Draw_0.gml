/// @description Insert description here
// You can write your code in this editor
draw_self();

// Draw profile image
var profileLeft = x - sprite_width/2 + 64;
var profileTop = y - sprite_height/2 + 128;
var profileSize = 224;
draw_sprite_pos(global.player.portrait, 0, profileLeft, profileTop, profileLeft + profileSize, profileTop, profileLeft + profileSize, profileTop + profileSize, profileLeft, profileTop + profileSize, 1);

// Draw player level
var textLeft = x - sprite_width/2 + 352;
var textBottom = y - sprite_height/2 + 192;

draw_set_color(#FFFFFF);
draw_set_font(fnt_sideName);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

draw_text(textLeft, textBottom, "LV " + string(global.playerLevel));

// Draw player name
textBottom = y - sprite_height/2 + 352;
draw_text(textLeft, textBottom, global.player.myName);

// Draw player money
var textRight = x - sprite_width/2 + 480; 
textBottom = y - sprite_height/2 + 522;
draw_set_halign(fa_right);
draw_text(textRight, textBottom, string(global.dungeonMoney));

// Draw money gain
textRight = x - sprite_width/2 + 864;
draw_text(textRight, textBottom, string(rewardMoney));

// Draw exp gain
textBottom = y - sprite_height/2 + 224;
draw_text(textRight, textBottom, "+ " + string(rewardExp) + " EXP");
