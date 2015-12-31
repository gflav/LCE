/*
	Medical Ural Attack by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to New Format by Vampire
*/

private ["_missName","_coords","_crash","_body","_body1","_body2","_body3","_veh1","_vehicle","_vehicle1","_crate","_crate2"];

//Name of the Mission
_missName = "Tank Trap";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//[nil,nil,rTitleText,"Bandits are fixing a damaged UN tank!", "PLAIN",10] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#ff0000' shadow='2' size='1.55'>Tank Trap</t><br/><t align='center' color='#ffffff'>Bandits are fixing a damaged UN tank!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

//We create the vehicles like normal

_vehicle = "M113Ambul_UN_EP1";

_vehicle = createVehicle [_vehicle,[(_coords select 0), (_coords select 1),0],[], 0, "CAN_COLLIDE"];
_vehicle setVehicleLock "LOCKED";

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call DZMSSetupVehicle;
_vehicle setFuel 0;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) - 2.46,(_coords select 1) - 1, 0],2,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 2,(_coords select 1) + 2, 0],2,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) - 1,(_coords select 1) - 2, 0],2,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;
_vehicle setVehicleLock "UNLOCKED";

//Call DZMSSaveVeh to attempt to save the vehicles to the database
//If saving is off, the script will exit.
[_vehicle] ExecVM DZMSSaveVeh;

//[nil,nil,rTitleText,"The UN tank has been secured by survivors!", "PLAIN",6] call RE;
diag_log text format["[DZMS]: Major Tank Trap has ended."];

// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>Tank Trap</t><br/><t align='center' color='#ffffff'>The UN tank has been secured by survivors! They can sell it at Travelling Trader!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;