/// @description Insert description here
// You can write your code in this editor
for (var i = 0; i < array_length(itemMenuList); i++){
	instance_destroy(itemMenuList[i]);
}
shopMoneyHud.goBack = true;
instance_destroy(descriptionBox);