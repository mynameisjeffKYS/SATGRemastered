[] spawn {
	if (isServer) then {
		{
			_x addEventHandler ["killed", {param [0] setVariable ["deathTime", Time]}];
		} foreach (allUnits select {side _x == EAST});
	};
};

[] spawn {
	if (isServer) then {
		while {true} do {
			sleep 150;
			{
				if ((time - (_x getVariable ["deathTime", Time])) > 600) then {
					deleteVehicle _x;
				};
			} forEach allDead;
		};
	};	
};