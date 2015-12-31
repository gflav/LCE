/*
	Bandit Hunting Party by lazyink (Full credit to TheSzerdi & TAW_Tonic for the code)
	Updated to new format by Vampire
*/
private ["_missName","_coords","_vehicle"];

//Name of the Mission
_missName = "Gem Smuggler - starting point";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//[nil,nil,rTitleText,"A Bandit Squad has been spotted!\nStop them from completing their patrol!", "PLAIN",10] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#31cefb' shadow='2' size='1.55'>Gem Smuggler</t><br/><t align='center' color='#ffffff'>A gem smuggler is making his way across the map, capture him before he gets there.</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[_coords,1,3,"DZMSUnitsMinor"] call DZMSAISpawnSmuggler;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
//[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;
