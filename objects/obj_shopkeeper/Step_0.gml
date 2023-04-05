/// @description Insert description here
// You can write your code in this editor
switch (phase){
	
	case 0:
		// creates the text box
		var boxMess = [
			"Greetings, traveler! Care to have a look at my wares?"
		]
		instance_create_depth(global.dungeonPixelWidth*0.64, 250, depth - 10, obj_dungeonTextBox, {messageArr: boxMess, creatorID: id});
		global.tips = ["[X] - Cancel", "[Z] - Confirm"];
		phase = 1;
		break;
		
	case 1:
		// wait for box to be finished
		if (!instance_exists(obj_dungeonTextBox)){
			phase = 2;
			
			instance_create_depth(global.dungeonPixelWidth, 0, depth - 10, obj_shopMenu, {creatorID: id, currentIndex: 0});
		}
		break;
		
	case 2:
		// wait for shop menu to disappear
		if (!instance_exists(obj_shopMenu)){
			phase = 3;	
			
		}
		break;
		
	case 3:
		// creates the text box
		var boxMess = [
			"Thanks for stopping by! Safe travels..."
		]
		instance_create_depth(global.dungeonPixelWidth*0.64, 250, depth - 10, obj_dungeonTextBox, {messageArr: boxMess, creatorID: id});
		phase = 4;
		break;
		
	case 4:
		// wait for box to be finished
		if (!instance_exists(obj_dungeonTextBox)){
			phase = 69;
			// done
			global.tips = [];
		}
		break;
}