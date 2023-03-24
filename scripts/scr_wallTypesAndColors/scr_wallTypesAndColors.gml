global.dungeonFogColors = [
	//[[0xDFDFDF, 1], [0xE8E8E8, 1], [0xEFEFEF, 1], [0xF8F8F8, 1], [0xFFFFFF, 1]]
	[[0xDADADA, 1], [0xDDDDDD, 1], [0xF0F0F0, 1], [0xF3F3F3, 1], [0xFFFFFF, 1]]
]

function getColor(index, palette){
	index = ceil(index/2);
	var col = global.dungeonFogColors[palette];
	return col[index];
}

function getWallSprite(index){
	var val = index-1;
	var spr = [spr_hedgeWall, spr_hedgeFloor, spr_backRoof, spr_sewerArchway]; // Add to this to add more sprites
	return spr[val];
}