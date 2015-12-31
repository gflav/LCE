/*
	Medical Outpost by lazyink (Full credit for code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/
private ["_missName","_coords","_base","_base1","_base2","_base3","_veh1","_veh2","_vehicle","_vehicle1","_crate","_crate2"];

//Name of the Mission
_missName = "Medical Outpost";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//[nil,nil,rTitleText,"Bandits have established a Medical Outpost!\nGo Secure their Medical Supplies!", "PLAIN",10] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#31cefb' shadow='2' size='1.55'>Medical Outpost</t><br/><t align='center' color='#ffffff'>Bandits have established a Medical Outpost! Go Secure their Medical Supplies!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";



//DZMSAddMinMarker is a simple script that adds a marker to the location
[_coords,_missName] ExecVM DZMSAddMinMarker;

//We create the scenery
_base = createVehicle ["US_WarfareBFieldhHospital_Base_EP1",[(_coords select 0) +2, (_coords select 1)+5,-0.3],[], 0, "CAN_COLLIDE"];
_base1 = createVehicle ["MASH_EP1",[(_coords select 0) - 24, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_base2 = createVehicle ["MASH_EP1",[(_coords select 0) - 17, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];

//DZMSProtectObj prevents it from disappearing
[_base] call DZMSProtectObj;
[_base1] call DZMSProtectObj;
[_base2] call DZMSProtectObj;

//We create the vehicles
_veh1 = ["large"] call DZMSGetVeh;
_vehicle = createVehicle [_veh1,[(_coords select 0) + 10, (_coords select 1) - 5,0],[], 0, "CAN_COLLIDE"];
_vehicle setVehicleLock "LOCKED";


//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call DZMSSetupVehicle;

//We create and fill the crates
_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 3, _coords select 1,0],[], 0, "CAN_COLLIDE"];
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
[_crate] call DZMSProtectObj;


//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) - 3, (_coords select 1) - 5,0],2,3,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 3;
[[(_coords select 0) + 3, (_coords select 1) + 5,0],1,3,"DZMSUnitsMinor"] call DZMSAISpawn;
sleep 3;


//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMinor"] call DZMSWaitMissionComp;
[_crate,"medical"] ExecVM DZMSBoxSetup;
_vehicle setVehicleLock "UNLOCKED";



//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
[_vehicle] ExecVM DZMSSaveVeh;

//Let everyone know the mission is over
//[nil,nil,rTitleText,"The Medical Outpost is under Survivor Control!", "PLAIN",6] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>Medical Outpost</t><br/><t align='center' color='#ffffff'>The Medical Outpost is under Survivor Control!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


diag_log text format["[DZMS]: Minor SM2 Medical Outpost Mission has Ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";

//Let the timer know the mission is over
DZMSMinDone = true;