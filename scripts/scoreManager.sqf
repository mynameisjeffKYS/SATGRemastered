FNC_Score_Increase = {
	params ["_unit"];
	_killer = _unit getVariable ["ace_medical_lastDamageSource", objNull];
	_killer setVariable ["Kills", (_killer getVariable ["Kills", 0]) + 1, True];
};

if (isServer) then {
	{
		_x addEventHandler ["killed", {param [0] call FNC_Score_Increase}];
	} foreach (allUnits select {side _x == EAST});
};