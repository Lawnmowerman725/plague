/// @description Insert description here
// You can write your code in this editor


if (scale <= 0 || myIndex - menuIndex < 2) exit;

var bottom = 31;
var left = -424;
var right = 103;


// Draw background
draw_sprite_ext(sprite_index, image_index, x, y, scale, scale, 0, itemColors[myColor], 1);


// Draw element icon
draw_sprite_ext(spr_itemIcons, myColor, x - 472 * scale, y, scale, scale, 0, #000000, 0.4);



// Draw shadow text for skill name
draw_set_alpha(1);
draw_set_color(#000000);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(fnt_sideName);

// Fix scale for big words
tooWideCheck(item.myName);

draw_text_transformed(x + (left + 4) * scale, y + bottom * scale, item.myName, scale * tooWideScale, scale * tooWideScale, 0);


// Draw shadow text for up cost
draw_set_halign(fa_right);
draw_text_transformed(x + (right) * scale, y + bottom * scale, "x" + string(global.consumables[$ item.myName]), scale * amountScale, scale * amountScale, 0);

// Draw normal text for skill name
draw_set_color(#FFFFFF);
draw_set_halign(fa_left);
draw_set_valign(fa_bottom);

draw_text_transformed(x + left * scale, y + (bottom - 4) * scale, item.myName, scale * tooWideScale, scale * tooWideScale, 0);


// Draw normal text for up cost
draw_set_halign(fa_right);
if (!useable){
	draw_set_color(#999999);
}
draw_text_transformed(x + (right - 4) * scale, y + (bottom - 4) * scale, "x" + string(global.consumables[$ item.myName]), scale * amountScale, scale * amountScale, 0);

