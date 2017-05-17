	params ["_unit"];
	
	moveOut _unit;
	waitUntil{sleep 1; typeOf vehicle _unit == "Steerable_Parachute_F"};
	(vehicle _unit) allowDamage False;
	_unit allowDamage False;