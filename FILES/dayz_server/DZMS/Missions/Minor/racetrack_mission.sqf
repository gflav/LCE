/*
	Weapon Truck Crash by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/
private ["_missName","_coords","_crash","_crate","_crate1","_crate2"];

//Name of the Mission
_missName = "Race Track";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
//_coords = call DZMSFindPos;
_coords = [10383.6,8670.85];

//[nil,nil,rTitleText,"Bandits are racing at the Race Track!", "PLAIN",10] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#31cefb' shadow='2' size='1.55'>Race Track</t><br/><t align='center' color='#ffffff'>Bandits are racing at the Race Track!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;

//_veh2 = 'SUV_Yellow';
_veh1 = 'SUV_Pink';

_vehicle1 = createVehicle [_veh1,[10379.3, 8667.5,0],[], 0, "CAN_COLLIDE"];
_vehicle1 setVehicleLock "LOCKED";

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle1] call DZMSSetupVehicle;
_vehicle1 setDir 137.685;

//_vehicle2 = createVehicle [_veh2,[10380.3, 8670.5,0],[], 0, "CAN_COLLIDE"];
//_vehicle2 setVehicleLock "LOCKED";

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
//[_vehicle2] call DZMSSetupVehicle;
//_vehicle2 setDir 137.685;


[[(_coords select 0) - 1, (_coords select 1) - 15,0],1,3,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 3;

[[(_coords select 0) + 2, (_coords select 1) - 15,0],2,3,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 3;

[[(_coords select 0) - 1, (_coords select 1) - 15,0],1,3,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 3;


//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;


//_vehicle2 setVehicleLock "UNLOCKED";
_vehicle1 setVehicleLock "UNLOCKED";


//Let everyone know the mission is over
//[nil,nil,rTitleText,"The Race Track has been secured!", "PLAIN",6] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>Race Track</t><br/><t align='center' color='#ffffff'>Survivors took the control of the track!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


diag_log text format["[DZMS]: Minor Race Track Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;