enum STATS
{
	hp,
	up,
	st,
	mg,
	df,
	ag,
	lu	
}

enum ELEMENTS
{
	phys,
	fire,
	water,
	elec,
	ground,
	wind,
	holy,
	forbid,
	heal,
	support,
	ailment,
	passive,
	unique
}

enum SPOILS
{
	ex,
	gold	
}

enum DROPS
{
	consumables,
	skills,
	weapons,
	armor,
	accessories,
	key
}

enum BATTLE
{
	flee,
	analyze,
	defend,
	item,
	skill	
}

enum ITEM
{
	hp,
	up,
	misc,
	damage,
	money
}

// wall actions
enum WALL
{
	none,		// 0
	stop,		// 1
	stairs,		// 2
	locked,		// 3
	shop,		// 4
	chest,		// 5
	emptyChest,	// 6
	npc,		// 7
	boss		// 8
}

// tile actions
enum TILE
{
	nothing,		// 0
	encounter1,		// 1
	encounter2,		// 2
	encounter3,		// 3
	encounter4		// 4
}

enum PALETTE
{
	none,
	wall1,
	wall2,
	archway,
	transWall,
	floor1,
	floor2,
	celi1,
	ceil2,
	doorClosed,
	doorOpen,
	doorLocked,
	eventRoom,
	stairs,
	background
}

enum CHEST
{
	category,
	index,
	quantity
}