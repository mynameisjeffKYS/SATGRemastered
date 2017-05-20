[] spawn {
	if (isServer) then {
		missionNameSpace setVariable["FreezeDate", date, True];
		while {true} do {
			sleep 180;
			[FreezeDate] remoteExec["setDate"];
		};
	};
};