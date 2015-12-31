/*
	Medical Crate by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/

private ["_missName","_coords","_crate","_building","_building1","_building2","_building3","_building4","_building5","_building6","_building7"];

//Name of the Mission
_missName = "Zero 8 outpost 1";
//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;


//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddZero8Marker;


diag_log text format["[DZMS]: Zero 8 Bandits triggered."];

[nil,nil,rTitleText,"A Zero 8 Outpost is marked on the map! Capture it to spawn the Zero 8 loot crate!", "PLAIN",10] call RE;

//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray] [160.168,[8119.05,13504.2,0.00164795]]
[[(_coords select 0)-8.5,(_coords select 1)-9.5,0],2,3,"DZMSUnitsZeroOutpost"] call DZMSAISpawnZeroOutpost;
sleep 1;
[[(_coords select 0)+4.5,(_coords select 1)+6.5,0],2,3,"DZMSUnitsZeroOutpost"] call DZMSAISpawnZeroOutpost;
sleep 1;


_building = createVehicle ["MBG_Killhouse_1_InEditor",[(_coords select 0), (_coords select 1),0],[], 0, "NONE"];
[_building] call DZMSProtectObj;

_building2 = createVehicle ["FlagCarrierRedCrystal_EP1",[(_coords select 0)-7.2803, (_coords select 1)-8.61,0],[], 0, "NONE"];
_building2 setDir 21.22957;
[_building2] call DZMSProtectObj;

_building3 = createVehicle ["Land_HBarrier3_DZ",[(_coords select 0)-12.0561, (_coords select 1)-7.0700,0],[], 0, "NONE"];
_building3 setDir -93.964073;
[_building3] call DZMSProtectObj;

_building4 = createVehicle ["Land_HBarrier3_DZ",[(_coords select 0)-8.5869, (_coords select 1)-3.5260,0],[], 0, "NONE"];
_building4 setDir -35.427113;
[_building4] call DZMSProtectObj;

_building5 = createVehicle ["Land_HBarrier3_DZ",[(_coords select 0)-8.2949, (_coords select 1)-12.8110,0],[], 0, "NONE"];
_building5 setDir -136.50967;
[_building3] call DZMSProtectObj;

_building6 = createVehicle ["Land_HBarrier3_DZ",[(_coords select 0)-1.0874, (_coords select 1)-14.4820,0],[], 0, "NONE"];
_building6 setDir -182.23087;
[_building6] call DZMSProtectObj;

_building7 = createVehicle ["Land_HBarrier3_DZ",[(_coords select 0)+4.8814, (_coords select 1)-11.3350,0],[], 0, "NONE"];
_building7 setDir -66.389923;
[_building7] call DZMSProtectObj;

_crate = createVehicle ["USVehicleBox",[(_coords select 0)+2.7876, (_coords select 1)+2.2220,0],[], 0, "CAN_COLLIDE"];
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;
[_crate] call DZMSProtectObj;



//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsZeroOutpost"] call DZMSWaitMissionComp;

ZERO8Step = 2;

[_crate,"weapons"] ExecVM DZMSBoxSetup;

deleteMarker "DZMSZero8Marker";
deleteMarker "DZMSZero8Dot";


// Let everyone know the mission is over
[nil,nil,rTitleText,"The first Zero 8 Outpost has been captured.", "PLAIN",10] call RE;

diag_log text format["[DZMS]: Zero 8 Bandits are wiped out."];

