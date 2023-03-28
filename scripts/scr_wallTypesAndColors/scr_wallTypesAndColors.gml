function getColor(index){
	index = ceil(index/2);
	var col = global.loadedPalette.fog;
	return col[index];
}

function getWallSprite(index){
	var val = index-1;
	var spr = global.loadedPalette.sprites;
	return spr[val];
}

function loadPalette(_index){
	global.loadedPalette = global.paletteDatabase[_index];
}