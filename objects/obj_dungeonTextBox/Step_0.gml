/// @description Insert description here
// You can write your code in this editor

// intro
if (sprite_index != spr_dungeonTextBox) {	
	exit;
}


// print letters one at a time
var letterAmount = string_length(messageArr[currentBox]);
amountOfChars += 1;
if (amountOfChars > letterAmount) {
	amountOfChars = letterAmount;
	if (currentBox == array_length(messageArr) - 1 && acceptInput && pauseOnLast) {
		acceptInput = false;
		creatorID.textBoxOver = true;
	}
}

// if key pressed
if (keyboard_check_pressed(ord("Z")) && acceptInput){
	
	// text box over
	if (amountOfChars == letterAmount){
		// last text box
		if (currentBox == array_length(messageArr) - 1){
			// if told to wait on last box
			if (pauseOnLast) {
				acceptInput = false;
				creatorID.textBoxOver = true;
			}
			else {
				instance_destroy();
				exit;
			}
		}
		// wasn't last box
		else {
			amountOfChars = 0;
			currentBox = round(currentBox + 1);
		}
		
	}
	// print all chars
	else {
		amountOfChars = letterAmount;
	}
	
}