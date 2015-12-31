/*																		//
	DZMSAISpawn.sqf by Vampire
	Usage: [position,unitcount,skillLevel] execVM "dir\DZMSAISpawn.sqf";
		Position is the coordinates to spawn at [X,Y,Z]
		UnitCount is the number of units to spawn
		SkillLevel is the skill number defined in DZMSAIConfig.sqf
*/																		//
private ["_position","_unitcount","_skill","_bomberRoll","_wpRadius","_xpos","_ypos","_unitGroup","_aiskin","_unit","_weapon","_magazine","_wppos1","_wppos2","_wppos3","_wppos4","_wp1","_wp2","_wp3","_wp4","_wpfin","_unitArrayName","_unitMissionCount"];
_position = _this select 0;
_unitcount = _this select 1;
_skill = _this select 2;
_unitArrayName = _this select 3;

//diag_log text format ["[DZMS]: AI Pos:%1 / AI UnitNum: %2 / AI SkillLev:%3",_position,_unitcount,_skill];

_wpRadius = 20;

_xpos = _position select 0;
_ypos = _position select 1;

_switch = false; 

//Create the unit group. We use east by default.
_unitGroup = createGroup east;

//Probably unnecessary, but prevents client AI stacking
if (!isServer) exitWith {};

for "_x" from 1 to _unitcount do {

	//Lets pick a skin from the array
	_aiskin = ["Bandit2_DZ","Bandit1_DZ","GUE_Soldier_2_DZ","GUE_Soldier_MG_DZ","Ins_Soldier_GL_DZ","GUE_Soldier_Crew_DZ","GUE_Soldier_Sniper_DZ","Sniper1_DZ"] call BIS_fnc_selectRandom;
	
	//Lets spawn the unit
	_unit = _unitGroup createUnit [_aiskin, [(_position select 0),(_position select 1),(_position select 2)], [], 10, "PRIVATE"];
	
	//Make him join the correct team
	[_unit] joinSilent _unitGroup;
	
	//Add the behaviour
	_unit enableAI "TARGET";
	_unit enableAI "AUTOTARGET";
	_unit enableAI "MOVE";
	_unit enableAI "ANIM";
	_unit enableAI "FSM";
	_unit setCombatMode "RED";
	_unit setBehaviour "COMBAT";

	//Remove the items he spawns with by default
	removeAllWeapons _unit;
	removeAllItems _unit;
	
	//Now we need to figure out their loadout, and assign it
	
	//Get the weapon array based on skill
	_weaponArray = [_skill] call DZMSGetWeapon;
	
	_weapon = _weaponArray select 0;
	_magazine = _weaponArray select 1;
	
	//diag_log text format ["[DZMS]: AI Weapon:%1 / AI Magazine:%2",_weapon,_magazine];
	
	//Get the gear array
	//_aigearArray = [DZMSGear0,DZMSGear1,DZMSGear2,DZMSGear3,DZMSGear4,DZMSGear5,DZMSGear6,DZMSGear7];
	//_aigear = _aigearArray call BIS_fnc_selectRandom;
	
		_ItemsArray = [
		"ItemBandage",
		"ItemBloodbag",
		"ItemSodaRabbit",
		"Skin_INS_Soldier_AR_DZ",
		"ItemSodaRabbit",
		"ItemSodaRabbit",
		"ItemPainkiller",
		"ItemBandage",
		"FoodSteakCooked",
		"HandChemBlue",
		"FoodCanPasta",
		"ItemAntibiotic",
		"ItemMorphine",
		"ItemSodaCoke",
		"FoodrabbitCooked",
		"ItemBandage",
		"Skin_INS_Soldier_AR_DZ",
		"Skin_INS_Soldier_CO_DZ",
		"Skin_CZ_Soldier_Sniper_EP1_DZ"
		];

		_toolsArray = 
		[
		"ItemKnife",
		"ItemCrowbar",
		"ItemEtool",
		"ItemCompass",
		"ItemGPS",
		"ItemFishingPole",
		"Binocular",
		"Binocular_Vector",
		"ItemHatchet_DZE",
		"ItemMachete",
		"ItemMatchbox_DZE"
		];

		DZMSGear0 = [];
		DZMSGear1 = [];

		_gearItemAmount = round(random 2);
		_gearToolsAmount = floor(random 1);

		for "_x" from 0 to _gearItemAmount do {
				_num = floor(random (count _ItemsArray));
				DZMSGear0 = DZMSGear0 + [_ItemsArray select _num];
		};

		for "_x" from 0 to _gearToolsAmount do {
				_num = floor(random (count _ToolsArray));
				DZMSGear1 = DZMSGear1 + [_ToolsArray select _num];
		};
	
	DZMSGear0 = DZMSGear0 +["HandGrenade_west","SmokeShellOrange"];
	
	
	_gearmagazines = DZMSGear0;
	_geartools = DZMSGear1;
	
	//_gearmagazines = _aigear select 0;
	//_geartools = _aigear select 1;
	
	//Gear the AI backpack
	_aipack = DZMSPacklist call BIS_fnc_selectRandom;

	//Lets add it to the Unit
	for "_i" from 1 to 3 do {
		_unit addMagazine _magazine;
	};
	_unit addWeapon _weapon;
	_unit selectWeapon _weapon;
	
	//_unit addBackpack _aipack;
	
	if (DZMSUseNVG) then {
		_unit addWeapon "NVGoggles";
	};
	
	if (!_switch) then {
        _unit addWeapon "RPG18";
        _unit addMagazine "RPG18";
        _unit addMagazine "RPG18";
		_switch = true;
    } else {
        _unit addWeapon "Stinger";
        _unit addMagazine "Stinger";
		_unit addMagazine "Stinger";
		//_unit addMagazine "mine";
		_switch = false;
	};
	
	{
		_unit addMagazine _x
	} forEach _gearmagazines;
	
	{
		_unit addWeapon _x
	} forEach _geartools;
	
	_aicskill = DZMSSkills3;
	//Lets set the skills
	/*switch (_skill) do {
		case 0: {_aicskill = DZMSSkills0;};
		case 1: {_aicskill = DZMSSkills1;};
		case 2: {_aicskill = DZMSSkills2;};
		case 3: {_aicskill = DZMSSkills3;};
	};
	*/
	
	{
		_unit setSkill [(_x select 0),(_x select 1)]
	} forEach _aicskill;
	
	//Lets prepare the unit for cleanup
	_unit addEventHandler ["Killed",{ [(_this select 0), (_this select 1)] ExecVM DZMSAIKilledFast; }];
	_unit setVariable ["DZMSAI", true];
};


