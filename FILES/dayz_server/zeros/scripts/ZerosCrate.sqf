private["_cnt",'_trgLoot','_GunRandomizerA','_spawnRoll','_spawnChance','_gemNumber','_gunNumber','_itemlist','_moneylist','_spawnChanceRuby','_spawnChanceHotwire'];

_cnt = {alive _x} count playableUnits;

diag_log text format ["******************************** <Zeros>: CRATE SPAWN WITH SCALED LOOT - Zeros System. Players Online - "+str(_cnt)];

_gemNumber = 0;
_gunNumber = 0;
_itemNumber = 0;
_moneyNumber = 0;
_supplyNumber = 0;
_supplyKitsNumber = 0;
_spawnChanceRuby =  0.10;
_spawnChanceHotwire =  0.02;
_spawnChanceEvMoney = 0.01;


if(_cnt <= 5) then{
    
    diag_log "****** ZEROS: LOOT FOR 5 or less players";
    _gemNumber = 0;
    _gunNumber = 0;
    _itemNumber = 1;
    _moneyNumber = round(random 5);
    _supplyNumber = round(random 4);
    _spawnChanceRuby =  0.07;
    _spawnChanceHotwire =  0.01;

};

if(_cnt > 5 && _cnt <= 10) then{
    
    diag_log "****** ZEROS: LOOT FOR 10 or less players";
    _gemNumber = 1;
    _gunNumber = 0;
    _itemNumber = round(random 2);
    _moneyNumber = round(random 7);
    _supplyNumber = round(random 4);
    _spawnChanceRuby =  0.10;
    _spawnChanceHotwire =  0.02;
};

if(_cnt > 10 && _cnt <= 15) then{
    
    diag_log "****** ZEROS: LOOT FOR 15 or less players";
    _gemNumber = 0;
    _gunNumber = 0;
    _itemNumber = round(random 2);
    _moneyNumber = round(random 6);
    _supplyNumber = round(random 4);
    _spawnChanceRuby =  0.14;
    _spawnChanceHotwire =  0.03;
	_supplyKitsNumber = 0;
};

if(_cnt > 15 && _cnt <= 20) then{
    
    diag_log "****** ZEROS: LOOT FOR 20 or less players";
    _gemNumber = 0;
    _gunNumber = 0;
    _itemNumber = round(random 2);
    _moneyNumber = round(random 7);
    _supplyNumber = round(random 4);
    _spawnChanceRuby =  0.18;
    _spawnChanceHotwire =  0.04;
	_supplyKitsNumber = 1;
};

if(_cnt > 20 && _cnt <= 25) then{
    
    diag_log "****** ZEROS: LOOT FOR 25 or less players";
    _gemNumber = 0;
    _gunNumber = 0;
    _itemNumber = round(random 3);
    _moneyNumber = round(random 30);
	_supplyNumber = round(random 4);
    _spawnChanceRuby =  0.20;
    _spawnChanceHotwire =  0.05;
	_supplyKitsNumber = round(random 2);
};

if(_cnt > 25 && _cnt <= 30) then{
    
    diag_log "****** ZEROS: LOOT FOR 30 or less players";
    _gemNumber = round(random 2);
    _gunNumber = 0;
    _itemNumber = round(random 3);
    _moneyNumber = round(random 40);
	_supplyNumber = round(random 5);
    _spawnChanceRuby =  0.25;
    _spawnChanceHotwire =  0.10;
	_supplyKitsNumber = round(random 3);
};

if(_cnt > 30 && _cnt <= 35) then{
    
    diag_log "****** ZEROS: LOOT FOR 35 or less players";
    _gemNumber = round(random 2);
    _gunNumber = 1;
    _itemNumber = round(random 4);
    _moneyNumber = round(random 50);
	_supplyNumber = round(random 7);
    _spawnChanceRuby =  0.28;
    _spawnChanceHotwire =  0.07;
	_supplyKitsNumber = round(random 4);
	_spawnChanceEvMoney = 0.10;
};

if(_cnt > 35 && _cnt <= 40) then{
    
    diag_log "****** ZEROS: LOOT FOR 40 or less players";
    _gemNumber = round(random 2);
    _gunNumber = 1;
    _itemNumber = round(random 5);
	_supplyNumber = round(random 6);
    _moneyNumber = round(random 60);
    _spawnChanceRuby =  0.30;
    _spawnChanceHotwire =  0.05;
	_supplyKitsNumber = round(random 6);
	_spawnChanceEvMoney = 0.10;
};

if(_cnt > 40 && _cnt <= 45) then{
    
    diag_log "****** ZEROS: LOOT FOR 45 or less players";
    _gemNumber = round(random 3);
    _gunNumber = 1;
    _itemNumber = round(random 8);
	_supplyNumber = round(random 9);
    _moneyNumber = round(random 70);
    _spawnChanceRuby =  0.70;
    _spawnChanceHotwire =  0.07;
	_supplyKitsNumber = round(random 8);
	_spawnChanceEvMoney = 0.10;
};

if(_cnt > 45) then{
    
    diag_log "****** ZEROS: LOOT FOR 45 or more players";
    _gemNumber = round(random 3);
    _gunNumber = 1;
    _itemNumber = 7;
    _supplyNumber = round(random 10);
	_supplyKitsNumber = round(random 4);
    _moneyNumber = round(random 34);
    _spawnChanceRuby =  0.90;
    _spawnChanceHotwire =  0.1;
	
	_spawnChanceEvMoney = 0.11;
};

