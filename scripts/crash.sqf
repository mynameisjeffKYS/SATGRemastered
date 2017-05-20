[] spawn {
	if (hasInterface) then {
		waitUntil{{position vehicle _x select 2 < 50} count allPlayers == 0};
		0 fadeMusic 1;
		playMusic "fortune";

		_copter = vehicle player;
		_copter lock True;

		sleep 40;

		player allowDamage False;
		
		if (local _copter) then {
			_copter setHitPointDamage ["hitEngine", 1.0];
			_copter setHitPointDamage ["hitGear", 1.0];
			_copter allowDamage False;
		};

		waitUntil{position _copter select 2 < 20};

		2 fadeMusic 0;
		cutText ["", "BLACK FADED"];

		sleep 6;

		if (local _copter) then {
			_copter allowDamage True;
			_copter setHitPointDamage ["hitHull", 1.0];
			_copter allowDamage False;
				
			_copter setVelocity [0, 0, 0];
			_copter setPos getMarkerPos "crashpos";
		};

		_radius = random 20 + 10;
		_dir = random 359;
		
		_pos = position _copter;
		
		_posx = _pos select 0;
		_posy = _pos select 1;
		_posz = _pos select 2;
		
		_posx = _posx + (sin _dir * _radius);
		_posy = _posy + (cos _dir * _radius);	
		
		//if ((assignedVehicleRole player find "Turret") >= 0) then {
		
			//sleep 3;
		//};
		unassignVehicle player;
		moveOut player;
		sleep 2;
		player setPos [_posx, _posy, _posz];		

		if (random 1 > 0.3) then {removeAllWeapons player};
		if (random 1 > 0.5) then {removeVest player};
		if (random 1 > 0.5) then {removeHeadgear player};
		if (random 1 > 0.5) then {removeGoggles player};
		
		player allowDamage True;
		sleep 1;
		player switchMove "AinjPpneMstpSnonWrflDnon_injuredHealed";
		player setVariable ["tf_unable_to_use_radio", True];

		0 fadeMusic 1;
		playMusic "crash";
		
		_tosleep = time + (random 30 + 15);
		_tosleep call main_fnc_unconscious;	
		
		cutText ["", "BLACK IN"];
		player setVariable ["tf_unable_to_use_radio", False];
		player switchMove "Acts_UnconsciousStandUp_part1";

		// ["?????????","??????????","02/06/2016 1820"] spawn BIS_fnc_infoText;
		sleep 3;
		missionNameSpace setVariable ["crashEnded", True, True];
	};
};

[] spawn {
	if (isServer) then {
		waitUntil{sleep 0.5; (missionNameSpace getVariable ["crashEnded", False])};
		[base, allPlayers select 0, "intro", "actor_a_7"] call main_fnc_kbTell;
	};
};