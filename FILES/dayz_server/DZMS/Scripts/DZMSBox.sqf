/*
	Usage: [_crate,"type"] execVM "dir\DZMSBox.sqf";
		_crate is the crate to fill
		"type" is the type of crate
		"type" can be weapons or medical
*/
_crate = _this select 0;
_type = _this select 1;

// Clear the current cargo
clearWeaponCargoGlobal _crate;
clearMagazineCargoGlobal _crate;

// Define lists. Some lists are defined in DZMSWeaponCrateList.sqf in the ExtConfig.
_bpackList = ["DZ_Patrol_Pack_EP1","DZ_Assault_Pack_EP1","DZ_Czech_Vest_Puch","DZ_ALICE_Pack_EP1","DZ_TK_Assault_Pack_EP1","DZ_British_ACU","DZ_CivilBackpack_EP1","DZ_Backpack_EP1"];
_gshellList = ["HandGrenade_west","HandGrenade_west","HandGrenade_west","HandGrenade_west","HandGrenade_west","FlareGreen_M203",'PipeBomb',"FlareWhite_M203"];
_medical = ["ItemBandage","ItemMorphine","ItemEpinephrine","ItemPainkiller","ItemWaterbottle","FoodMRE","ItemAntibiotic","ItemBloodbag"];
_money = ["ItemGoldBar","ItemGoldBar","ItemGoldBar","ItemGoldBar10oz","ItemSilverBar10oz","ItemSilverBar10oz","ItemSilverBar10oz"];
_gem = ["ItemObsidian","ItemAmethyst","ItemEmerald","ItemTopaz","ItemCitrine","ItemCitrine","ItemCitrine"];
_ore = ["PartOreSilver","PartOre","PartOreGold"];
_highValueItem = ["ItemObsidian","ItemAmethyst","ItemEmerald","ItemTopaz","ItemBriefcase100oz"];

_highValueItemChance = 14;

//////////////////////////////////////////////////////////////////
// Medical Crates
if (_type == "medical") then {
	// load medical
	_scount = count _medical;
	for "_x" from 0 to 40 do {
		_sSelect = floor(random _sCount);
		_item = _medical select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 2))];
	};
};

///////////////////////////////////////////////////////////////////
// Weapon Crates
if (_type == "weapons") then {
	// load grenades
	_scount = count _gshellList;
	for "_x" from 0 to 2 do {
		_sSelect = floor(random _sCount);
		_item = _gshellList select _sSelect;
		_crate addMagazineCargoGlobal [_item,(round(random 2))];
	};
   
	 
	// load pistols
	_scount = count DZMSpistolList;
	for "_x" from 0 to 2 do {
		_sSelect = floor(random _sCount);
		_item = DZMSpistolList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 8))];
		};
	};

	//load sniper
	_scount = count DZMSsniperList;
	for "_x" from 0 to 1 do {
		_sSelect = floor(random _sCount);
		_item = DZMSsniperList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 8))];
		};
	};

	//load mg
	_scount = count DZMSmgList;
	for "_x" from 0 to 1 do {
		_sSelect = floor(random _sCount);
		_item = DZMSmgList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 8))];
		};
	};

	//load primary
	_scount = count DZMSprimaryList;
	for "_x" from 0 to 1 do {
		_sSelect = floor(random _sCount);
		_item = DZMSprimaryList select _sSelect;
		_crate addWeaponCargoGlobal [_item,1];
		_ammo = [] + getArray (configFile >> "cfgWeapons" >> _item >> "magazines");
		if (count _ammo > 0) then {
			_crate addMagazineCargoGlobal [(_ammo select 0),(round(random 8))];
		};
	};
};

///////////////////////////////////////////////////////////////////
// Epoch Supply Crates
if (_type == "supply") then {
	// load tools
	_scount = count DZMSConTools;
	for "_x" from 0 to 2 do {
		_sSelect = floor(random _sCount);
		_item = DZMSConTools select _sSelect;
		_crate addWeaponCargoGlobal [_item, 1];
	};
	
	// load construction
	_scount = count DZMSConSupply;
	for "_x" from 0 to 40 do {
		_sSelect = floor(random _sCount);
		_item = DZMSConSupply select _sSelect;
		_crate addMagazineCargoGlobal [_item,1];
	};
	
		// load construction
	_scount = count DZMSConSupplyKits;
	for "_x" from 0 to 5 do {
		_sSelect = floor(random _sCount);
		_item = DZMSConSupplyKits select _sSelect;
		_crate addMagazineCargoGlobal [_item,1];
	};
	
	
};

// High Value Items
if((random 100) < _highValueItemChance) then {
		_item = _highValueItem call BIS_fnc_selectRandom;
		_crate addMagazineCargoGlobal [_item,1];
};



///////////////////////////////////////////////////////////////////
// Epoch Money Crates
if (_type == "money") then {
	// load money
	_scount = count _money;
	for "_x" from 0 to 15 do {
		_sSelect = floor(random _sCount);
		_item = _money select _sSelect;
		_crate addMagazineCargoGlobal [_item,1];
	};
};

if (_type == "ore") then {
	// load money
	_scount = count _ore;
	for "_x" from 0 to 15 do {
		_sSelect = floor(random _sCount);
		_item = _ore select _sSelect;
		_crate addMagazineCargoGlobal [_item,1];
	};
};


///////////////////////////////////////////////////////////////////
// Epoch Zero 4
if (_type == "zero4") then {
	// load money
	_sCount = count _gem;
	_gemNumber = round(random 2);
	_moneyNumber = round(random 8);
	for "_x" from 0 to _gemNumber do {
		_sSelect = floor(random _sCount);
		_item = _gem select _sSelect;
		_crate addMagazineCargoGlobal [_item,1];
	};
	_sCount2 = count _money;
	for "_x" from 0 to _moneyNumber do {
		_sSelect2 = floor(random _sCount2);
		_item2 = _money select _sSelect2;
		_crate addMagazineCargoGlobal [_item2,1];
	};
};