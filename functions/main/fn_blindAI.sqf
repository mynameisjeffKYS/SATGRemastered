[] spawn {
	if (isServer) then {
		{
			if (side _x == independent) then {
				_x setskill ["spotDistance", 0.5];
				_x setskill ["spotTime", 0.5];
			};
		} forEach allUnits;
	};
};