/* These are 4 waypoints in a NorthSEW around the center
_wppos1 = [_xpos, _ypos+20, 0];
_wppos2 = [_xpos+20, _ypos, 0];
_wppos3 = [_xpos, _ypos-20, 0];
_wppos4 = [_xpos-20, _ypos, 0];


_wp1 = _unitGroup addWaypoint [_wppos1, _wpRadius];
_wp1 setWaypointType "MOVE";
_wp2 = _unitGroup addWaypoint [_wppos2, _wpRadius];
_wp2 setWaypointType "MOVE";
_wp3 = _unitGroup addWaypoint [_wppos3, _wpRadius];
_wp3 setWaypointType "MOVE";
_wp4 = _unitGroup addWaypoint [_wppos4, _wpRadius];
_wp4 setWaypointType "MOVE";


// Then we add a center waypoint that tells them to visit the rest
_wpfin = _unitGroup addWaypoint [[_xpos,_ypos, 0], _wpRadius];
_wpfin setWaypointType "CYCLE";
*/

/*
if (("Mine" in (weapons _unit))) then {
	_unit action ["useWeapon",mine];
	_unit fire ["minemuzzle", "minemuzzle", "Mine"]
};
*/

_unit spawn {

		private["_vehicle_near","_bomb"];
		
		/*
		waitUntil
		{
			_vehicle_near = false;
			{
				
				if((isPlayer _x) && (vehicle _x != _x) && (vehicle _x distance _this < 4)) then {
					_vehicle_near = true
				};
				if((isPlayer _x) && ((playableUnits select _x) distance _this < 2)) then {
					_vehicle_near = true
				};
				
				
			} count playableUnits;
			(_vehicle_near)
		};
		*/
		//hint "Suicide bomb!";
		
		waitUntil 
		{ 
			_player_near = false;
			{ 
			
				if ((_this distance _x < 5) || !(alive _this)) then {
					_player_near = true;
				};
			
			} count playableUnits;
			(_player_near)
		}; 
		
		if(alive _this) then {
			_bomb = "Bo_GBU12_lgb" createVehicle (getPosATL _this);
			sleep 3;
			deleteVehicle _bomb;
		};
		
};


//diag_log text format ["[DZMS]: Spawned %1 AI at %2",_unitcount,_position];

// load the unit groups into a passed array name so they can be cleaned up later
call compile format["
%1 = %1 + (units _unitGroup); 
_unitMissionCount = count %1;
",_unitArrayName];

diag_log text format["[DZMS]: (%3) %1 AI Spawned, %2 units in mission.",count (units _unitGroup),_unitMissionCount,_unitArrayName];