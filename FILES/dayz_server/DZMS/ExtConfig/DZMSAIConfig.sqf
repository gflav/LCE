/*
	DZMSAIConfig.sqf
	This is a configuration for the AI that spawn at missions.
	This includes their skin, weapons, gear, and skills.
	You can adjust these to your liking, but it is for advanced users.
*/

///////////////////////////////////////////////
// Array of skin classnames for the AI to use
DZMSBanditSkins = ["TK_INS_Soldier_EP1_DZ","TK_INS_Soldier_EP1_DZ","TK_INS_Warlord_EP1_DZ","TK_INS_Warlord_EP1_DZ"];

////////////////////////
// Array of AI Skills
DZMSSkills0 = [
	["aimingAccuracy",0.10,0.125],
	["aimingShake",0.45,0.55],
	["aimingSpeed",0.45,0.55],
	["endurance",0.40,0.50],
	["spotDistance",0.30,0.45],
	["spotTime",0.30,0.45],
	["courage",0.40,0.60],
	["reloadSpeed",0.50,0.60],
	["commanding",0.40,0.50],
	["general",0.40,0.60]
];

DZMSSkills1 = [
	["aimingAccuracy",0.60,0.90],
	["aimingShake",0.85,0.95],
	["aimingSpeed",0.80,0.90],
	["endurance",0.80,0.90],
	["spotDistance",0.70,0.90],
	["spotTime",0.70,0.90],
	["courage",0.80,1.00],
	["reloadSpeed",0.80,0.90],
	["commanding",0.80,0.90],
	["general",0.80,1.00]
];

DZMSSkills2 = [
	["aimingAccuracy",0.60,0.90],
	["aimingShake",0.85,0.95],
	["aimingSpeed",0.80,0.90],
	["endurance",0.80,0.90],
	["spotDistance",0.70,0.90],
	["spotTime",0.70,0.90],
	["courage",0.80,1.00],
	["reloadSpeed",0.80,0.90],
	["commanding",0.80,0.90],
	["general",0.80,1.00]
];

DZMSSkills3 = [	
	["aimingAccuracy",0.80,0.99],
	["aimingShake",0.75,0.95],
	["aimingSpeed",0.80,0.99],
	["endurance",0.90,1.00],
	["spotDistance",0.90,1.00],
	["spotTime",0.90,1.00],
	["courage",0.80,1.00],
	["reloadSpeed",0.40,0.99],
	["commanding",0.80,0.99],
	["general",0.90,1.00]
];

DZMSSkills4 = [	
	["aimingAccuracy",0.80,0.99],
	["aimingShake",0.75,0.95],
	["aimingSpeed",0.80,0.99],
	["endurance",0.90,1.00],
	["spotDistance",0.90,1.00],
	["spotTime",0.90,1.00],
	["courage",0.03,0.10],
	["reloadSpeed",0.40,0.99],
	["commanding",0.20,0.59],
	["general",0.90,1.00]
];

//////////////////////////////////////////////////////////////
// This is the primary weaponlist that can be assigned to AI
// These are assigned based on AI difficulty level
DZMSWeps0 = [
"M16A2",
"M16A2GL",
"AK_74",
"M4A1_Aim",
"AKS_74_kobra",
"AKS_74_U",
"AK_47_M",
"M24",
"M4A1",
"M14_EP1",
"Remington870_lamp",
"MP5A5",
"MP5SD",
"M4A3_CCO_EP1"
];

DZMSWeps1 = [
"M16A2",
"M16A2GL",
"M249_DZ",
"AK_74",
"M4A1_Aim",
"AKS_74_kobra",
"AKS_74_U",
"AK_47_M",
"M24",
"SVD_CAMO",
"M4A1",
"M14_EP1",
"M240_DZ",
"M4A1_AIM_SD_camo",
"M16A4_ACG",
"M4A1_HWS_GL_camo",
"Mk_48_DZ",
"M4A3_CCO_EP1",
"Sa58V_RCO_EP1",
"Sa58V_CCO_EP1",
"M40A3",
"Sa58P_EP1",
"Sa58V_EP1"
];

DZMSWeps2 = [
"FN_FAL",
"BAF_L85A2_RIS_Holo",
"G36C",
"G36C_camo",
"G36A_camo",
"G36K_camo",
"AK_47_M",
"AKS_74_U",
"M14_EP1"
];

DZMSWeps3 = [
"FN_FAL",
"BAF_L85A2_RIS_Holo",
"AK_47_M",
"AKS_74_U",
"M14_EP1",
"RPK_74",
"M4A3_CCO_EP1",
"Sa58V_RCO_EP1",
"Sa58V_CCO_EP1",
"M16A2",
"M16A2GL",
"M60A4_EP1_DZE",
"RPK_74",
"M240_DZ",
"M4A1_AIM_SD_camo",
"M16A4_ACG",
"M4A1_HWS_GL_camo"
];

/////////////////////////////////////////////////////////////
// These are gear sets that will be randomly given to the AI
// They are all the same, but can be customized.
DZMSGear0 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemFlashlight"]
];

DZMSGear1 = [
["ItemBandage","ItemBandage","ItemMorphine"],
["ItemFlashlight"]
];

DZMSGear2 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
["ItemFlashlight"]
];

DZMSGear3 = [
["ItemBandage","ItemBandage","ItemPainkiller"],
[]
];

DZMSGear4 = [
["ItemBandage","ItemBandage","ItemMorphine"],
["ItemKnife"]
];

////////////////////////////////////////////////////////////
// These are the backpacks that can be assigned to AI units.
DZMSPacklist = [
"DZ_Assault_Pack_EP1",
"DZ_ALICE_Pack_EP1",
"DZ_TK_Assault_Pack_EP1",
"DZ_British_ACU",
"DZ_CivilBackpack_EP1",
"DZ_Backpack_EP1"
];