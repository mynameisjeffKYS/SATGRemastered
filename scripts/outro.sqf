playMusic "outro";
0 fadeMusic 1.5;
sleep 33;
cutText ["", "BLACK"];
sleep 2;

_i = 0;
{
		_name = _x getVariable ["name", "John Doe"];
		_score = _x getVariable ["kills", 0];
		_medal = "";
		if (_score > 15) then {_medal = localize "AWARD_Silver"};
		if (_score > 20) then {_medal = localize "AWARD_Robust"};
		if (!alive _x) then {_medal = localize "AWARD_Purple"};
		
		_s = format [localize "AWARD_Kills", _name, _score, _medal];
		cutText [_s, "BLACK FADED"];
		Sleep 4;
		_i = _i + 1;
} forEach startSquad;

cutText ["", "BLACK FADED"];
"END1" call BIS_fnc_endMission;