/*
	Weapon Truck Crash by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/
private ["_missName","_coords","_crash","_crate","_crate1","_crate2"];

//Name of the Mission
_missName = "Weapons Truck";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//[nil,nil,rTitleText,"A Weapons Truck has Crashed!\nGo Recover the Supplies!", "PLAIN",10] call RE;
// Send message to users
_hint = parseText format["<t align='center' color='#31cefb' shadow='2' size='1.55'>Weapons Truck</t><br/><t align='center' color='#ffffff'>A Weapons Truck has Crashed! Go Recover the Supplies!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;

//Add scenery
_crash = createVehicle ["UralWreck",_coords,[], 0, "CAN_COLLIDE"];

//DZMSProtectObj prevents it from disappearing
[_crash] call DZMSProtectObj;

//Add and fill the boxes
_crate = createVehicle ["USLaunchersBox",[(_coords select 0) + 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
[_crate] call DZMSProtectObj;
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[_coords,2,3,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;
[_coords,1,3,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1; 

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;
[_crate,"weapons"] ExecVM DZMSBoxSetup;

//Let everyone know the mission is over
//[nil,nil,rTitleText,"The Weapons Truck has been Secured by Survivors!", "PLAIN",6] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>Weapons Truck</t><br/><t align='center' color='#ffffff'>The Weapons Truck has been Secured by Survivors!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


diag_log text format["[DZMS]: Minor SM6 Weapons Truck Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;