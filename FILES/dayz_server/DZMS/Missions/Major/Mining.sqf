/*
	Medical Crate by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/

private ["_missName","_coords","_net","_veh1","_veh2","_vehicle","_vehicle1","_crate"];

//Name of the Mission
_missName = "Bandit Mining";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//[nil,nil,rTitleText,"Bandits found a hidden hemp farm!", "PLAIN",10] call RE;
// Send message to users
_hint = parseText format["<t align='center' color='#ff0000' shadow='2' size='1.55'>Bandit Mining</t><br/><t align='center' color='#ffffff'>Bandits found a mining node! Capture it!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;


_building3 = createVehicle ["MAP_dirthump03",[(_coords select 0)-3.6348, (_coords select 1)-12.1074,0],[], 0, "NONE"];
_building3 setDir 21.22957;
[_building3] call DZMSProtectObj;

_building4 = createVehicle ["MAP_Ind_Conveyer",[(_coords select 0)+6.0122, (_coords select 1)-5.7314,0],[], 0, "CAN_COLLIDE"];
_building4 setDir -36.780071;
[_building4] call DZMSProtectObj;

_building5 = createVehicle ["MAP_dirthump03",[(_coords select 0)-11.2646, (_coords select 1)+5.8487,0],[], 0, "CAN_COLLIDE"];
_building5 setDir -10.76869;
[_building5] call DZMSProtectObj;

_building6 = createVehicle ["MAP_SeaCrate",[(_coords select 0)+6.5903, (_coords select 1)+1.3799,0],[], 0, "CAN_COLLIDE"];
_building6 setDir -32.734489;
[_building6] call DZMSProtectObj;




//We create the vehicles like normal
_veh2 = ["large"] call DZMSGetVeh;
_vehicle1 = createVehicle [_veh2,[(_coords select 0) - 7.2764, (_coords select 1) - 21.086,10],[], 0, "CAN_COLLIDE"];
_vehicle1 setVehicleLock "LOCKED";


//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle1] call DZMSSetupVehicle;


//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
_crate = createVehicle ["USVehicleBox",[(_coords select 0) - 1.5547,(_coords select 1) + 2.3486,0],[], 0, "CAN_COLLIDE"];
// Clear the current cargo
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
[_crate] call DZMSProtectObj;


//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) + 0.07319,(_coords select 1) -7.8135, 0],3,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) - 8.2534,(_coords select 1) -2.62309, 0],3,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;





//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;

_vehicle1 setVehicleLock "UNLOCKED";
[_crate,"ore"] ExecVM DZMSBoxSetup;

//Let everyone know the mission is over
//[nil,nil,rTitleText,"The weed farm is clear of bandits! Players are farming now!", "PLAIN",6] call RE;
diag_log text format["[DZMS]: bandit mining."];

// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>Bandit Mining</t><br/><t align='center' color='#ffffff'>Players captured the mining node!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;