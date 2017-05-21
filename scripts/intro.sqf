[] spawn {
	if (hasInterface) then {
		waitUntil{player == player};
		showSubtitles False;
		playMusic "intro";
		0 fadeSound 0.2;
		0 fadeRadio 2;
		sleep 10;
		[
			localize "SITREP_A",
			localize "SITREP_C",
			localize "SITREP_D"
		] spawn BIS_fnc_infoText;
		waitUntil{sleep 0.5; vehicle player == player};

		0 fadeSound 0.7;
		0 fadeMusic 0;
		waitUntil{sleep 0.5; speed player == 0};
		
		0 fadeMusic 0.5;
		playMusic "land";
		player linkItem "ItemMap"
	};
};

[] spawn {
	if (isServer) then {
		waitUntil{sleep 0.5; time > 10};
		_playerGroup = allPlayers select 0;
		
		base kbAddTopic ["intro", "mission.bikb"];
		[base, _playerGroup, "intro", "actor_a_1"] call main_fnc_kbTell;
		[base, _playerGroup, "intro", "actor_a_2"] call main_fnc_kbTell;
		[base, _playerGroup, "intro", "actor_a_3"] call main_fnc_kbTell;
		[base, _playerGroup, "intro", "actor_a_4"] call main_fnc_kbTell;
		[base, _playerGroup, "intro", "actor_a_5"] call main_fnc_kbTell;
		
		waitUntil{sleep 0.5; plane distance2D getMarkerPos "mBuild" < 2000};
		
		[plane, False] remoteExec ["lock"];
		[base, _playerGroup, "intro", "actor_a_6"] spawn main_fnc_kbTell;
		sleep 6;
		{
			_x spawn main_fnc_HALO;
		} forEach ((crew plane - [driver plane]) select {not isPlayer _x});

		missionNameSpace setVariable ["startSquad", units group (allPlayers select 0), True];
		{_x setVariable ["name", name _x, True]} forEach startSquad;

		sleep 30;
		
		{deleteVehicle _x} forEach crew plane; 
		deleteVehicle plane;	
	};
};