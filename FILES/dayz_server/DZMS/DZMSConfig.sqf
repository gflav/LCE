/*
	DayZ Mission System Config by Vampire
	DZMS: https://github.com/SMVampire/DZMS-DayZMissionSystem
*/

///////////////////////////////////////////////////////////////////////
// Do you want your players to gain humanity from killing mission AI?
DZMSMissHumanity = true;

// How Much Humanity?
DZMSCntHumanity = 60;

// Do You Want AI to use NVGs?
//(They are deleted on death)
DZMSUseNVG = true;

// Do you want AI to use RPG7V's?
//(Only one unit per group spawn will have one)
DZMSUseRPG = true;

// Do you want AI kills to count as bandit kills?
DZMSCntBanditKls = true;

// Do you want AI to disappear instantly when killed?
DZMSCleanDeath = false;

// Do you want AI that players run over to not have gear?
// (If DZMSCleanDeath is true, this doesn't matter)
DZMSRunGear = true;

// How long before bodies disappear? (in seconds) (default = 2400)
DZMSBodyTime = 400;

// Percentage of AI that must be dead before mission completes (default = 0)
//( 0 is 0% of AI / 0.50 is 50% / 1 is 100% )
DZMSRequiredKillPercent = 1;

// How long in seconds before mission scenery disappears (default = 1800 / 0 = disabled)
DZMSSceneryDespawnTimer = 480;

// Should crates despawn with scenery? (default = false)
DZMSSceneryDespawnLoot = true;

//////////////////////////////////////////////////////////////////////////////////////////
// You can adjust the weapons that spawn in weapon crates inside DZMSWeaponCrateList.sqf
// You can adjust the AI's gear inside DZMSAIConfig.sqf in the ExtConfig folder also.
//////////////////////////////////////////////////////////////////////////////////////////

//////////////////////////////////////////////////////////////////////////////////////////
// Do you want to use static coords for missions?
// Leave this false unless you know what you are doing.
DZMSStaticPlc = false;

// Array of static locations. X,Y,Z
DZMSStatLocs = [
[0,0,0],
[0,0,0]
];

///////////////////////////////////////////////////////////////////////////////////////////////////////////
// Do you want vehicles from missions to save to the Database? (this means they will stay after a restart)
// If False, vehicles will disappear on restart. It will warn a player who gets inside of a vehicle.
// This is experimental, and off by default in this version.
DZMSSaveVehicles = false;

/////////////////////////////////////////////////////////////////////////////////////////////
// These are arrays of vehicle classnames for the missions.
// Adjust to your liking.

//Armed Choppers (Huey)
DZMSChoppers = [
"CH_47F_EP1_DZ",
"MH6J_DZ",
"AH6X_DZ",
"AH6J_EP1",
"BAF_Merlin_DZE",
"pook_H13_gunship",
"pook_H13_transport",
"MH60S_DZ",
"UH60M_EP1",
"Mi17_Civilian_DZ",
"Mi17_DZ"
];

//Small Vehicles (Humvees)
DZMSSmallVic = [
"ArmoredSUV_PMC_DZ",
"HMMWV_M998A2_SOV_DES_EP1_DZ",
"HMMWV_M1151_M2_CZ_DES_EP1_DZ",
"LandRover_Special_CZ_EP1_DZ",
"GAZ_Vodnik_DZ",
"LandRover_MG_TK_EP1_DZ",
"Offroad_DSHKM_Gue_DZ",
"Pickup_PK_GUE_DZ",
"Pickup_PK_INS_DZ",
"Pickup_PK_TK_GUE_EP1_DZ",
"UAZ_MG_TK_EP1_DZ",
"UAZ_AGS30_RU",
"UAZ_INS",
"UAZ_SPG9_INS",
"UAZ_AGS30_TK_EP1",
"HMMWV_Armored",
"Offroad_DSHKM_Ins",
"HMMWV_M2",
"tractor",
"BTR40_MG_TK_GUE_EP1",
"LandRover_MG_TK_INS_EP1",
"SUV_Camo",
"SUV_Yellow"
];

//Large Vehicles (Urals)
DZMSLargeVic = [
"Kamaz",
"MTVR_DES_EP1",
"T34",
"BAF_Jackal2_L2A1_w",
"BRDM2_Gue",
"Ural_CDF",
"Ural_TK_CIV_EP1",
"Ural_UN_EP1",
"V3S_Open_TK_CIV_EP1",
"V3S_Open_TK_EP1",
"V3S_Refuel_TK_GUE_EP1_DZ",
"UralRefuel_TK_EP1_DZ",
"MtvrRefuel_DES_EP1_DZ",
"KamazRefuel_DZ"
];




/*///////////////////////////////////////////////////////////////////////////////////////////
There are two types of missions that run simultaneously on a the server.
The two types are Major and Minor missions.

Major missions have a higher AI count, but also have more crates to loot.
Minor missions have less AI than Major missions, but have crates that reflect that.

Below is the array of mission file names and the minimum and maximum times they run.
Do not edit the Arrays unless you know what you are doing.
*/
DZMSMajorMissionCounter = 0;
DZMSMinorMissionCounter = 0;

// Major "C130_Crash","An2_drop","Weed",
// Minor "stash_house","racetrack_mission",

DZMSMajorArray = ["C130","TankTrap",'Zero2',"Mining","AN2_crash","Helicopter_landing","MV22_landed","NATO_Weapons_Cache",'ShootHouse'];

DZMSMinorArray = ["squad","medical_outpost","helicopter_crash","humvee_crash","weapons_truck","bandit_repair","smuggler","Tractor"];
//DZMSMinorArray = ["smuggler"];

// Shuffle Arrays
DZMSMajorArray call KK_fnc_arrayShuffle;
DZMSMinorArray call KK_fnc_arrayShuffle;



/////////////////////////////////////////////////////////////////////////////////////////////
// The Minumum time in seconds before a major mission will run.
// At least this much time will pass between major missions. Default = 650 (10.8 Minutes)
DZMSMajorMin = 400;

// Maximum time in seconds before a major mission will run.
// A major mission will always run before this much time has passed. Default = 2000 (33.33 Minutes)
DZMSMajorMax = 480;

// Time in seconds before a minor mission will run.
// At least this much time will pass between minor missions. Default = 600 (10 Minutes)
DZMSMinorMin = 350;

// Maximum time in seconds before a minor mission will run.
// A minor mission will always run before this much time has passed. Default = 990 (16.5 Minutes)
DZMSMinorMax = 440;

// Blacklist Zone Array -- missions will not spawn in these areas
// format: [[x,y,z],radius]
// Ex: [[06325,07807,0],300] //Starry Sobor
DZMSBlacklistZones = [
	[[06325,07807,0],1000]
];

/*=============================================================================================*/
// Do Not Edit Below This Line
/*=============================================================================================*/
DZMSVersion = "1.1FIN";
