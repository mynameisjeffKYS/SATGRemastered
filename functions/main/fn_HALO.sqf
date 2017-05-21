	params ["_unit"];
	
	moveOut _unit;
	waitUntil{sleep 1; typeOf vehicle _unit == "Steerable_Parachute_F"};

	[vehicle _unit, False] remoteExec ["allowDamage", owner (vehicle _unit)];
	[_unit, False] remoteExec ["allowDamage", owner _unit];

	waitUntil{sleep 1; vehicle _unit == _unit};
	sleep 5;	
	[vehicle _unit, True] remoteExec ["allowDamage", owner (vehicle _unit)];
	[_unit, True] remoteExec ["allowDamage", owner _unit];