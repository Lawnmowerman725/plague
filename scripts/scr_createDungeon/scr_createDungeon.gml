global.xPos = 1;
global.yPos = 1;
global.dungeonFloor = 3;
global.dungeonAmountOfFloors = 4;
global.facing = 1;
global.maxCool = 18;
global.turnAnimation = 0;
global.walkForTime = 12;
global.encounterTimer = 100;
global.clearCondition = 0;
global.idleTimer = 0;
global.exitOpen = true; // floor key or boss req
global.dungeonChests = []; // chests reference this array for their contents
global.dungeonShop = []; // similar to chests
global.dungeonNPC = []; // stores npc messages

global.musicBattle = snd_sewerBattle;
global.musicDungeon = snd_sewerTheme;
global.musicBoss = snd_sewerBattle;

global.shopkeeperSprite = pointer_null;

global.keyStruct = {
	myName: "Floor Key",
	description: "Opens the exit on this floor."
}

global.clearConditionTexts = [
	"Find the exit!",
	"Find the key!",
	"Find and defeat the boss!"
];

randomize();

global.battleCursorMemory1 = 4;

/* Default	// For Walls -> 0 is Display sprite, 1 is Function. If function is odd, solid wall
			// For Tiles -> 0 is Floor Sprite, 1 is Ceiling Sprite, 2 is Function
global.dungeon = [
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
	[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
	[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []]
];*/

/* 
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
*/

global.dungeon = [];

