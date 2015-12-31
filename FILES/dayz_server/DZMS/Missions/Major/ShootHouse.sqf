/*
	Medical Crate by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire Land_MBG_Shoothouse_1
*/

private ["_missName","_coords","_net","_veh1","_veh2","_vehicle","_vehicle1","_crate"];

//Name of the Mission
_missName = "Bandit Shoothouse";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//[nil,nil,rTitleText,"Bandits have setup a training ground!", "PLAIN",10] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#ff0000' shadow='2' size='1.55'>Bandit Shoothouse</t><br/><t align='center' color='#ffffff'>Bandits have setup a training ground!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

//Lets add the scenery
_net = createVehicle ["Land_MBG_Shoothouse_1",[(_coords select 0), (_coords select 1),0],[], 0, "CAN_COLLIDE"];
_net setPos [(_coords select 0), (_coords select 1),0];
_net setVectorUp surfaceNormal position _net;
[_net] call DZMSProtectObj;

_crate = createVehicle ["USBasicWeaponsBox",[(_coords select 0) - 3.7251,(_coords select 1) - 2.3614, 0],[], 0, "CAN_COLLIDE"];
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
[_crate] call DZMSProtectObj;

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing


//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) + 1,(_coords select 1) - 2.87, 0],3,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 0.1,(_coords select 1) - 3.8799, 0],3,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0),(_coords select 1), 0],1,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;
[_crate,"supply"] ExecVM DZMSBoxSetup;


//Let everyone know the mission is over
//[nil,nil,rTitleText,"The Bandit Shoothouse is under survivor control!", "PLAIN",6] call RE;
diag_log text format["[DZMS]: Major SM6 Medical Cache Mission has Ended."];

// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>Bandit Shoothouse</t><br/><t align='center' color='#ffffff'>The Bandit Shoothouse is under survivor control!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;