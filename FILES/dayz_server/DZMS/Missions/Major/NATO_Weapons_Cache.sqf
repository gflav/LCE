/*																					//
	Weapons Cache Mission by lazyink (Original Full Code by TheSzerdi & TAW_Tonic)
	New Mission Format by Vampire
*/																					//

private ["_missName","_coords","_net","_veh1","_veh2","_vehicle","_vehicle1","_crate"];

//Name of the Mission
_missName = "NATO Weapons Cache";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//[nil,nil,rTitleText,"Bandits have overrun a NATO weapons cache!", "PLAIN",10] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#ff0000' shadow='2' size='1.55'>NATO Weapons Cache</t><br/><t align='center' color='#ffffff'>Bandits have overrun a NATO weapons cache!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

//Lets add the scenery
_net = createVehicle ["Land_CamoNetB_NATO",[(_coords select 0) - 0.0649, (_coords select 1) + 0.6025,0],[], 0, "CAN_COLLIDE"];
_base = createVehicle ["Land_Fort_Watchtower",[(_coords select 0) +20, (_coords select 1)+20,-0.3],[], 0, "CAN_COLLIDE"];
[_net] call DZMSProtectObj;
[_base] call DZMSProtectObj;

//We create the vehicles like normal
_veh2 = ["large"] call DZMSGetVeh;
_vehicle1 = createVehicle [_veh2,[(_coords select 0) - 6.2764, (_coords select 1) - 14.086,10],[], 0, "CAN_COLLIDE"];
_vehicle1 setVehicleLock "LOCKED";

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_vehicle1] call DZMSSetupVehicle;

_crate = createVehicle ["USVehicleBox",_coords,[], 0, "CAN_COLLIDE"];
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
[_crate] call DZMSProtectObj;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],1,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],2,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],2,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 0.0352,(_coords select 1) - 6.8799, 0],1,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;
//DZMSBoxFill fills the box, DZMSProtectObj prevents it from disappearing
[_crate,"weapons"] ExecVM DZMSBoxSetup;

_vehicle1 setVehicleLock "UNLOCKED";


//Let everyone know the mission is over
//[nil,nil,rTitleText,"The Weapons Cache is Under Survivor Control!", "PLAIN",6] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>NATO Weapons Cache</t><br/><t align='center' color='#ffffff'>The Weapons Cache is Under Survivor Control!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


diag_log text format["[DZMS]: Major SM1 Weapon Cache Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;