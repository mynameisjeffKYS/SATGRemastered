FNC_Radio_Init = {
	Radio_Playing = False;
	Radio_Halt = False;
	[] spawn FNC_Radio_Handle;
};

FNC_Radio_Handle = {
	while {not Radio_Halt} do {
		// Если игрок в машине
		if (vehicle player != player) then {
			// Если радио выключено
			if (vehicle player getVariable ["Radio", 0] == 0) then {
				// Если игрок водитель
				if (player == driver vehicle player) then {
					sleep 60;
					// .. водитель уже 60 секунд
					if (player == driver vehicle player) then {
						// включаем радио

						vehicle player addAction ["Заткнуть уши", {Radio_Halt = True; removeAllActions vehicle player}];
						[name player, "У меня где-то лежал голодиск с музыкой..."] remoteExec ["BIS_fnc_showSubtitle"];
						sleep 6;
						[name player, "О.. нашел!"] remoteExec ["BIS_fnc_showSubtitle"];
						sleep 4;
						vehicle player setVariable ["Radio", time, True];
					};
				};
			} else {
				// Если радио включено но не играет
				if (not Radio_Playing) then {
					0 fadeMusic 1;
					playMusic ["radio", time - (vehicle player getVariable ["Radio", 0])];
					Radio_Playing = True;
				};
			};
		} else {
			// Если не в машине
			if (Radio_Playing) then {
				playMusic "";
				Radio_Playing = False;
			};
		};
		sleep 0.5;
	};
};