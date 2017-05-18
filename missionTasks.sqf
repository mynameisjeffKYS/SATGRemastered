case "taskCaptureLop": {
	if (_taskState == "") then {
		[
			WEST,
			_taskID,
			["", "STR_TASK_Lop"],
			getMarkerPos "mLop",
			True,
			1,
			True,
			"attack",
			True
		] call BIS_fnc_taskCreate;
	};
};

case "taskCaptureKrasn": {
	if (_taskState == "") then {
		[
			WEST,
			_taskID,
			["", "STR_TASK_Krasn"],
			getMarkerPos "mKrasn",
			True,
			1,
			True,
			"attack",
			True
		] call BIS_fnc_taskCreate;
	};
};

case "taskEscapeFake": {
	if (_taskState == "") then {
		[
			WEST,
			_taskID,
			["", "STR_TASK_Leave"],
			getMarkerPos "mEscape",
			True,
			1,
			True,
			"exit",
			True
		] call BIS_fnc_taskCreate;
	};
};

case "taskBoat": {
	if (_taskState == "") then {
		[
			WEST,
			_taskID,
			["", "STR_TASK_Boat"],
			getMarkerPos "mBoat",
			True,
			1,
			True,
			"run",
			True
		] call BIS_fnc_taskCreate;
	};
};

case "taskEscape": {
	if (_taskState == "") then {
		[
			WEST,
			_taskID,
			["", "STR_TASK_Leave"],
			objNull,
			True,
			1,
			True,
			"exit",
			True
		] call BIS_fnc_taskCreate;
	};
};

// "taskTakeArt" call BIS_fnc_missionTasks;
// ["taskTakeArt", "SUCCEEDED", True] call BIS_FNC_taskSetState;