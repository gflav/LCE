/*
	Medical Crate by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/

private ["_missName","_coords"];

//Name of the Mission
_missName = "Zero Triggered";

diag_log text format["[DZMS]: Zero 2 Bandits triggered."];

[nil,nil,rTitleText,"The Zero bandits are attacking!", "PLAIN",10] call RE;


//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[13727,2888.79,0],3,3,"DZMSUnitsZero"] call DZMSAISpawnZero;
sleep 5;

[[13645.9,2954.05,0],3,3,"DZMSUnitsZero"] call DZMSAISpawnZero;
sleep 5;

[[13811.3,2921.35,0],3,3,"DZMSUnitsZero"] call DZMSAISpawnZero;
sleep 5;

[[13476.7,2806.25,0],1,3,"DZMSUnitsZero"] call DZMSAISpawnZero;
sleep 5;


//Wait until the player is within 30 meters and also meets the kill req
[ZEROTriggerPosition,"DZMSUnitsZero"] call DZMSWaitMissionCompZero;

//Let everyone know the mission is over
[nil,nil,rTitleText,"The Zero bandits have been wiped out.", "PLAIN",10] call RE;

diag_log text format["[DZMS]: Zero 2 Bandits are wiped out, triggered mission has ended."];