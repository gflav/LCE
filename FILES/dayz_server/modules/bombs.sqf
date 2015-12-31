private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_pos", "_bomb", "_spawnRoll", "_position", "_bomb", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];
 
_spawnChance =  0.15; // Percentage chance of event happening
_markerRadius = 500; // Radius the loot can spawn and used for the marker
_debug = false; // Puts a marker exactly were the loot spawns
 
 
 //sleep function that uses diag_tickTime for accuracy
_DZMSSleep = {
    private["_sleepTime","_checkInterval","_startTime"];
	
    _sleepTime = _this select 0;
    _checkInterval = _this select 1;
	
    _startTime = diag_tickTime;
    waitUntil{sleep _checkInterval; (diag_tickTime - _startTime) > _sleepTime;};
};
 
 
_loot_box = "USOrdnanceBox";
_loot_lists = [

// List Start
[
    [
        "revolver_gold_EP1"
        ,'AK_107_GL_Kobra'
        ,'AK_107_Kobra'
        ,'AK_107_PSO'
        ,'AK_47_M'
        ,'AK_47_S'
        ,'AK_74'
        ,'AK_74_GL'
        ,'AK_74_GL_Kobra'
        ,'AKS_74'
        ,'AKS_74_Kobra'
        ,'AKS_74_PSO'
        ,'AKS_74_U'
        ,'AKS_74_UN_Kobra'
        ,'AKS_GOLD'
        ,'BAF_AS50_scoped'
        ,'BAF_L110A1_Aim'
        ,'BAF_L7A2_GPMG'
        ,'BAF_L85A2_RIS_ACOG'
        ,'BAF_L85A2_RIS_CWS'
        ,'BAF_L85A2_RIS_Holo'
        ,'BAF_L85A2_RIS_SUSAT'
        ,'BAF_L85A2_UGL_ACOG'
        ,'BAF_L85A2_UGL_Holo'
        ,'BAF_L85A2_UGL_SUSAT'
        ,'BAF_L86A2_ACOG'
        ,'BAF_LRR_scoped'
        ,'BAF_LRR_scoped_W'
        ,'bizon'
        ,'bizon_silenced'
        ,'Colt1911'
        ,'Crossbow'
        ,'DMR_DZ'
        ,'G36_C_SD_camo'
        ,'G36_C_SD_eotech'
        ,'G36a'
        ,'G36A_camo'
        ,'G36C'
        ,'G36C_camo'
        ,'G36K'
        ,'G36K_camo'
        ,'FN_FAL'
        ,'FN_FAL_ANPVS4'
        ,'glock17_EP1'
        ,'Huntingrifle'
        ,'LeeEnfield'
        ,'M1014'
        ,'m107_DZ'
        ,'M14_EP1'
        ,'M16A2'
        ,'M16A2GL'
        ,'m16a4'
        ,'m16a4_acg'
        ,'M16A4_ACG_GL'
        ,'M16A4_GL'
        ,'M24'
        ,'M24_des_EP1'
        ,'M240'
        ,'m240_scoped_EP1'
        ,'M249_DZ'
        ,'M249_EP1'
        ,'M249_m145_EP1'
        ,'M40A3'
        ,'M4A1'
        ,'M4A1_Aim'
        ,'M4A1_Aim_camo'
        ,'M4A1_AIM_SD_camo'
        ,'M4A1_HWS_GL'
        ,'M4A1_HWS_GL_camo'
        ,'M4A1_HWS_GL_SD_Camo'
        ,'M4A1_RCO_GL'
        ,'M4A3_CCO_EP1'
        ,'M4A3_RCO_GL_EP1'
        ,'M4SPR'
        ,'M60A4_EP1'
        ,'M9'
        ,'M9SD'
        ,'Makarov'
        ,'MakarovSD'
        ,'MG36'
        ,'Mk_48_DES_EP1'
        ,'Mk_48_DZ'
        ,'MP5A5'
        ,'MP5SD'
        ,'MR43'
        ,'Pecheneg'
        ,'PK'
        ,'Remington870_lamp'
        ,'revolver_EP1'
        ,'revolver_gold_EP1'
        ,'RPK_74'
        ,'Sa61_EP1'
        ,'Saiga12K'
        ,'SVD'
        ,'SVD_CAMO'
        ,'SVD_des_EP1'
        ,'SVD_NSPU_EP1'
        ,'UZI_EP1'
        ,'UZI_SD_EP1'
        ,'Winchester1866'
        ,'Binocular'
        ,'Binocular_Vector'
    ],
    
    [
    "6Rnd_45ACP"
    ,"ItemTinBar"
    ,"ItemGoldBar"
    ,"HandGrenade_east"
    ,"ItemMixOil"
    ,"ItemSodaRbull"
    ,"ItemSodaCokeEmpty"
    ,"30Rnd_545x39_AKSD"
    ,"ItemWoodWallDoor"
    ,"ItemHeatPack"
    ,"HandChemBlue"
    ,"ItemTrashToiletpaper"
    ,"ItemWoodWallThird"
    ,"FoodCanGriffEmpty"
    ,"ItemPainkiller"
    ,"10Rnd_9x39_SP5_VSS"
    ,"ItemWoodWallDoor"
    ,"ItemCitrine"
    ,"ItemBandage"
    ,"FoodCanGriffEmpty"
    ,"20Rnd_762x51_DMR"
    ,"8Rnd_9x18_MakarovSD"
    ,"ItemSodaCokeEmpty"
    ,"5Rnd_127x108_KSVK"
    ,"ItemPainkiller"
    ,"SmokeShell"
    ,"HandChemGreen"
    ,"1Rnd_HE_M203"
    ,"FoodNutmix"
    ,"8Rnd_9x18_MakarovSD"
    ,"CinderBlocks"
    ,"MortarBucket"
    ,"ItemPole"
    ,"PartGeneric"
    ,"ItemLockbox"
    ,"PartEngine"
    ,"ItemSledgeHandle"
    ,"ItemSledgeHead"
    ,"ItemSodaCoke"
    ,"FoodCanGriffEmpty"
    ,"ItemSodaRbull"
    ,"ItemDocument"
    ,"ItemGoldBar"
    ,"HandChemRed"
    ,"ItemSodaRabbit"
    ,"ItemObsidian"
    ,"ItemMorphine"
    ,"ItemBriefcase10oz"
    ,"ItemBriefcase20oz"
    ,"ItemAntibiotic"
    ,"ItemSodaLvg"
    ,"30Rnd_545x39_AK"
    ,"HandChemRed"
    ,"HandGrenade_west"
    ,"30Rnd_556x45_StanagSD"
    ,"ItemBandage"
    ,"30Rnd_545x39_AKSD"
    ,"TrashJackDaniels"
    ,"FoodCanFrankBeans"
    ,"ItemEmerald"
    ,"ItemSodaCokeEmpty"
    ,"PG7V"
    ,"30Rnd_545x39_AKSD"
    ,"ItemSodaOrangeSherbet"
    ,"FoodCanFrankBeans"
    ,"ItemWoodLadder"
    ,"FoodCanFrankBeans"
    ,"100Rnd_556x45_BetaCMag"
    ]
]
// List end

];
_loot = _loot_lists call BIS_fnc_selectRandom;
 
