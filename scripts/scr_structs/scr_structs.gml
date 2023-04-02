// Contains everything the player has earned in dungeons / from the store
function Unlocks() constructor
{
	// Each array should be sorted ascending
	// Each array contains numbers (indices) that refer to corresponding items in the global database
	uWeapons = [];
	uArmor = [];
	uAccessories = [];
	uClasses = [];
	uSkills = [];
	uPalettes = [];
	uSidebars = [];
	uShopkeepers = [];
	uHealers = [];
	uPrefabs = [];
	uDungeonThemes = [];
	uBattleThemes = [];
	uBossThemes = [];
	uConceptArt = [];
}

// Ummm Settings? Frfr
function Settings() constructor
{
	// Add user's settings here
	// f means favorite, used when shuffling
	fPalettes = [];
	fSidebars = [];
	fShopkeepers = [];
	fHealers = [];
	fDungeonThemes = [];
	fBattleThemes = [];
	fBossThemes = [];
}

// Stores current equipment
function Equipment() constructor
{
	weapon = 0;
	armor = 0;
	accessory1 = 0;
	accessory2 = 0;
}

// Saves the user's current character build. Can be reloaded at any time.
// IE, you could save a warrior build, mage build, etc
function Set(_name = "Dummy", _experience = 0, _class = 0, _portrait = 0, _equipment = Equipment(), _skills = []) constructor
{
	myName = _name;
	experience = _experience;
	class = _class;
	portrait = _portrait;
	equipment = _equipment;
	skills = _skills;	
}

// Big boi
function PlayerFile() constructor
{
	myName = "Saul Goodman";
	experience = 100;
	blank = true;
	totalExperience = 20000;
	money = 0;
	class = 0;
	portrait = spr_saulGoodman;
	equipment = Equipment();
	skills = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 0];
	sets = [];
	unlocks = Unlocks();
}

// Class Template
function Class(_name = "Dummy", _description = "Dummy", _startingStats = [0,0,0,0,0,0,0], _levelUpStats = [0,0,0,0,0,0,0], _classSkills = [], _classPerks = []) constructor
{
	myName = _name;
	description = _description;

	startingStats = _startingStats;
	levelUpStats = _levelUpStats;
	
	classSkills = _classSkills;
	classPerks = _classPerks;
}

// Enemy Maybe?
function Enemy(_name = "Dummy", _description = "Dummy", _startingStats = [0,0,0,0,0,0,0], _levelUpStats = [0,0,0,0,0,0,0], _skills = [], _brain = 0, _startingRewards = [0,0], _levelRewards = [0,0], _sprites = SpriteSet(), _elementAttack = [0,0,0,0,0,0,0,0], _elementDefend = [0,0,0,0,0,0,0,0], _itemDrop = [0,0,0,0], _rareness = 0) constructor
{
	myName = _name;
	description = _description;
	
	startingStats = _startingStats;
	levelUpStats = _levelUpStats;
	
	skills = _skills;
	brain = _brain;
	
	startingRewards = _startingRewards;
	levelRewards = _levelRewards;
	
	sprites = _sprites;
	
	elementAttack = _elementAttack;
	elementDefend = _elementDefend;
	
	itemDrop = _itemDrop;
	rareness = _rareness;
}

// Enemy sprite set
function SpriteSet(_idle = spr_biggie, _attack = spr_biggie, _spell = spr_biggie, _damaged = spr_biggie, _defeat = spr_biggie) constructor
{
	idle = _idle;
	attack = _attack;
	spell = _spell;
	damaged = _damaged;
	defeat = _defeat;
}

// Used for both weapons and armor
function Gear(_stats = [0,0,0,0,0,0,0], _affinities = [0,0,0,0,0,0,0,0]) constructor
{
	stats = _stats;
	affinities = _affinities;
}

// Skill Class woop woop
function Skill(_name, _description, _cost, _element, _formula, _special, _power, _bAcc, _cAcc, _bCrit, _cCrit, _rarity, _sprite, _frame) constructor{
	myName = _name;
	description = _description;
	
	cost = _cost;
	formula = _formula;
	special = _special;
	element = _element;
	
	powerMult = _power;
	bAccuracy = _bAcc;
	cAccuracy = _cAcc;
	bCritical = _bCrit;
	cCritical = _cCrit;
	
	rarity = _rarity;
	mySprite = _sprite;
	
	targetFrame = _frame;
		
}

// Item class cham moment
function Consumable(_name, _value, _special, _formula, _rarity, _price, _description) constructor {
	myName = _name;
	description = _description;
	
	value = _value;
	special = _special;
	
	price = _price;
	
	formula = _formula;
	rarity = _rarity;	
}

function Palette(_name, _description, _sprites, _fog) constructor{
	myName = _name;
	description = _description;
	sprites = _sprites;
	fog = _fog;
}