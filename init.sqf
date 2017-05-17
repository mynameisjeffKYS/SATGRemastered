if (isServer) then {
	setTimeMultiplier 0.1;	
};

if (hasInterface) then {
	// client only
};

execVM "scripts\intro.sqf";
[80, 21600, False, 300, True] execVM "AL_snowstorm\al_snow.sqf";