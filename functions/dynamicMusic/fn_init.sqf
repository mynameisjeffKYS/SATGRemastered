if (hasInterface) then {
	DM_Music = ["dynamic0", "dynamic1", "dynamic2", "dynamic3", "dynamic4", "dynamic5", "dynamic6", "dynamic7", "dynamic8", "dynamic9"];

	DM_State_Safe = 0;
	DM_State_Combat = 1;

	DM_TimeOut = 45;
	DM_State = DM_State_Safe;

	ace_hearing_disableVolumeUpdate = true;
	
	call DynamicMusic_fnc_eventInit;
	
	addMusicEventHandler ["MusicStop", {call DynamicMusic_fnc_playMusic}];

	combatDecay = 0;
	[] spawn DynamicMusic_fnc_status;
	[] spawn DynamicMusic_fnc_handler;
};