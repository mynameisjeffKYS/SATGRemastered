if (isServer) then {
	setTimeMultiplier 0.1;
	execFSM "missions.fsm";
};

if (hasInterface) then {
	[] spawn {
		sleep 3;
		TF_terrain_interception_coefficient = 18;
	};

	0 enableChannel False;
	1 enableChannel False;
	3 enableChannel False;
};

execVM "scripts\intro.sqf";
[80, 21600, False, 300, True] execVM "AL_snowstorm\al_snow.sqf";