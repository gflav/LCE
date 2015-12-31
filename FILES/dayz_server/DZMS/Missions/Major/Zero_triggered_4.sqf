/*
	Medical Crate by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/

private ["_missName","_coords"];

//Name of the Mission
_missName = "Zero Triggered";


[nil,nil,rTitleText,"The Zero bandits have sprung a trap!", "PLAIN",10] call RE;


//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[8041.49,13653.9,0],3,3,"DZMSUnitsZero"] call DZMSAISpawnZero;
sleep 5;

[[8014.55,13641.7,0],3,3,"DZMSUnitsZero"] call DZMSAISpawnZero;
sleep 5;

[[8048.75,13637.4,0],1,3,"DZMSUnitsZero"] call DZMSAISpawnZero;
sleep 5;

[[8048.75,13637.4,0],1,3,"DZMSUnitsZero"] call DZMSAISpawnZero;
sleep 5;

[[8040.82,13618.8,0.00131226],2,3,"DZMSUnitsZero"] call DZMSAISpawnZero;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[ZEROTriggerPosition,"DZMSUnitsZero"] call DZMSWaitMissionCompZero;


//Let everyone know the mission is over
[nil,nil,rTitleText,"The Zero bandits have been wiped out.", "PLAIN",10] call RE;


diag_log text format["[DZMS]: Zero 4 Bandits are wiped out, triggered mission has ended."];