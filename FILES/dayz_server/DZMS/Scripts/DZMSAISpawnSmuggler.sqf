/*																		//
	DZMSAISpawn.sqf by Vampire
	Usage: [position,unitcount,skillLevel] execVM "dir\DZMSAISpawn.sqf";
		Position is the coordinates to spawn at [X,Y,Z]
		UnitCount is the number of units to spawn
		SkillLevel is the skill number defined in DZMSAIConfig.sqf
*/																		//
private ["_position","_unitcount","_skill","_bomberRoll","_wpRadius","_xpos","_ypos","_unitGroup","_aiskin","_unit","_weapon","_magazine","_wppos1","_wppos2","_wppos3","_wppos4","_wp1","_wp2","_wp3","_wp4","_wpfin","_unitArrayName","_unitMissionCount","_smuggler","_loop","_bomberRoll","_bomberChance","_smugglerTarget","_target","_targetdistanceX","_targetdistanceY","_gemDistance","_modifier"];
_position = _this select 0;
_unitcount = _this select 1;
_skill = _this select 2;
_unitArrayName = _this select 3;

//diag_log text format ["[DZMS]: AI Pos:%1 / AI UnitNum: %2 / AI SkillLev:%3",_position,_unitcount,_skill];

_wpRadius = 200;

_xpos = _position select 0;
_ypos = _position select 1;

//Create the unit group. We use east by default.
_unitGroup = createGroup east;

//Probably unnecessary, but prevents client AI stacking
if (!isServer) exitWith {};

