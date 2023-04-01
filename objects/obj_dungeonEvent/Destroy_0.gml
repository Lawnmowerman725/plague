
// reset after event, return to dungeon
if (instance_exists(obj_dungeon)){
	with (obj_dungeon){
		resetAfterEvent();
	}
}