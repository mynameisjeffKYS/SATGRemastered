[] spawn {
	if (isServer) then {
		missionNameSpace setVariable["FreezeDate", date, True];
		while {true} do {
			sleep 90;
			[FreezeDate] remoteExec["setDate"];
		};
	};
};