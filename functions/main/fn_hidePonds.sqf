[] spawn {
	if (hasInterface) then {
		_ponds = (nearestTerrainObjects [[0, 0, 0], ["hide"], 12000]) select {["pond", str _x] call BIS_fnc_inString};
		{hideObject _x} forEach _ponds;
	};
};