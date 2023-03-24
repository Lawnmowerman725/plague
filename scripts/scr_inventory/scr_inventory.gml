// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function alterItemCount(_name, _amount = 1){
	global.consumables[$ _name] = round(global.consumables[$ _name] + _amount);
	
	if (global.consumables[$ _name] > 99){
		global.consumables[$ _name] = 99;	
	}
	
	if (global.consumables[$ _name] < 0){
		global.consumables[$ _name] = 0;
		if (instance_exists(obj_battle)){
			with (obj_battle){
				itemMemory = 0;	
			}
		}
	}
}

function hasItem(_name){
	return global.consumables[$ _name] > 0;
}