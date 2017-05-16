[] spawn {
	if (hasInterface) then {
		waitUntil{player == player};
		playMusic "intro";
		0 fadeSound 0.2;
		0 fadeRadio 1.5;
		sleep 10;
		[
			localize "SITREP_A",
			localize "SITREP_C",
			localize "SITREP_D"
		] spawn BIS_fnc_EXP_camp_SITREP;
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
		_playerGroup = group (allPlayers select 0);
		base kbAddTopic ["intro", "intro.bikb"];
		base kbTell [_playerGroup, "intro", "actor_a_1"];
		base kbTell [_playerGroup, "intro", "actor_a_2"];
		base kbTell [_playerGroup, "intro", "actor_a_3"];
		base kbTell [_playerGroup, "intro", "actor_a_4"];
		base kbTell [_playerGroup, "intro", "actor_a_5"];
		waitUntil{sleep 0.5; plane distance2D getMarkerPos "mBuild" < 2000};
		
		base kbTell [_playerGroup, "intro", "actor_a_6"];
		waitUntil {sleep 0.5; (base kbWasSaid [_playerGroup, "intro", "actor_a_6", 10])};
		
		{
			_x spawn FNC_HALO_AI;
		} forEach ((crew plane - [driver plane]) select {not isPlayer _x});
		sleep 60;
		
		{deleteVehicle _x} forEach crew plane; 
		deleteVehicle plane;	
	};
};