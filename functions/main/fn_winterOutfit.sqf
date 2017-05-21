[] spawn {
	if (hasInterface) then {
		{
			_texture = getObjectTextures _x select 0;
			switch (_texture) do {
				case "rhsafrf\addons\rhs_infantry\data\flora_co.paa" : {_x setObjectTexture [0, "textures\winter_co.paa"]};
			};
		} forEach (allUnits select {side _x == EAST});
	};
};