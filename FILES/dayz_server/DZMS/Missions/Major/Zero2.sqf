/*
	Medical Crate by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/

private ["_missName","_coords","_net","_veh1","_veh2","_vehicle","_vehicle1","_crate"];

//Name of the Mission
_missName = "Zero 2 Fort";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//[nil,nil,rTitleText,"The Zero2 bandits have created a forward outpost.", "PLAIN",10] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#ff0000' shadow='2' size='1.55'>Zero 2 Outpost</t><br/><t align='center' color='#ffffff'>The Zero 2 bandits have created a forward outpost.</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

//Lets add the scenery
_building = createVehicle ["MAP_dum_istan3_pumpa",[(_coords select 0), (_coords select 1)],[], 0, "CAN_COLLIDE"];
[_building] call DZMSProtectObj;

_crate = createVehicle ["GuerillaCacheBox",[(_coords select 0) - 3.3,(_coords select 1) + 3.2, 0],[], 0, "CAN_COLLIDE"];
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
[_crate] call DZMSProtectObj;

_building4 = createVehicle ["MAP_t_picea2s",[(_coords select 0) - 7, (_coords select 1) + 5,0],[], 0, "CAN_COLLIDE"];
[_building4] call DZMSProtectObj;

_building5 = createVehicle ["MAP_t_picea2s",[(_coords select 0) - 21, (_coords select 1) + 5,0],[], 0, "CAN_COLLIDE"];
[_building5] call DZMSProtectObj;



_building9 = createVehicle ["Land_HBarrier_large",[(_coords select 0)-12.2134, (_coords select 1)-4.499,0],[], 0, "CAN_COLLIDE"];
_building9 setDir 56.682259;
_building9 setVectorUp surfaceNormal position _building9;
[_building9] call DZMSProtectObj;

_building10 = createVehicle ["Land_HBarrier_large",[(_coords select 0) +13.32369, (_coords select 1) +10.1044,0],[], 0, "CAN_COLLIDE"];
_building10 setDir 60.339699;
_building10 setVectorUp surfaceNormal position _building10;
[_building10] call DZMSProtectObj;

_building11 = createVehicle ["Land_HBarrier_large",[(_coords select 0) + 3.031699, (_coords select 1) -12.8135,0],[], 0, "CAN_COLLIDE"];
_building11 setDir -0.14436975;
_building11 setVectorUp surfaceNormal position _building11;
[_building11] call DZMSProtectObj;

_building12 = createVehicle ["Land_HBarrier_large",[(_coords select 0) + 15.79539, (_coords select 1) -5.60059,0],[], 0, "CAN_COLLIDE"];
_building12 setDir -75.797562;
_building12 setVectorUp surfaceNormal position _building12;
[_building12] call DZMSProtectObj;

_building13 = createVehicle ["Land_HBarrier_large",[(_coords select 0) + 0.85249, (_coords select 1) +14.9335,0],[], 0, "CAN_COLLIDE"];
[_building13] call DZMSProtectObj;
_building13 setVectorUp surfaceNormal position _building13;

_building14 = createVehicle ["Land_HBarrier_large",[(_coords select 0) - 5.6469, (_coords select 1) +14.5634,0],[], 0, "CAN_COLLIDE"];
_building14 setDir -24.305367;
_building14 setVectorUp surfaceNormal position _building14;
[_building14] call DZMSProtectObj;


//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) + 0.07319,(_coords select 1) -2.8135, 0],6,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) - 2.2534,(_coords select 1) -1.62309, 0],6,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;


//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
[_crate,"money"] ExecVM DZMSBoxSetup;


//Let everyone know the mission is over
//[nil,nil,rTitleText,"The Zero2 outpost has been captured!", "PLAIN",6] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>Zero 2 Outpost</t><br/><t align='center' color='#ffffff'>The Zero 2 outpost has been captured!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


diag_log text format["[DZMS]: Zero 2 Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;