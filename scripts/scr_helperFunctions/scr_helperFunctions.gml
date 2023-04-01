function arrayContains(arr, val, beg = 0, stop = array_length(arr)-1){
	// Array must be sorted ascending
	if (beg > stop) return false;
	
	var middle = floor((beg + stop) / 2);
	
	if (arr[middle] == val) return true;
	
	if (arr[middle] > val){
		return arrayContains(arr, val, beg, middle-1);
	}
	else {
		return arrayContains(arr, val, middle+1, stop);
	}
}

function getFirstDigit(_number){
	var _string = string(_number);
	return real(string_copy(_string, 1, 1));
}

function getLastDigits(_number){
	var _string = string(_number);
	return real(string_copy(_string, 2, string_length(_string)-1));
}

// Draws text with a shadow
function drawTextShadow(_text, _x, _y, _color1, _alpha1, _xOff, _yOff, _color2, _alpha2){
	draw_text_color(_x + _xOff, _y + _yOff, _text, _color2, _color2, _color2, _color2, _alpha2)	
	draw_text_color(_x, _y, _text, _color1, _color1, _color1, _color1, _alpha1)	
}