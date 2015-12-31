/*
	Medical Crate by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/

private ["_missName","_coords","_net","_veh1","_veh2","_vehicle","_vehicle1","_crate","_scount","_locations"];

//Name of the Mission
_missName = "C130";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
//_coords = call DZMSFindPos;

_coords = [4895.23,9648.02,0];



//[nil,nil,rTitleText,"Bandits have hijacked a C130! Capture it for yourself and\nSell it at NEAF!", "PLAIN",10] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#ff0000' shadow='2' size='1.55'>C130</t><br/><t align='center' color='#ffffff'>Bandits have hijacked a C130! Capture it for yourself and sell it at NEAF!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

//We create the vehicles like normal
_vehicle = createVehicle ["C130J_US_EP1_DZ",[(_coords select 0), (_coords select 1),0],[], 0, "CAN_COLLIDE"];
_vehicle setDir 294.534;
_vehicle setVehicleLock "LOCKED";

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle] call DZMSSetupVehicle;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0)+1,(_coords select 1)-1, 0],5,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;

_vehicle setVehicleLock "UNLOCKED";

//Let everyone know the mission is over
//[nil,nil,rTitleText,"The C130 is almost in the air!", "PLAIN",6] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>C130</t><br/><t align='center' color='#ffffff'>The C130 is almost in the air!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

diag_log text format["[DZMS]: Major SM7 C130 Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;