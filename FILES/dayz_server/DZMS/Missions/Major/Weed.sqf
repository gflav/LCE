/*
	Medical Crate by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/

private ["_missName","_coords","_net","_veh1","_veh2","_vehicle","_vehicle1","_crate"];

//Name of the Mission
_missName = "Bandit Farmers";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//[nil,nil,rTitleText,"Bandits found a hidden hemp farm!", "PLAIN",10] call RE;
// Send message to users
_hint = parseText format["<t align='center' color='#ff0000' shadow='2' size='1.55'>Bandit Farmers</t><br/><t align='center' color='#ffffff'>Bandits found a hidden hemp farm! Grab a machette and take their plants!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;


_building3 = createVehicle ["ForestLargeCamoNet_DZ",[(_coords select 0), (_coords select 1),0],[], 0, "NONE"];
[_building3] call DZMSProtectObj;

_building4 = createVehicle ["fiberplant",[(_coords select 0) - 5, (_coords select 1) + 3,0],[], 0, "CAN_COLLIDE"];
[_building4] call DZMSProtectObj;

_building5 = createVehicle ["fiberplant",[(_coords select 0) - 19, (_coords select 1) + 2,0],[], 0, "CAN_COLLIDE"];
[_building5] call DZMSProtectObj;

_building7 = createVehicle ["fiberplant",[(_coords select 0) + 12, (_coords select 1) +1.4,0],[], 0, "CAN_COLLIDE"];
[_building7] call DZMSProtectObj;

_building9 = createVehicle ["fiberplant",[(_coords select 0)-12.2134, (_coords select 1)-2.499,0],[], 0, "CAN_COLLIDE"];
_building9 setDir 56.682259;
[_building9] call DZMSProtectObj;

_building11 = createVehicle ["Fort_StoneWall_EP1",[(_coords select 0) + 3.031699, (_coords select 1) -10.8135,0],[], 0, "CAN_COLLIDE"];
_building11 setDir -0.14436975;
[_building11] call DZMSProtectObj;

_building12 = createVehicle ["Fort_StoneWall_EP1",[(_coords select 0) + 13.79539, (_coords select 1) -5.60059,0],[], 0, "CAN_COLLIDE"];
_building12 setDir -75.797562;
[_building12] call DZMSProtectObj;

_building13 = createVehicle ["Fort_StoneWall_EP1",[(_coords select 0) + 0.85249, (_coords select 1) +12.9335,0],[], 0, "CAN_COLLIDE"];
[_building13] call DZMSProtectObj;

_building14 = createVehicle ["Fort_StoneWall_EP1",[(_coords select 0) - 5.6469, (_coords select 1) +12.5634,0],[], 0, "CAN_COLLIDE"];
_building14 setDir -24.305367;
[_building14] call DZMSProtectObj;



//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) + 0.07319,(_coords select 1) -7.8135, 0],3,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) - 8.2534,(_coords select 1) -2.62309, 0],3,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;


//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;

//Let everyone know the mission is over
//[nil,nil,rTitleText,"The weed farm is clear of bandits! Players are farming now!", "PLAIN",6] call RE;
diag_log text format["[DZMS]: bandit weedfarm."];

// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>Bandit Farmers</t><br/><t align='center' color='#ffffff'>The weed farm is clear of bandits! Players are farming now!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;