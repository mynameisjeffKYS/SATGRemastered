//playMusic "EventTrack02_F_EPA";
playMusic "dynamic0";
0 fadeMusic 1.5;
Sleep 33;
cutText ["", "BLACK"];
Sleep 2;

_i = 0;
{
		_name = _x getVariable "name";
		_score = _x getVariable "kills";
		_medal = "";
		if (_score > 15) then {_medal = "Награжден медалью 'Серебряная Звезда'."};
		if (_score > 20) then {_medal = "Награжден крестом 'За выдающиеся заслуги'"};
		if (!alive _x) then {_medal = "Посмертно награжден медалью 'Пурпурное сердце'"};
		
		_s = format ["%1 совершил %2 подтвержденных убийств. \n %3 ", _name, _score, _medal];
		cutText [_s, "BLACK FADED"];
		Sleep 4;
		_i = _i + 1;
} foreach start_squad;

cutText ["", "BLACK FADED"];
"END1" call BIS_fnc_endMission;