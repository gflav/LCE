private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint", "_baserunover", "_baserunover1", "_baserunover2", "_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7","_baserunover8","_baserunover9","_baserunover10","_baserunover11","_baserunover12","_baserunover13","_baserunover14","_baserunover15","_baserunover16","_baserunover17","_baserunover18"];

_spawnChance =  0.15; // Percentage chance of event happening
_markerRadius = 300; // Radius the loot can spawn and used for the marker
_debug = false; // Puts a marker exactly were the loot spawns


_loot_box = "GuerillaCacheBox";
_loot_lists = [
[
["FN_FAL","M4A3_CCO_EP1","AKS_74_kobra","Sa58V_RCO_EP1"],
["20Rnd_762x51_FNFAL","20Rnd_762x51_FNFAL","20Rnd_762x51_FNFAL","30Rnd_762x39_SA58","30Rnd_762x39_SA58","30Rnd_762x39_SA58","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","ItemSodaOrangeSherbet","ItemSodaRbull","ItemSodaRbull","ItemSodaRbull","ItemSodaRbull"]
],
[
["UZI_SD_EP1"],
["30Rnd_9x19_UZI_SD","30Rnd_9x19_UZI_SD","30Rnd_9x19_UZI_SD","30Rnd_9x19_UZI_SD","30Rnd_9x19_UZI_SD","30Rnd_9x19_UZI_SD","30Rnd_9x19_UZI_SD","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemKiloHemp","ItemKiloHemp","ItemKiloHemp","ItemSodaOrangeSherbet"]
],
[
["MP5SD"],
["30Rnd_9x19_MP5SD","30Rnd_9x19_MP5SD","30Rnd_9x19_MP5SD","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz"]
],
[
["ChainSaw"],
["ItemCorrugated","ItemCorrugated","ItemCorrugated","ItemCorrugated","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemPole","ItemComboLock","ItemGenerator"]
],
[
["M40A3","M14_EP1","SVD_CAMO","M24_des_EP1"],
["5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24","10Rnd_762x54_SVD","10Rnd_762x54_SVD","10Rnd_762x54_SVD","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemKiloHemp","ItemKiloHemp","ItemKiloHemp","ItemKiloHemp","ItemKiloHemp","ItemKiloHemp","ItemKiloHemp","ItemSodaOrangeSherbet"]
],
[
["Pecheneg_DZ"],
["100Rnd_762x54_PK","100Rnd_762x54_PK","HandGrenade_east","HandGrenade_east","HandGrenade_east","HandGrenade_east","HandGrenade_east","HandGrenade_east","HandGrenade_east","bulk_ItemTankTrap","bulk_PartGeneric"]
],
[
["glock17_EP1","Colt1911","M9","MakarovSD","revolver_EP1"],
["17Rnd_9x19_glock17","7Rnd_45ACP_1911","7Rnd_45ACP_1911","7Rnd_45ACP_1911","8Rnd_9x18_MakarovSD","8Rnd_9x18_MakarovSD","8Rnd_9x18_MakarovSD","15Rnd_9x19_M9","15Rnd_9x19_M9","15Rnd_9x19_M9","HandGrenade_West","wood_ramp_kit","MortarBucket","MortarBucket","MortarBucket","MortarBucket","MortarBucket","MortarBucket","SmokeShellOrange","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","bulk_15Rnd_9x19_M9SD","7Rnd_45ACP_1911","7Rnd_45ACP_1911","7Rnd_45ACP_1911","7Rnd_45ACP_1911","metal_floor_kit","metal_floor_kit","metal_floor_kit","metal_floor_kit"]
],
[
["Mk_48_DZ","Mk_48_DZ","M240_DZ","M240_DZ"],
["100Rnd_762x51_M240","100Rnd_762x51_M240","100Rnd_762x51_M240","100Rnd_762x51_M240","100Rnd_762x51_M240","100Rnd_762x51_M240","100Rnd_762x51_M240","100Rnd_762x51_M240","100Rnd_762x51_M240","metal_floor_kit","metal_floor_kit","metal_floor_kit","metal_floor_kit"]
],
[
["BAF_AS50_scoped"],
["10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","10Rnd_127x99_m107","ItemSodaOrangeSherbet"]
],
[
["M110_NVG_EP1","M4SPR","M8_sharpshooter","M24","M40A3"],
["20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","20Rnd_762x51_DMR","5Rnd_762x51_M24","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks"]
],
[
["m240_scoped_EP1_DZE","Mk_48_DZ","M240_DZ","M60A4_EP1_DZ","RPK_74"],
["100Rnd_762x51_M240","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_556x45_BetaCMag","100Rnd_762x51_M240","200Rnd_556x45_M249","100Rnd_762x51_M240","100Rnd_762x51_M240","200Rnd_556x45_M249","2000Rnd_762x51_M134","2000Rnd_762x51_M134","ItemAVE","ItemLRK","ItemTNK","ItemARM","ItemORP","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked","ItemSeaBassCooked"]
],
[
["M4A1_HWS_GL_SD_Camo","M16A2GL","M16A4","M16A4_GL","M16A4_ACG_GL","M16A4_ACG","M4A1","M4A1_HWS_GL","M4A1_HWS_GL_camo","M4A1_HWS_GL_SD_Camo","M4A1_RCO_GL","M4A1_Aim","M4A1_Aim_camo","M4A1_AIM_SD_camo"],
["30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","FoodCanFrankBeans","FoodCanFrankBeans","FoodCanBakedBeans","FoodMRE","HandGrenade_east","2000Rnd_762x51_M134","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks"]
],
[
["VSS_vintorez","Saiga12K","M8_compact"],
["30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_StanagSD","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","HandGrenade_east","HandGrenade_east","FoodCanSardines","FoodMRE","FoodPistachio","FoodNutmix","FoodMRE","FoodPistachio","FoodNutmix","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks"]
]
];
_loot = _loot_lists call BIS_fnc_selectRandom;