for "_x" from 1 to _unitcount do {

	_aiskin = "GUE_Soldier_Scout";
	
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
	//_unit setBehaviour "AWARE";
	//_unit setBehaviour "SAFE";

	//Remove the items he spawns with by default
	removeAllWeapons _unit;
	removeAllItems _unit;
	
	
	//Get the weapon array based on skill
	_weaponArray = [_skill] call DZMSGetWeapon;
	
	_weapon = "M249_EP1_DZ";
	_magazine = "200Rnd_556x45_M249";
	
		_ItemsArray = [
		"ItemBandage",
		"ItemBloodbag",
		"ItemPainkiller",
		"ItemBandage",
		"HandChemBlue",
		"ItemAntibiotic",
		"ItemMorphine",
		"ItemBandage"
		];
		
		_gemlist = ['ItemTopaz','ItemObsidian','ItemSapphire','ItemAmethyst','ItemEmerald','ItemCitrine'];

		_toolsArray = 
		[
		"ItemKnife",
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
		_gearGemsAmount = round(random 4);
		
		for "_x" from 0 to _gearItemAmount do {
				_num = floor(random (count _ItemsArray));
				DZMSGear0 = DZMSGear0 + [_ItemsArray select _num];
		};
		
		for "_x" from 0 to _gearGemsAmount do {
				_num = floor(random (count _gemlist));
				DZMSGear0 = DZMSGear0 + [_gemlist select _num];
		};

		for "_x" from 0 to _gearToolsAmount do {
				_num = floor(random (count _ToolsArray));
				DZMSGear1 = DZMSGear1 + [_ToolsArray select _num];
		};
	

	_gearmagazines = DZMSGear0;
	_geartools = DZMSGear1;


	//Lets add it to the Unit
	for "_i" from 2 to 3 do {
		_unit addMagazine _magazine;
	};
	_unit addWeapon _weapon;
	_unit selectWeapon _weapon;
	
	//_unit addBackpack _aipack;
	
	if (DZMSUseNVG) then {
		_unit addWeapon "NVGoggles";
	};
	
	_unit addWeapon "Stinger";
	_unit addMagazine "Stinger";
	_unit addMagazine "Stinger";
	_unit addMagazine "Stinger";
	_unit addMagazine "Stinger";
		
	
	{
		_unit addMagazine _x
	} forEach _gearmagazines;
	
	{
		_unit addWeapon _x
	} forEach _geartools;
	
	_aicskill = DZMSSkills4;
	
	{
		_unit setSkill [(_x select 0),(_x select 1)]
	} forEach _aicskill;
	
	_unit addEventHandler ["Killed",{ [(_this select 0), (_this select 1)] ExecVM DZMSAIKilled; }];
	_unit setVariable ["DZMSAI", true];
};

_targetdistanceY = 0;
_targetdistanceX = 0;
_modifier = 600;

if(((round(random 100))% 2) == 1) then {
	_targetdistanceX = (random(1200)+_modifier);
} else {
	_targetdistanceX = 0-(random(1200)+_modifier);
};

if(((round(random 100))% 2) == 1) then {
	_targetdistanceY = (random(1200)+_modifier);
} else {
	_targetdistanceY = 0-(random(1200)+_modifier);
};

_finalLocation = [(_position select 0) + _targetdistanceX,(_position select 1) + _targetdistanceY,0];



// FIND DISTANCE TRAVELED
//_gemDistance = (_position vectorDistance _finalLocation);
//diag_log text format["[DZMS]: Gem Smuggler travel distance = %1",_gemDistance];

//diag_log text format ["[DZMS]: Gem Smuggler is traveling this distance %1",_finalLocation];	

	
_loop = true;
while {_loop} do {

	_finalLocation = [(_position select 0) + _targetdistanceX,(_position select 1) + _targetdistanceY,0];
	diag_log text format ["[DZMS]: Gem Smuggler Surface is water %1 ",(surfaceIsWater _finalLocation)];
	
	if (!(surfaceIsWater _finalLocation)) then {
		_loop = false;
	};

};


diag_log text format ["[DZMS]: Gem Smuggler AFTER Water Loop _finalLocation %1",_finalLocation];	


_building3 = createVehicle ["Bunker_PMC",[(_finalLocation select 0), (_finalLocation select 1),0],[], 0, "NONE"];
_building3 setVectorUp surfaceNormal position _building3;
_building3 setDir (random 360);
[_building3] call DZMSProtectObj;


_smugglerTarget = createMarker ["_smugglerTarget",_finalLocation];
_smugglerTarget setMarkerType "waypoint";
_smugglerTarget setMarkerAlpha 0;
_smugglerTarget setMarkerColor "ColorBlack";
_smugglerTarget = _smugglerTarget;


// Track unit
_tracker = createMarker ["_tracker", (getPos _unit)];
_tracker setMarkerType "waypoint";
_tracker setMarkerAlpha 0;
_tracker setMarkerColor "ColorBlack";
//_tracker setMarkerSize [175,175];
_tracker = _tracker;
	
	
// Bomb vest for people running him over
_bomberRoll = random 1;
_bomberChance =  0.80;

_success = false;
_loop2 = true;


if(_bomberRoll < _bomberChance) then {
	_unit spawn {

			private["_vehicle_near","_bomb"];
			waitUntil
			{
				_vehicle_near = false;
				{
					if((isPlayer _x) && (vehicle _x != _x) && (vehicle _x distance _this < 8) || !(alive _this)) then {
						_vehicle_near = true
					};
				} count playableUnits;
				(_vehicle_near)
			};
			if((alive _this)) then {
			    _bomb = "Bo_GBU12_lgb" createVehicle (getPosATL _this);
			    sleep 3;
			    deleteVehicle _bomb;
			    removeAllWeapons _this;
			    removeAllItems _this;
			};
			//_loop = false;
		};
};


_wp = _unitGroup addWaypoint [_finalLocation, _wpRadius];
_wp setWaypointType "MOVE";
_wp setWaypointBehaviour "AWARE";
_wp_pos = waypointPosition [_unitGroup,1];


_GemSmugglerTimer = 0;
_GemSmugglerMaxTime = 30;

while {_loop2} do {

	[60,20] call DZMSSleep;
	
	if (!(getMarkerColor "_tracker" == "")) then {
		deleteMarker _tracker;
		_tracker = createMarker ["_tracker", (getPos _unit)];
		_tracker setMarkerType "waypoint";
		_tracker setMarkerAlpha 0;
		_tracker setMarkerColor "ColorBlack";
		_tracker = _tracker;
	};
	if(!(alive _unit)) then {
		_success = true;
		_loop2 = false;
		diag_log text format["[DZMS]: Gem Smuggler Killed."];
	};
	if((_unit distance _wp_pos) <= 20) then {
		_success = false;
		_loop2 = false;
		diag_log text format["[DZMS]: Gem Smuggler 20m to bunker."];
	};
	if (_GemSmugglerTimer > _GemSmugglerMaxTime) then {
		_success = false;
		_loop2 = false;
		diag_log text format["[DZMS]: Gem Smuggler Despawn Timer over."];
	};
	_GemSmugglerTimer = _GemSmugglerTimer + 1;
};

if(_success) then {
		// Send message to users
		_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>Gem Smuggler</t><br/><t align='center' color='#ffffff'>The Gem Smuggler has been captured! Players are taking the gems now!</t>"];
		customRemoteMessage = ['hint', _hint];
		publicVariable "customRemoteMessage";
		
		diag_log text format["[DZMS]: Gem Smuggler Did not make it."];

} else {
		// Send message to users
		_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>Gem Smuggler</t><br/><t align='center' color='#ffffff'>The Smuggler has completed his mission! Untouched!</t>"];
		customRemoteMessage = ['hint', _hint];
		publicVariable "customRemoteMessage";
		_unit call DZMSPurgeObject;
		
		diag_log text format["[DZMS]: Gem Smuggler Made it."];
};

[50,5] call DZMSSleep;

//diag_log text format["[DZMS]: Minor Smuggler mission has ended."];
deleteMarker "DZMSMinMarker";
deleteMarker "DZMSMinDot";
deleteMarker "_smugglerTarget";
deleteMarker _tracker;

//delete the bunker
_building3 call DZMSPurgeObject;

DZMSMinDone = true;




//diag_log text format ["[DZMS]: Spawned %1 AI at %2",_unitcount,_position];

// load the unit groups into a passed array name so they can be cleaned up later
call compile format["
%1 = %1 + (units _unitGroup); 
_unitMissionCount = count %1;
",_unitArrayName];

diag_log text format["[DZMS]: (%3) %1 AI Spawned, %2 units in mission.",count (units _unitGroup),_unitMissionCount,_unitArrayName];