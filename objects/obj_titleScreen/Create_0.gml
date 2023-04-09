/// @description Insert description here
// You can write your code in this editor
backColor = #77B4CE;

playerName = "";

function nextPage(){
	switch (page){
		case 3:
			page = 4;
			break;
	}
}

function previousPage(){
	switch (page){
		case 4:
			page = 3;
			keyboard_string = playerName;
			break;
	}
}