	params ["_tosleep"];
	
	while {time < _tosleep} do
	{
		cutText ["", "BLACK IN"];
		sleep 4;
		cutText ["", "BLACK OUT"];
		sleep 2;
		sleep random 10;
	};