_supplyNumber = _supplyNumber + _cnt;

if(ZEROVersion == 6) then{
	_moneyNumber = _moneyNumber + 20;
};

////////////////////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////// CREATE & FILL BOX 
////////////////////////////////////////////////////////////////////////////////

ZEROCrate = createVehicle ["USOrdnanceBox", ZEROcratePosition, [], 0, "CAN_COLLIDE"];
ZEROCrate setVariable ["permaLoot",true]; 
ZEROCrate setDir 90;
ZEROCrate setPos ZEROcratePosition;

ZEROMarkerState = "spawned";

// Clear the current cargo
clearWeaponCargoGlobal ZEROCrate;
clearMagazineCargoGlobal ZEROCrate;

// Define lists. Some lists are defined in DZMSWeaponCrateList.sqf in the ExtConfig.

_gemlist = ['ItemTopaz','ItemObsidian','ItemSapphire','ItemAmethyst','ItemEmerald','ItemCitrine'];

_gunlist = ['AA12_PMC','RPG18','ChainSawP','Mk_48_DZ','BAF_AS50_scoped','SCAR_H_STD_EGLM_Spect','SCAR_H_LNG_Sniper_SD','SCAR_H_CQC_CCO_SD','M110_NVG_EP1','DMR_DZ','M107','PMC_AS50_TWS','M110_TWS_EP1','m107_TWS_EP1','AKS_74_GOSHAWK','SCAR_H_CQC_CCO','M79_EP1','BAF_L85A2_RIS_CWS','m8_tws_sd','M47Launcher_EP1','Kostey_map_case','Kostey_notebook','Moscow_Bombing_File','Laserdesignator','SCAR_L_STD_EGLM_TWS','Cobalt_File','ItemRadio','AKS_GOLD','Kostey_photos','CDF_dogtags','RPG18','Javelin','Stinger'];

_itemlist = ['NLAW','PG7VL','30m_plot_kit','Mine','Dragon_EP1','Laserbatteries','FoodrabbitRaw','MAAWS_HEAT',"Stinger","PipeBomb","Javelin",'PG7VR','Skin_Soldier_Sniper_PMC_DZ','2000Rnd_762x51_M134','MineE',"ItemBriefcase100oz",'PMC_ied_v4','PMC_ied_v2','RPG18'];

_moneylist = ["ItemGoldBar10oz"];

_supplylist = [
"CinderBlocks",
"MortarBucket"
];

_supplyKitsList = [
"cinder_wall_kit",
"ItemWoodFloor",
"cinder_garage_kit",
'wood_ramp_kit',
"metal_floor_kit",
"ItemFireBarrel_kit",
"PartVRotor",
'PartFueltank',
"PartEngine"
];


///////////////////////////////////////////////////////////////////

// gems
_scount = count _gemlist;
for "_x" from 0 to _gemNumber do {
    _sSelect = floor(random _sCount);
    _item = _gemlist select _sSelect;
    ZEROCrate addMagazineCargoGlobal [_item,1];
};

// guns
_scount = count _gunlist;
for "_x" from 0 to _gunNumber do {
    _sSelect = floor(random _sCount);
    _item = _gunlist select _sSelect;
    ZEROCrate addWeaponCargoGlobal [_item,1];
};

// Items
_scount = count _itemlist;
for "_x" from 0 to _itemNumber do {
    _sSelect = floor(random _sCount);
    _item = _itemList select _sSelect;
    ZEROCrate addMagazineCargoGlobal [_item,1];
};

// Money
_scount = count _moneylist;
for "_x" from 0 to _moneyNumber do {
    _sSelect = floor(random _sCount);
    _item = _moneyList select _sSelect;
    ZEROCrate addMagazineCargoGlobal [_item,1];
};

// Supplies
_scount = count _supplylist;
for "_x" from 0 to _supplyNumber do {
    _sSelect = floor(random _sCount);
    _item = _supplylist select _sSelect;
    ZEROCrate addMagazineCargoGlobal [_item,1];
};

// Supply Kit Lists
_scount = count _supplyKitsList;
for "_x" from 0 to _supplyKitsNumber do {
    _sSelect = floor(random _sCount);
    _item = _supplyKitsList select _sSelect;
    ZEROCrate addMagazineCargoGlobal [_item,1];
};


// Roll for high end items

_spawnRoll = random 1;

// RUBY ROLL <ZEROS> Crate Ruby Roll 0.794213 _spawnChanceRuby  0.15
if (_spawnRoll < _spawnChanceRuby) then {
   ZEROCrate addMagazineCargoGlobal ["ItemRuby", 1];
    diag_log("***************** <ZEROS> Ruby in crate");
};

// EVMONEY ROLL
if (_spawnRoll < _spawnChanceEvMoney) then {
   ZEROCrate addWeaponCargoGlobal ["EvMoney", 1];
   ZEROEVmoney = 1;
   [nil,nil,rTitleText,"The Zero loot crate has a rare Evdence Money in it! The Traveling Trader will pay huge briefs for it!", "PLAIN DOWN",160] call RE;
};

diag_log("***************** <ZEROS> Crate Ruby Roll " + str(_spawnRoll) + " _spawnChanceRuby  " + str( _spawnChanceRuby) );






