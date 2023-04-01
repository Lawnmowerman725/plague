function getColor(index){
	index = ceil(index/2);
	var col = global.loadedPalette.fog;
	return col[index];
}

function getWallSprite(index){
	return global.loadedPalette.sprites[index];
}

function loadPalette(_index){
	global.loadedPalette = global.paletteDatabase[_index];
}