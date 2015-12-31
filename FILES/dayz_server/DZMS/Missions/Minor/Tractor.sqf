/*
	Medical Crate by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/

private ["_missName","_coords","_net","_veh1","_veh2","_vehicle","_vehicle1","_crate","_scount","_locations","_sSelect"];

//Name of the Mission
_missName = "Bandit Tractor";


//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

/*
_locations = [[1911.88,2245.43,0],[3593.19,2211.52,0],[6657.18,2422.37,0],[10400.9,1977.27,0],[12351.2,3302.66,0],[3358.56,3443.53,0],[3358.56,3443.53,0],[12653,4378.23,0],[9393.54,2679.13,0],[9393.54,2679.13,0],[4719.19,2513.24,0],[2788.99,2371.95,0]];

_scount = count _locations;
_sSelect = floor(random _sCount);
_coords = _locations select _sSelect;
*/

// Send message to users
_hint = parseText format["<t align='center' color='#ff0000' shadow='2' size='1.55'>Tractor</t><br/><t align='center' color='#ffffff'>Bandits have stolen a tractor! Capture it for yourself and sell it!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMinMarker;

//We create the vehicles like normal
_vehicle = createVehicle ["tractor",[(_coords select 0), (_coords select 1),0],[], 0, "CAN_COLLIDE"];
_vehicle setDir 294.534;
_vehicle setVehicleLock "LOCKED";

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call DZMSSetupVehicle;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0)+0.1,(_coords select 1)-0.3, 0],2,3,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0)-0.5,(_coords select 1)+0.3, 0],2,3,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;

_vehicle setVehicleLock "UNLOCKED";

// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>C130</t><br/><t align='center' color='#ffffff'>Players have captured the tractor!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

diag_log text format["[DZMS]: Minor SM7 Tractor Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;