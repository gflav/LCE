/*
	Medical Crate by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	Updated to new format by Vampire
*/

private ["_missName","_coords"];

//Name of the Mission
_missName = "Zero Triggered";


diag_log text format["[DZMS]: Zero 6 Bandits triggered."];

[nil,nil,rTitleText,"The Zero bandits have sprung a trap!", "PLAIN",10] call RE;


//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray] [160.168,[8119.05,13504.2,0.00164795]]
[[7874.75,13666.8,0],3,3,"DZMSUnitsZero"] call DZMSAISpawnZero;
sleep 2;
[[7994.56,13665.4,0],2,3,"DZMSUnitsZero"] call DZMSAISpawnZero;
sleep 2;
[[7940.57,13658.1,0],3,3,"DZMSUnitsZero"] call DZMSAISpawnZero;


//Wait until the player is within 30 meters and also meets the kill req
[ZEROTriggerPosition,"DZMSUnitsZero"] call DZMSWaitMissionCompZero;



//Let everyone know the mission is over
[nil,nil,rTitleText,"The Zero bandits have been wiped out.", "PLAIN",10] call RE;


diag_log text format["[DZMS]: Zero 6 Bandits are wiped out, triggered mission has ended."];