_loot_amount = 75;
_wait_time = 130; 
 
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
_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;

diag_log(format["***************************************** BOMB EVENT ---- Spawning loot event at %1", _position]);
 
_event_marker = createMarker [ format ["loot_event_marker_%1", _start_time], _position];
_event_marker setMarkerShape "ELLIPSE";
_event_marker setMarkerColor "ColorBlack";
_event_marker setMarkerAlpha 0.5;
_event_marker setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];
 
_loot_pos = [_position,0,(_markerRadius - 40),10,0,2000,0] call BIS_fnc_findSafePos;
 
if (_debug) then {
    _debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
    _debug_marker setMarkerShape "ICON";
    _debug_marker setMarkerType "mil_dot";
    _debug_marker setMarkerColor "ColorRed";
    _debug_marker setMarkerAlpha 1;
};
 
 
// Create ammo box
_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
clearMagazineCargoGlobal _loot_box;
clearWeaponCargoGlobal _loot_box;

 
// Cut the grass around the loot position
//_clutter = createVehicle ["ClutterCutter_small_2_EP1", _loot_pos, [], 0, "CAN_COLLIDE"];
//_clutter setPos _loot_pos;
// cut the grass    end
 

// Send message to users (http://dayzepoch.com/forum/index.php?/topic/1026-server-side-hintglobalchat-fix-deathmsg-fix/)
_hint = parseText format["<t align='center' color='#ff0000' shadow='2' size='1.55'>Explosive Crate</t><br/><t align='center' color='#ffffff'>Full of gear, if you're fast enough.</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage"; 
 
 
// Add loot
{
_loot_box addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_loot_box addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);
 
// Wait
// sleep _wait_time;
[400,5] call _DZMSSleep;

_pos = [_loot_pos select 0,_loot_pos select 1,0];
_bomb = createVehicle ["Bo_GBU12_LGB",_pos,[],0,"CAN_COLLIDE"];
_bomb setPos _pos;

deleteMarker _event_marker;
if (_debug) then {
    deleteMarker _debug_marker;
};

diag_log(format["***************************************** BOMB exploded", _position]);

 
// Wait
// sleep _wait_time;
[360,5] call _DZMSSleep; 
 
// Clean up
EPOCH_EVENT_RUNNING = false;
deleteVehicle _loot_box;
