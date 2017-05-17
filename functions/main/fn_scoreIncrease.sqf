	params ["_unit"];
	_killer = _unit getVariable ["ace_medical_lastDamageSource", objNull];
	_killer setVariable ["Kills", (_killer getVariable ["Kills", 0]) + 1, True];