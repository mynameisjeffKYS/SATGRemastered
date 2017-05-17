	params ["_person", "_receiver", "_TopicName", "_SentenceClass"];
	_duration = getNumber (missionConfigFile >> "Sentences" >> _SentenceClass >> "Duration") + 1;
	_text = getText (missionConfigFile >> "Sentences" >> _SentenceClass >> "text");
	//False remoteExec ["showSubtitles"];
	showSubtitles False;
	_person kbTell [_receiver, _TopicName, _SentenceClass, ["Team",{},"Anvil",["Anvil"]],["Location",{},"Strelka",["Strelka"]], "SIDE"];
	[name _person, _text] remoteExec ["BIS_fnc_showSubtitle"];
	sleep _duration;
	//True remoteExec ["showSubtitles"];