_loot_amount = 75;
_wait_time = 900; 


// Dont mess with theses unless u know what yours doing
_start_time = time;
_spawnRadius = 5000;
_spawnMarker = 'center';


if (isNil "EPOCH_EVENT_RUNNING") then {
EPOCH_EVENT_RUNNING = false;
};


// Check for another event running
if (EPOCH_EVENT_RUNNING) exitWith {
diag_log("Event already running");
};


// Random chance of event happening
_spawnRoll = random 1;
if (_spawnRoll > _spawnChance and !_debug) exitWith {};


// Random location
_position = [getMarkerPos "center",0,5500,10,0,2000,0] call BIS_fnc_findSafePos;


diag_log(format["Spawning loot event at %1", _position]);


_event_marker = createMarker [ format ["loot_event_marker_%1", _start_time], _position];
_event_marker setMarkerShape "ELLIPSE";
_event_marker setMarkerColor "ColorOrange";
_event_marker setMarkerAlpha 0.5;
_event_marker setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];


_positionarray = [
[(_position select 0) - 14.5, (_position select 1) - 21,-0.012],
[(_position select 0) - 20, (_position select 1) - 20,-0.012],
[(_position select 0) + 25, (_position select 1) + 5,-0.012],
[(_position select 0) + 16, (_position select 1) - 14,-0.012],
[(_position select 0) + 49, (_position select 1) + 17.5,-0.012],
[(_position select 0) + 38.5, (_position select 1) - 16,-0.012]
];
_loot_pos = _positionarray call BIS_fnc_selectRandom;


_vehclass = cargo_trucks call BIS_fnc_selectRandom;


if (_debug) then {
_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
_debug_marker setMarkerShape "ICON";
_debug_marker setMarkerType "mil_dot";
_debug_marker setMarkerColor "ColorOrange";
_debug_marker setMarkerAlpha 1;
};


diag_log(format["Creating ammo box at %1", _loot_pos]);


// Create ammo box
_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
clearMagazineCargoGlobal _loot_box;
clearWeaponCargoGlobal _loot_box;


// Cut the grass around the loot position
_clutter = createVehicle ["ClutterCutter_small_2_EP1", _loot_pos, [], 0, "CAN_COLLIDE"];
_clutter setPos _loot_pos;
// cut the grass    end


