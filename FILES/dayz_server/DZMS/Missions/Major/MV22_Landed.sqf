/*
	Medical Crate by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/

private ["_missName","_coords","_net","_veh1","_veh2","_vehicle","_vehicle1","_crate"];

//Name of the Mission
_missName = "MV22 Landed";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;
//_coords = [4895.23,9648.02];

//[nil,nil,rTitleText,"Bandits have hijacked a MV22! Capture it for yourself!", "PLAIN",10] call RE;


// Send message to users
_hint = parseText format["<t align='center' color='#ff0000' shadow='2' size='1.55'>MV22 Landed</t><br/><t align='center' color='#ffffff'>Bandits have hijacked a MV22! Capture it for yourself!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;


//Create the scenery
_base1 = createVehicle ["Land_fort_artillery_nest",[(_coords select 0) - 5.939,(_coords select 1) + 10.0459,0],[], 0, "CAN_COLLIDE"];
_base1 setDir -31.158424;
[_base1] call DZMSProtectObj;
_base1 setPos [(_coords select 0) - 5.939,(_coords select 1) + 10.0459,0];

_base2 = createVehicle ["Land_fort_artillery_nest",[(_coords select 0) + 6.3374, (_coords select 1) - 11.1944,0],[], 0, "CAN_COLLIDE"];
_base2 setDir -211.14516;
[_base2] call DZMSProtectObj;
_base2 setPos [(_coords select 0) + 6.3374, (_coords select 1) - 11.1944,0];

_base3 = createVehicle ["Land_fort_rampart",[(_coords select 0) + 12.2456, (_coords select 1) + 6.249,0],[], 0, "CAN_COLLIDE"];
_base3 setDir -120.93051;
[_base3] call DZMSProtectObj;
_base3 setPos [(_coords select 0) + 12.2456, (_coords select 1) + 6.249,0];

_base4 = createVehicle ["Land_fort_rampart",[(_coords select 0) - 11.4253, (_coords select 1) - 7.628,0],[], 0, "CAN_COLLIDE"];
_base4 setDir 59.42643;
[_base4] call DZMSProtectObj;
_base4 setPos [(_coords select 0) - 11.4253, (_coords select 1) - 7.628,0];



//We create the vehicles like normal
_vehicle = createVehicle ["MV22_DZ",[(_coords select 0), (_coords select 1),0],[], 0, "CAN_COLLIDE"];
_vehicle setVehicleLock "LOCKED";

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call DZMSSetupVehicle;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0)+1,(_coords select 1)-1, 0],4,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0)-1,(_coords select 1)+2, 0],2,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;

_vehicle setVehicleLock "UNLOCKED";

//Let everyone know the mission is over
[nil,nil,rTitleText,"The MV22 is almost in the air!", "PLAIN",6] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>MV22 Landed</t><br/><t align='center' color='#ffffff'>The MV22 has been captured and is almost in the air!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


diag_log text format["[DZMS]: Major SM7 MV22 Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;