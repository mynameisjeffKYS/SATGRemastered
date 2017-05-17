//#include "scripts\dynamicMusic.sqf";
//#include "scripts\vehicleRadio.sqf";
#include "scripts\scoreManager.sqf";
#include "scripts\functions.sqf";
//#include "scripts\planeTrajectory.sqf";

//#include "scripts\snow.sqf"

if (isServer) then {
	setTimeMultiplier 0.1;
	execVM "scripts\intro.sqf";
	//"intro.fsm" remoteExec ["execFSM"];
	//call FNC_Medicine_Give_All;
	call FNC_BlindAI;
	//plane spawn FNC_Plane_Share;
	
	[80, 21600, False, 300, True] execVM "AL_snowstorm\al_snow.sqf";
};