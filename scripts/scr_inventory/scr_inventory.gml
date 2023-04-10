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

function resetInventory(){
	var keys = variable_struct_get_names(global.consumables);
	for (var i = 0; i < array_length(keys); ++i) {
		var key = keys[i];
		global.consumables[$ key] = 0;
	}	
}

function hasItem(_name){
	return global.consumables[$ _name] > 0;
}

function getItemCount(_name){
	return global.consumables[$ _name];	
}

function hasItems(){
	// Get items with more than 1 item
	for (var i = 0; i < array_length(global.consumableDatabase); i++){
		if (hasItem(global.consumableDatabase[i].myName)){
			return true;
		}
	}
	return false;	
}

function getCost(_index){
	return global.consumableDatabase[_index].price;
}