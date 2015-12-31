/*
	Hummer Wreck by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/
private ["_missName","_coords","_crash","_crate"];

//Name of the Mission
_missName = "Humvee Crash";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//[nil,nil,rTitleText,"A Humvee has crashed!\nGo Investigate the Cause of the Wreck!", "PLAIN",10] call RE;
// Send message to users
_hint = parseText format["<t align='center' color='#31cefb' shadow='2' size='1.55'>Humvee Crash</t><br/><t align='center' color='#ffffff'>A Humvee has crashed! Go Investigate the Cause of the Wreck!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;

//Add the scenery
_crash = createVehicle ["HMMWVwreck",_coords,[], 0, "CAN_COLLIDE"];

//DZMSProtectObj prevents it from disappearing
[_crash] call DZMSProtectObj;

//Add and fill the crate
_crate = createVehicle ["RULaunchersBox",[(_coords select 0) - 14, _coords select 1,0],[], 0, "CAN_COLLIDE"];
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
[_crate] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[_coords,1,3,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;
[_coords,2,3,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;
[_crate,"weapons"] ExecVM DZMSBoxSetup;



// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>Humvee Crash</t><br/><t align='center' color='#ffffff'>The Humvee has been Secured by Survivors!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";




//Let everyone know the mission is over
//[nil,nil,rTitleText,"The Humvee has been Secured by Survivors!", "PLAIN",6] call RE;
diag_log text format["[DZMS]: Minor SM5 Humvee Crash Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;