function loadFloor(_floor){
	
	// make locked doors closed
	global.exitOpen = false;
	
	global.clearCondition = CLEAR.none;
	
	switch (_floor) {
		
		case 1:
			// First floor, sewer?
			global.musicBattle = snd_sewerBattle;
			global.musicDungeon = snd_sewerTheme;
			global.musicBoss = snd_sewerBattle;
			
			global.encounterTable = [
				[0, 10], [1, 10], [2, 10]
			];
			
			// load palette
			loadPalette(0);
			
			global.dungeonNPC = [
				["Welcome to Plague!", "Your goal here is to reach the top of this dungeon.", "Each floor has an exit staircase, and this dungeon happens to have 4 floors.", "Good luck reaching the exit! And watch out for monsters!"],
				["Each floor can have a variety of treasures on it.", "Opening chests can even result in learning new skills for battle!", "It might be wise to loot an entire floor before moving on to the next."]
			];
			global.dungeonChests = [
				[DROPS.consumables, 0, 4], // four potions
				[DROPS.skills, 5, 1], // ignis
				[DROPS.skills, 12, 1] // sana
			];
			
			global.dungeon = [
			[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
			[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 9, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
			[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
			[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
			[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      []],
			[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1]],
			[      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 9,50],      [],    [ 1, 1],      []],
			[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1]],
			[      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],   [ 9, 70],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      []],
			[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1]],
			[      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      []],
			[ [ 1, 1], [ 5, 7, 0],[ 9, 52], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 2], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1]],
			[      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 9,51],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 0, 0],      []],
			[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 2], [ 0, 0], [ 5, 7, 2], [ 0, 0], [ 5, 7, 2], [ 0, 0], [ 5, 7, 2], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1]],
			[      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],   [ 9, 71],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 9, 2],      [],    [ 1, 1],      []],
			[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1]],
			[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      []]
			];
			
			global.xPos = 5;
			global.yPos = 1;
			global.facing = 1;
			
			break;
			
		case 2:
		
			global.clearCondition = CLEAR.key;
			
			global.musicBattle = snd_cornBattle;
			global.musicDungeon = snd_cornTheme;
			global.musicBoss = snd_cornBattle;
			
			global.encounterTable = [
				[3, 10], [4, 10], [5, 10]
			];
			
			// load palette
			loadPalette(2);
			
			// Second floor, corn maze
			global.dungeonNPC = [
				["On some floors, opening the way to the exit may require some work.", "On this floor, the door to the exit is locked.", "You'll need to find the key somewhere on this floor before moving on."],
				["Sometimes, these dungeons will house false walls.", "False walls look exactly like your everyday wall, but you can actually walk right through them.", "False walls won't appear as walls on the map, so pay attention."],
				["It's always possible to use items and skills outside of battle.", "By pressing ENTER, you can bring up the pause menu.", "From there, you can use healing items and skills at your heart's content."]
			];
			global.dungeonChests = [
				[DROPS.key, 0, 1], // key
				[DROPS.skills, 7, 1], // fulgur
				[DROPS.skills, 2, 1], // brute force
				[DROPS.consumables, 0, 4] // potions
			];
			global.dungeonShop = [
				[DROPS.consumables, 0, getCost(0)], // potions
				[DROPS.consumables, 1, getCost(1)], // elixers
				[DROPS.skills, 3, 100], // hawk strike
				[DROPS.skills, 10, 135] // orandi
			];
			
			global.shopkeeperSprite = spr_shopkeeperScarecrow;
			
			
			global.dungeon = [
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 2], [ 0, 0], [ 5, 7, 2], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 9,72],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 2], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 2], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 9,52],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 3, 0],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 3, 0], [ 5, 8, 4], [ 3, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 3, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 9,70],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 3, 0],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 1, 1], [ 5, 7, 0], [ 9, 4], [ 5, 7, 3], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [11, 3], [ 5, 7, 0], [ 3, 0], [ 5, 8, 4], [ 3, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 9, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 3, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 9,71],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 1, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 2], [ 0, 0], [ 5, 7, 0], [ 1, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 9,51],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 2], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],		 []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 9,50], [ 5, 7, 3], [ 0, 0], [ 5, 7, 2], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],		 []]
			];
			
			global.xPos = 21;
			global.yPos = 9;
			global.facing = 3;
			
			break;
			
		case 3:
		
			// Floor 3, ?
			global.musicBattle = snd_backBattle;
			global.musicDungeon = snd_backTheme;
			global.musicBoss = snd_backBattle;
			
			global.encounterTable = [
				[6, 10], [7, 10], [8, 10]
			];
			
			// load palette
			loadPalette(11);
			
			global.dungeonChests = [
				[DROPS.consumables, 5, 2], // two paste
				[DROPS.consumables, 2, 1], // tasty jams
				[DROPS.skills, 8, 1], // terra
				[DROPS.skills, 5, 1] // ventus
			];
			
			global.dungeon = [
				[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],     [ 0, 1],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1],  [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 9,53],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],     [ 0, 1],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1],  [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 9,51],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],     [ 1, 1],      []],
				[ [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0],  [ 5, 7, 1], [ 1, 1]],
				[      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],     [ 0, 0],      []],
				[ [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1], [ 5, 7, 0], [ 1, 1],  [ 5, 7, 1], [ 1, 1]],
				[      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 9, 2],      [],     [ 0, 0],      []],
				[ [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0],  [ 5, 7, 1], [ 1, 1]],
				[      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],     [ 0, 0],      []],
				[ [ 1, 1], [ 5, 7, 0], [ 1, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1], [ 5, 7, 0], [ 9,52], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1],  [ 5, 7, 1], [ 1, 1]],
				[      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],     [ 0, 0],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1],  [ 5, 7, 1], [ 1, 1]],
				[      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],     [ 0, 0],      []],
				[ [ 1, 1], [ 5, 7, 0], [ 9, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 9,50], [ 5, 7, 1], [ 0, 0],  [ 5, 7, 1], [ 1, 1]],
				[      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],     [ 1, 1],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1],  [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],     [ 0, 1],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1],  [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],     [ 0, 1],      []]
			];
			
			global.xPos = 3;
			global.yPos = 15;
			global.facing = 1;
			
			break;
			
		case 4:
			
			// load palette
			loadPalette(3);
			global.clearCondition = CLEAR.boss;
			
			global.encounterTable = [
				[9, 10], [10, 10], [11, 10]
			];
			
			global.musicBattle = snd_libraryBattle;
			global.musicDungeon = snd_libraryTheme;
			global.musicBoss = snd_libraryBattle;
			
			global.dungeonChests = [
				[DROPS.consumables, 4, 99], // two paste
				[DROPS.skills, 6, 1], // aqua
			];
			
			global.dungeon = [
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [11, 3],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 0, 0], [ 5, 7, 0], [ 4, 1], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 9,50],      [],    [ 1, 1],      [],    [ 0, 1],      []],
				[ [ 1, 1], [ 5, 7, 0], [ 9,51], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 0, 1],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 1, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 9, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 0], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 5, 7, 0], [ 9, 4], [ 5, 7, 1], [ 1, 1]],
				[      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      [],    [ 1, 1],      [],    [ 0, 0],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 0, 0], [ 5, 7, 1], [ 1, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 9,80],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 1, 1],      [],    [ 1, 1],      []],
				[ [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 1, 1], [ 5, 7, 0], [ 1, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1], [ 0, 0, 0], [ 0, 1]],
				[      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 1, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      [],    [ 0, 1],      []]
			];
			
			global.xPos = 9;
			global.yPos = 9;
			global.facing = 2;
			break;
		
	}
	
}