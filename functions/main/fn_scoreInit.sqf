[] spawn {
	if (isServer) then {
		{
			_x addEventHandler ["killed", {param [0] call main_fnc_scoreIncrease}];
		} foreach (allUnits select {side _x == EAST});
	};
};