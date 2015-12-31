/*
	Bandit Hunting Party by lazyink (Full credit to TheSzerdi & TAW_Tonic for the code)
	Updated to new format by Vampire
*/
private ["_missName","_coords","_vehicle"];

//Name of the Mission
_missName = "Bandit Squad";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//[nil,nil,rTitleText,"A Bandit Squad has been spotted!\nStop them from completing their patrol!", "PLAIN",10] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#31cefb' shadow='2' size='1.55'>Bandit Squad</t><br/><t align='center' color='#ffffff'>A Bandit Squad has been spotted! Stop them from completing their patrol!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[_coords,3,3,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;

//Let everyone know the mission is over
//[nil,nil,rTitleText,"The Bandit Squad has been Wiped Out!", "PLAIN",6] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>Bandit Squad</t><br/><t align='center' color='#ffffff'>The Bandit Squad has been Wiped Out!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";



diag_log text format["[DZMS]: Minor SM1 Bandit Squad Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;