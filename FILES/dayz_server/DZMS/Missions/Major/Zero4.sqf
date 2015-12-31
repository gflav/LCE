/*
	Medical Crate by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/

private ["_missName","_coords","_net","_veh1","_veh2","_vehicle","_vehicle1","_crate"];

//Name of the Mission
_missName = "Zero 4 Attack";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
//_coords = call DZMSFindPos;
_coords = [8032.82,13652.4,0];


//[nil,nil,rTitleText,"The Zero2 bandits have created a forward outpost.", "PLAIN",10] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#ff0000' shadow='2' size='1.55'>Bandits at Zero 4</t><br/><t align='center' color='#ffffff'>Bandits have found a crate full of gems at Zero 4. Capture it for yourself!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

//Lets add the scenery

_crate = createVehicle ["GuerillaCacheBox",_coords,[], 0, "CAN_COLLIDE"];
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
[_crate] call DZMSProtectObj;




//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[8031.06,13611.1,0],3,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

[[8047.91,13638.5,0],3,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

[[8031.06,13611.1,0],3,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

[[8019.5,13668.3,0],2,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;


//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;

//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
[_crate,"zero4"] ExecVM DZMSBoxSetup;


//Let everyone know the mission is over
//[nil,nil,rTitleText,"The Zero2 outpost has been captured!", "PLAIN",6] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>Bandits at Zero 4</t><br/><t align='center' color='#ffffff'>Players have cleared Zero 4 of bandits and are looting the crate!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


diag_log text format["[DZMS]: Zero4 Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;