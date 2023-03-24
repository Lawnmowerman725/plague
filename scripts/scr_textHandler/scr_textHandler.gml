function pushContent(text, allowInteraction = false, allowBack = false, og = 0, pos = 1, bac = -1){
	obj_textBox.content = text;
	if (keyboard_check_pressed(vk_backspace) && allowBack){
		obj_textBox.content = "";
		obj_textBox.header = "";
		return bac;
	}
	if (allowInteraction && keyboard_check_pressed(vk_anykey)){
		obj_textBox.content = "";
		obj_textBox.header = "";
		return pos;
	}	
	return og;
}

function pushHeader(text){
	obj_textBox.header = text;
}

function pushCommands(comms, allowBack = false, og = 0, menuOffset = 0, bac = -1){
	obj_textBox.commands = comms;
	if (keyboard_check_pressed(vk_backspace) && allowBack){
		obj_textBox.content = "";
		obj_textBox.header = "";
		obj_textBox.commands = [];
		return bac;
	}
	
	for (var i = 0; i < array_length(comms); i++){
		if (keyboard_check_pressed(ord(string(i+1)))){
			if (array_length(comms[i]) > 2){
				if (comms[i][2] <= global.MP){
					global.MP -= comms[i][2];
				} else {
					return og;	
				}
			}
			obj_textBox.content = "";
			obj_textBox.header = "";
			obj_textBox.commands = [];
			return i+1+menuOffset;
		}
		
	}
	
	return og;
}