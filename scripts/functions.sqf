FNC_WinterOutfit = {
	{
		_texture = getObjectTextures _x select 0;
		switch (_texture) do {
			case "rhsafrf\addons\rhs_infantry\data\flora_co.paa" : {_x setObjectTexture [0, "textures\winter_co.paa"]};
		};
	} forEach (allUnits select {side _x == EAST});
};

FNC_Player_Unconscious = {
	params ["_tosleep"];
	
	Player_Unconscious = True;
	while {time < _tosleep} do
	{
		cutText ["", "BLACK IN"];
		sleep 4;
		cutText ["", "BLACK OUT"];
		sleep 2;
		sleep random 10;
	};
	Player_Unconscious = False;
};

FNC_BlindAI = {
	{
		if (side _x == independent) then {
			_x setskill ["spotDistance", 0.5];
			_x setskill ["spotTime", 0.5];
		};
	} forEach allUnits;
};

FNC_HALO_AI = {
	params ["_unit"];
	
	moveOut _unit;
	waitUntil{sleep 1; typeOf vehicle _unit == "Steerable_Parachute_F"};
	(vehicle _unit) allowDamage False;
	_unit allowDamage False;
};

FNC_Medicine_Give = {
	params ["_unit"];
	_isMedic = _unit getVariable ["ace_medical_medicClass", 0] > 0;
	
	if (not _isMedic) then {
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_fieldDressing"};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_packingBandage"};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_quikclot"};
		for "_i" from 1 to 6 do {_unit addItemToUniform "ACE_elasticBandage"};
		_unit addItemToUniform "ACE_tourniquet";
		_unit addItemToUniform "ACE_morphine";
		_unit addItemToUniform "ACE_epinephrine";
	} else {
		for "_i" from 1 to 20 do {_unit addItemToVest "ACE_packingBandage"};
		for "_i" from 1 to 10 do {_unit addItemToVest "ACE_fieldDressing"};
		for "_i" from 1 to 10 do {_unit addItemToVest "ACE_elasticBandage"};
		for "_i" from 1 to 10 do {_unit addItemToVest "ACE_tourniquet"};
		for "_i" from 1 to 10 do {_unit addItemToVest "ACE_morphine"};
		for "_i" from 1 to 5 do {_unit addItemToVest "ACE_atropine"};
		for "_i" from 1 to 5 do {_unit addItemToVest "ACE_epinephrine"};
		for "_i" from 1 to 6 do {_unit addItemToVest "ACE_salineIV_500"};
//		for "_i" from 1 to 15 do {_unit addItemToVest "ACE_quikclot"};
		for "_i" from 1 to 2 do {_unit addItemToVest "ACE_personalAidKit"};
		_unit addItemToVest "ACE_surgicalKit";
	};
};

FNC_Medicine_Give_Once = {
	params ["_unit"];
	_haveMedicine = _unit getVariable ["medicineGived", False];
	if (not _haveMedicine) then {
		_unit call FNC_Medicine_Give;
		_unit setVariable ["medicineGived", True, True];
	};
};

FNC_Medicine_Give_All = {
	{
		if (local _x) then {
			_x call FNC_Medicine_Give_Once;
		} else {
			_x remoteExec ["FNC_Medicine_Give_Once", _x];
		};
		
	} forEach (allUnits select {side _x == WEST});
};

if (hasInterface) then {
	call FNC_WinterOutfit;
};