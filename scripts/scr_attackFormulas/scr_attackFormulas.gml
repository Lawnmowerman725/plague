function attackFormula(_att, _def, _power, _accuracy, _crit, _userElement, _oppoElement, _element){
	
	// Miss
	if (!_accuracy){
		return 0;	
	}
	
	// Crit
	if (_crit) {
		_def = 0;
		_att *= 1.2;
	}
	
	// Move's Power
	_att *= _power / 100;
	
	// Your element boost
	_att *= _userElement[_element];
	
	// Enemy resistance
	_att *= _oppoElement[_element];
	
	// Enemy defense
	_att *= 100 / (100 + _def);
	
	// Random dog ass
	_att *= 0.9 + (random(2) / 10)
	
	_att = ceil(_att);
	
	if (_att < 1){
		_att = 1;		
	}
	
	return _att;
}

// Heal formula for HP and UP
function doRecovery(_percentage = false, _amount = 100, _player = true, _hp = true){
	
	var output = 0;
	// For percentage based
	if (_percentage){
		var maxAmount;
		
		// Player Heal
		if (_player){
			if (_hp){
				maxAmount = getPlayerStat(STATS.hp);
				output = round(maxAmount * _amount);
				global.playerHP += output;
			} else {
				maxAmount = getPlayerStat(STATS.up);
				output = round(maxAmount * _amount);
				global.playerUP += output;
			}
			playerMaxCheck();
		} 
		// Enemy Heal
		else {
			if (_hp){
				maxAmount = getEnemyStat(STATS.hp);
				output = round(maxAmount * _amount);
				global.enemyHP += output;
			} else {
				maxAmount = getEnemyStat(STATS.up);
				output = round(maxAmount * _amount);
				global.enemyUP += output;
			}
			enemyMaxCheck();
		}
	}
	
	// For set amounts
	else {
		output = _amount;
		// Player
		if (_player){
			if (_hp){
				global.playerHP +=_amount;
			} else {
				global.playerUP += _amount;
			}
			playerMaxCheck();
		} 
		// Enemy
		else {
			if (_hp){
				global.enemyHP += _amount;
			} else {
				global.enemyUP += _amount;
			}
			enemyMaxCheck();
		}	
	}
	
	global.playerHP = round(global.playerHP);
	global.playerUP = round(global.playerUP);
	global.enemyHP = round(global.enemyHP);
	global.enemyUP = round(global.enemyUP);
	return output;
}

// Buff / Debuff
function changeStatMod(_index, _player, _amount = 0.1) {
	if (_player){
		global.playerStatMods[_index] += _amount;
	}
	else {
		global.enemyStatMod[_index] += _amount;
	}
}

function resetStatMod(_player){
	if (_player){
		global.playerStatMods = [1,1,1,1,1,1,1];
	}
	else {
		global.enemyStatMod = [1,1,1,1,1,1,1];
	}
}


function skillCheck(_base, _check, _userStat, _opponentStat) {
	var rando = random(100);
	var checkTotal = _check * (_userStat / (_userStat + _opponentStat));
	 return (rando < _base + checkTotal);
}

function enemyDealDamage(_amount){
	global.enemyHP = round(global.enemyHP - _amount);
	if (global.enemyHP < 0){
		global.enemyHP = 0;	
	}
}

function playerDealDamage(_amount){
	global.playerHP = round(global.playerHP - _amount);
	if (global.playerHP < 0){
		global.playerHP = 0;	
	}
}