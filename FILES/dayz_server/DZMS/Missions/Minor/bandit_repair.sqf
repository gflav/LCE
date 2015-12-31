/*
	Weapon Truck Crash by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/
private ["_missName","_coords","_crate","_hint"];

//Name of the Mission
_missName = "Bandit Repair Station";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

// Send message to users
_hint = parseText format["<t align='center' color='#31cefb' shadow='2' size='1.55'>Bandit Repair Station</t><br/><t align='center' color='#ffffff'>Bandits have taken over a repair station!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;

//
// Add scenery
//
_object1 = createVehicle ["US_WarfareBVehicleServicePoint_EP1",[(_coords select 0) - 3.9214, (_coords select 1) +5.5859,0],[], 0, "CAN_COLLIDE"];
_object1 setDir 41.309669;
_object1 setVectorUp surfaceNormal position _object1;
[_object1] call DZMSProtectObj;

// 
//
// Add and fill the boxes
// 
//
_crate = createVehicle ["USLaunchersBox",[(_coords select 0) -1.1064, (_coords select 1)+0.6562,0],[], 0, "CAN_COLLIDE"];
[_crate] call DZMSProtectObj;
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;






//
// 
// DZMSAISpawn spawns AI to the mission.
// Usage: [_coords, count, skillLevel, unitArray]
//
[[(_coords select 0)-6.1699, (_coords select 1)+7.3349,0],1,3,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1;
[[(_coords select 0)-5.1064, (_coords select 1)+6.6562,0],2,3,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 1; 






// 
// Wait until the player is within 30 meters and also meets the kill req
// 
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;

// Fill Box
[_crate,"weapons"] ExecVM DZMSBoxSetup;





// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>Bandit Repair Station</t><br/><t align='center' color='#ffffff'>Survivors have captured the repair station.</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


diag_log text format["[DZMS]: Minor SM6 Weapons Truck Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";



//Let the timer know the mission is over
DZMSMinDone = true;