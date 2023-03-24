load_data();

function save_data(data){
	var dataString = json_stringify(data);
	var buffer = buffer_create(string_byte_length(dataString) + 1, buffer_fixed, 1);
	buffer_write(buffer, buffer_string, dataString);
	buffer_save(buffer, "brett.sav");
	show_debug_message("Saving " + dataString);
	buffer_delete(buffer);
}

function load_data(){
	with (obj_saveData) instance_destroy();
	
	if (file_exists("brett.sav")){
		var buffer = buffer_load("brett.sav");
		var dataString = buffer_read(buffer, buffer_string);
		buffer_delete(buffer);
		show_debug_message("Loading " + dataString);
		
		var loadedData = json_parse(dataString);
		
		// loadedData will be a struct that holds all of the save data. Put it back into the game.
		try {
			instance_create_layer(0, 0, 0, obj_saveData);
			
		}
		catch(e) {
			// Error while loading save. Must create a blank save and warn the player.
			create_new_data();
			load_data();
		}
	}
	else {
		show_debug_message("No save found. Creating new data.")
		create_new_data();
		load_data();
	}
}

function create_new_data(){
	var newData = {
		portraits : "placeholder",
		files : [
			new PlayerFile(),
			new PlayerFile(),
			new PlayerFile(),
			new PlayerFile(),
			new PlayerFile(),
			new PlayerFile()
		]
	}
	save_data(newData);
}