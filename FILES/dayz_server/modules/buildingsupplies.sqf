private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];

_spawnChance =  0.15; // Percentage chance of event happening
_markerRadius = 500; // Radius the loot can spawn and used for the marker
_debug = false; // Puts a marker exactly were the loot spawns

_loot_box = "RUBasicWeaponsBox";
_loot_lists = [
					[
						[], 
						["MortarBucket","MortarBucket","MortarBucket","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","CinderBlocks","ItemComboLock"]
					],
					[
						[],	
						["ItemComboLock","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlankPack","PartPlankPack","PartPlankPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlankPack","PartPlankPack","PartPlankPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack"]
					],
					[
						[],
						["PartPlankPack","PartPlankPack","sandbag_nest_kit","metal_floor_kit","ItemTankTrap","ItemTankTrap","ItemTankTrap","ItemTankTrap","PartPlankPack","PartPlankPack","PartPlankPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlankPack","PartPlankPack","PartPlankPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlankPack","PartPlankPack","PartPlankPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlankPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlankPack","PartPlankPack","PartPlankPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlankPack","PartPlankPack","PartPlankPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack"]
					],
					[
						[],
						["ItemWoodWallGarageDoor","sandbag_nest_kit","ItemWoodWall","ItemWoodWall","ItemTankTrap","ItemTankTrap","ItemTankTrap","ItemTankTrap","ItemTankTrap","ItemWoodWall","ItemWoodWall","ItemWoodLadder","ItemWoodFloor","ItemWoodFloor","PartPlankPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlankPack","PartPlankPack","PartPlankPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlywoodPack","PartPlankPack","PartPlankPack","PartPlankPack"]
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

// Random location
_position = [getMarkerPos _spawnMarker,0,_spawnRadius,10,0,2000,0] call BIS_fnc_findSafePos;

diag_log(format["Spawning loot event at %1", _position]);

_event_marker = createMarker [ format ["loot_event_marker_%1", _start_time], _position];
_event_marker setMarkerShape "ELLIPSE";
_event_marker setMarkerColor "ColorGreen";
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
_hint = parseText format["<t align='center' color='#52bf90' shadow='2' size='1.55'>BUILDING CRATE</t><br/><t align='center' color='#ffffff'>Undead trolled stary and stole a crate of buildings supplies! You have 30 minutes to grab the loot!</t>"];
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