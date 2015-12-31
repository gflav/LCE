private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];

_spawnChance =  0.30; // Percentage chance of event happening
_markerRadius = 400; // Radius the loot can spawn and used for the marker
_debug = false; // Puts a marker exactly were the loot spawns

_loot_box = "RUBasicWeaponsBox";
_loot_lists = [
					[
						["MG36","AKS_74_PSO","M40A3"], 
						["ItemPainkiller","ItemMorphine","HandGrenade_West","ItemBloodbag", "ItemAntibiotic","ItemEpinephrine","SmokeShellYellow","SmokeShellRed","SmokeShellGreen","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","100Rnd_556x45_BetaCMag","100Rnd_556x45_BetaCMag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24","5Rnd_762x51_M24","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK"]
					
					],
					[
						["M9SD"],
						["15Rnd_9x19_M9SD","15Rnd_9x19_M9SD","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaCoke","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","ItemSodaPepsi","FoodCanBakedBeans","FoodCanBakedBeans","FoodCanBakedBeans","FoodCanBakedBeans","FoodCanPasta","FoodCanPasta","FoodCanPasta","FoodCanPasta","FoodCanSardines","FoodCanSardines","FoodCanSardines","FoodCanSardines","FoodMRE","FoodMRE","FoodMRE","FoodMRE","FoodMRE"]
					],
					[
						["revolver_gold_EP1"],
						["6Rnd_45ACP","ItemBriefcase100oz"]
					],
					[
						["RPG7V"], 
						["ItemPainkiller","ItemMorphine","HandGrenade_West","HandGrenade_West","ItemBloodbag", "ItemAntibiotic","ItemEpinephrine","Skin_GUE_Soldier_2_DZ","SmokeShellYellow","SmokeShellRed","SmokeShellGreen","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","HandGrenade_East","PG7V","PG7V","HandGrenade_West"]
					],
					[
						["RPK_74","AK_107_Kobra","M8_sharpshooter","VSS_Vintorez"], 
						["ItemPainkiller","ItemMorphine","ItemBloodbag","ItemAntibiotic","ItemEpinephrine","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","SmokeShellYellow","SmokeShellRed","SmokeShellGreen","SmokeShellPurple","SmokeShellBlue","SmokeShellOrange","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","20Rnd_9x39_SP5_VSS","75Rnd_545x39_RPK","75Rnd_545x39_RPK","75Rnd_545x39_RPK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_545x39_AK","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]
					],
					[
						[],
						["ItemTroutCooked","ItemTroutCooked","ItemTroutCooked","ItemWoodStairs","ItemWoodStairs","ItemWoodStairs","MortarBucket","CinderBlocks","MortarBucket","CinderBlocks","MortarBucket","CinderBlocks","MortarBucket","CinderBlocks","MortarBucket","CinderBlocks","MortarBucket","CinderBlocks","MortarBucket","CinderBlocks","MortarBucket","CinderBlocks","MortarBucket","CinderBlocks","MortarBucket","CinderBlocks","MortarBucket","CinderBlocks","ItemWoodWallWithDoorLocked","CinderBlocks"]
						],
					[
						["BAF_L85A2_UGL_Holo","BAF_L85A2_UGL_SUSAT","BAF_L85A2_UGL_ACOG"], 
						["ItemPainkiller","ItemMorphine","HandGrenade_West","HandGrenade_West","ItemBloodbag","ItemAntibiotic","ItemEpinephrine","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","ItemGoldBar10oz","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag"]
					],
					[
						[],					
						["PartPlankPack","PartPlankPack","sandbag_nest_kit","metal_floor_kit","ItemTankTrap","ItemTankTrap","ItemTankTrap","ItemTankTrap","PartPlankPack","PartPlankPack","PartPlankPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlankPack","PartPlankPack","PartPlankPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlankPack","PartPlankPack","PartPlankPack"]
					],
					[
						["m240_scoped_EP1_DZE","M60A4_EP1_DZE","PK"], 
						["ItemPainkiller","ItemMorphine","HandGrenade_West","ItemBloodbag","ItemAntibiotic","ItemEpinephrine","Skin_GUE_Soldier_2_DZ","5Rnd_86x70_L115A1","100Rnd_762x54_PK","100Rnd_762x54_PK","100Rnd_762x54_PK","100Rnd_762x51_M240","100Rnd_762x51_M240","100Rnd_762x51_M240","100Rnd_762x51_M240","100Rnd_762x51_M240","200Rnd_556x45_M249","200Rnd_556x45_M249","200Rnd_556x45_M249","200Rnd_556x45_M249"]
					],
					[
						["SCAR_H_LNG_Sniper","SVD_des_EP1","BAF_LRR_Scoped"], 
						["ItemPainkiller","ItemMorphine","HandGrenade_West","ItemBloodbag","ItemAntibiotic","ItemEpinephrine","5Rnd_86x70_L115A1","5Rnd_86x70_L115A1","10Rnd_762x54_SVD","10Rnd_762x54_SVD","10Rnd_762x54_SVD","10Rnd_762x54_SVD","10Rnd_762x54_SVD","5Rnd_86x70_L115A1"]
					],
					[
						["AA12_PMC"], 
						["ItemPainkiller","ItemMorphine","HandGrenade_West","ItemBloodbag","ItemAntibiotic","ItemEpinephrine","100Rnd_762x54_PK","100Rnd_762x54_PK","100Rnd_762x54_PK","20Rnd_B_AA12_Pellets","20Rnd_B_AA12_Pellets","20Rnd_B_AA12_74Slug","20Rnd_B_AA12_HE","20Rnd_B_AA12_HE"]
					]
				];
_loot = _loot_lists call BIS_fnc_selectRandom;

_loot_amount = 75;
_wait_time = 1800; 

// Dont mess with theses unless u know what yours doing
_start_time = time;
_spawnRadius = 5000;
_spawnMarker = 'center';

// Random chance of event happening
_spawnRoll = random 1;
if (_spawnRoll > _spawnChance and !_debug) exitWith {};

// Random location [[x,y,z],0,1000,10,0,25,0] call BIS_fnc_findSafePos;
_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,4000,0] call BIS_fnc_findSafePos;

diag_log(format["Spawning loot event at %1", _position]);

_event_marker = createMarker [ format ["loot_event_marker_%1", _start_time], _position];
_event_marker setMarkerShape "ELLIPSE";
_event_marker setMarkerColor "ColorRed";
_event_marker setMarkerAlpha 0.5;
_event_marker setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];

_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;

if (_debug) then {
	_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
	_debug_marker setMarkerShape "ICON";
	_debug_marker setMarkerType "mil_dot";
	_debug_marker setMarkerColor "ColorBlue";
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

// Add loot
{
_loot_box addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_loot_box addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);

// Send message to users (http://dayzepoch.com/forum/index.php?/topic/1026-server-side-hintglobalchat-fix-deathmsg-fix/)
_hint = parseText format["<t align='center' color='#52bf90' shadow='2' size='1.55'>LCE SUPPLY CRATE</t><br/><t align='center' color='#ffffff'>A supply cache has been dropped within the shaded area on the map, you have 30 minutes to grab the loot</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

diag_log(format["Loot event setup, waiting for %1 seconds", _wait_time]);

// Wait
sleep _wait_time;

// Clean up
deleteVehicle _loot_box;
deleteMarker _event_marker;
if (_debug) then {
	deleteMarker _debug_marker;
};