// Buildings and Objects
_baserunover = createVehicle ["Land_a_stationhouse_ruins",[(_position select 0) - 5, (_position select 1) + 16,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover setDir 0;
_baserunover setVectorUp surfaceNormal position _baserunover;
_baserunover1 = createVehicle ["Land_kostel_trosky_ruins", [(_position select 0) + 1, (_position select 1) - 13,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover1 setDir 0;
_baserunover1 setVectorUp surfaceNormal position _baserunover1;
_baserunover2 = createVehicle ["Land_ruin_01", [(_position select 0) - 13, (_position select 1) - 3,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover2 setDir 0;
_baserunover2 setVectorUp surfaceNormal position _baserunover2;
_baserunover3 = createVehicle ["Land_ruin_chimney", [(_position select 0) + 14, (_position select 1) - 8,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover3 setDir 0;
_baserunover3 setVectorUp surfaceNormal position _baserunover3;
_baserunover4 = createVehicle ["Land_ruin_corner_2",[(_position select 0) + 17, (_position select 1) - 14,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover4 setDir 0;
_baserunover4 setVectorUp surfaceNormal position _baserunover4;
_baserunover5 = createVehicle ["Land_ruin_walldoor", [(_position select 0) - 12, (_position select 1) - 11,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover5 setDir 0;
_baserunover5 setVectorUp surfaceNormal position _baserunover5;
_baserunover6 = createVehicle ["MAP_rubble_bricks_02", [(_position select 0) + 7, (_position select 1) + 3,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover6 setDir 0;
_baserunover6 setVectorUp surfaceNormal position _baserunover6;
_baserunover7 = createVehicle ["MAP_rubble_wood_03", [(_position select 0) - 19, (_position select 1) - 9,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover7 setDir 0;
_baserunover7 setVectorUp surfaceNormal position _baserunover7;
_baserunover8 = createVehicle ["MAP_T34", [(_position select 0) - 7, (_position select 1) - 1,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover8 setDir 0;
_baserunover8 setVectorUp surfaceNormal position _baserunover8;
_baserunover9 = createVehicle ["MAP_Misc_trunk_water", [(_position select 0) - 9, (_position select 1) - 14,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover9 setDir 0;
_baserunover9 setVectorUp surfaceNormal position _baserunover9;
_baserunover10 = createVehicle ["MAP_HouseBlock_C1_ruins", [(_position select 0) + 30, (_position select 1) + 18,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover10 setDir 0;
_baserunover10 setVectorUp surfaceNormal position _baserunover10;
_baserunover11 = createVehicle ["MAP_HouseBlock_A3_ruins", [(_position select 0) + 41, (_position select 1) - 17,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover11 setDir -183.96;
_baserunover11 setVectorUp surfaceNormal position _baserunover11;
_baserunover12 = createVehicle ["MAP_Ind_Stack_Big_ruins", [(_position select 0) - 30, (_position select 1) - 28,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover12 setDir 0;
_baserunover12 setVectorUp surfaceNormal position _baserunover12;
_baserunover13 = createVehicle ["MAP_dulni_bs",[(_position select 0) + 48, (_position select 1) + 20,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover13 setDir 0;
_baserunover13 setVectorUp surfaceNormal position _baserunover13;
_baserunover14 = createVehicle ["MAP_rubble_rocks_01", [(_position select 0) + 49, (_position select 1) + 5,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover14 setDir -123.02;
_baserunover14 setVectorUp surfaceNormal position _baserunover14;
_baserunover15 = createVehicle ["HMMWVWreck", [(_position select 0) + 22, (_position select 1) + 8,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover15 setDir 0;
_baserunover15 setVectorUp surfaceNormal position _baserunover15;
_baserunover16 = createVehicle ["UralWreck", [(_position select 0) + 27, (_position select 1) + 3,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover16 setDir 33.81;
_baserunover16 setVectorUp surfaceNormal position _baserunover16;
_baserunover17 = createVehicle ["UralWreck", [(_position select 0) - 44, (_position select 1) + 11,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover17 setDir 45.3;
_baserunover17 setVectorUp surfaceNormal position _baserunover17;
_baserunover18 = createVehicle ["UralWreck", [(_position select 0) - 10, (_position select 1) - 23,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover18 setDir 200.2;
_baserunover18 setVectorUp surfaceNormal position _baserunover18;


// Add loot
{
_loot_box addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_loot_box addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);


// Send Top Right message to users , requires Remote message script
_hint = parseText format["<t align='center' color='#FF0000' shadow='2' size='1.75'>Rubble Town</t><br/><t align='center' color='#ffffff'>A special forces unit lost a precious cargo, Check your Map for the Location!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


// Send center message to users 
[nil,nil,rTitleText,"Mercenaries stashed a loot crate in rubble town]", "PLAIN",10] call RE;


diag_log(format["Loot event setup, waiting for %1 seconds", _wait_time]);


// Wait
sleep _wait_time;


// Clean up
EPOCH_EVENT_RUNNING = false;
deleteVehicle _loot_box;
// delete town
deleteVehicle _baserunover;
deleteVehicle _baserunover1;
deleteVehicle _baserunover2;
deleteVehicle _baserunover3;
deleteVehicle _baserunover4;
deleteVehicle _baserunover5;
deleteVehicle _baserunover6;
deleteVehicle _baserunover7;
deleteVehicle _baserunover8;
deleteVehicle _baserunover9;
deleteVehicle _baserunover10;
deleteVehicle _baserunover11;
deleteVehicle _baserunover12;
deleteVehicle _baserunover13;
deleteVehicle _baserunover14;
deleteVehicle _baserunover15;
deleteVehicle _baserunover16;
deleteVehicle _baserunover17;
deleteVehicle _baserunover18;

deleteMarker _event_marker;
if (_debug) then {
deleteMarker _debug_marker;
};