private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_positionarray", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint", "_baserunover", "_baserunover1", "_baserunover2", "_baserunover3","_baserunover4","_baserunover5","_baserunover6","_baserunover7","_baserunover8","_baserunover9","_baserunover10","_baserunover11","_baserunover12","_baserunover13","_baserunover14","_baserunover15","_baserunover16","_baserunover17","_baserunover18","_baserunover19","_baserunover20"];


_spawnChance =  0.13; // Percentage chance of event happening
_markerRadius = 350; // Radius the loot can spawn and used for the marker
_debug = true; // Puts a marker exactly were the loot spawns


_loot_box = "GuerillaCacheBox";
_loot_lists = [
[
[],
["ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz"]
],
[
[],
["ItemGoldBar10oz","ItemGoldBar10oz","ItemGoldBar10oz"]
],
[
[],
["ItemEmerald","ItemGoldBar10oz"]
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
_event_marker setMarkerColor "ColorYellow";
_event_marker setMarkerAlpha 0.5;
_event_marker setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];


_positionarray = [
[(_position select 0) + 9, (_position select 1) + 2.3,-0.012],
[(_position select 0) - 18.6, (_position select 1) + 15.6,-0.012],
[(_position select 0) - 8.5, (_position select 1) - 21,-0.012],
[(_position select 0) - 33, (_position select 1) - 6,-0.012],
[(_position select 0) + 5, (_position select 1) - 44,-0.012],
[(_position select 0) - 23, (_position select 1) - 20,-0.012],
[(_position select 0) + 13, (_position select 1) - 23,-0.012],
[(_position select 0) + 7, (_position select 1) - 6,-0.012],
[(_position select 0) - 5, (_position select 1) + 1,-0.012],
[(_position select 0) - 42, (_position select 1) - 6,-0.012],
[(_position select 0) - 4.3, (_position select 1) - 39,-0.012]
];
_loot_pos = _positionarray call BIS_fnc_selectRandom;

if (_debug) then {
_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
_debug_marker setMarkerShape "ICON";
_debug_marker setMarkerType "mil_dot";
_debug_marker setMarkerColor "ColorBlack";
_debug_marker setMarkerAlpha 1;
};


diag_log(format["Creating ammo box at %1", _loot_pos]);


// Create ammo box
_loot_box = createVehicle [_loot_box,_loot_pos,[], 0, "NONE"];
clearMagazineCargoGlobal _loot_box;
clearWeaponCargoGlobal _loot_box;


/* Cut the grass around the loot position
_clutter = createVehicle ["ClutterCutter_small_2_EP1", _loot_pos, [], 0, "CAN_COLLIDE"];
_clutter setPos _loot_pos;
*/


// Buildings and Objects
_baserunover = createVehicle ["Land_MBG_Shoothouse_1",[(_position select 0) - 35, (_position select 1) - 6.5,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover setDir 0;
_baserunover setVectorUp surfaceNormal position _baserunover;
_baserunover1 = createVehicle ["Land_MBG_Shoothouse_1", [(_position select 0) - 12, (_position select 1) + 9,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover1 setDir 0;
_baserunover1 setVectorUp surfaceNormal position _baserunover1;
_baserunover2 = createVehicle ["Land_MBG_Shoothouse_1", [(_position select 0) - 16, (_position select 1) - 19.3,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover2 setDir 0;
_baserunover2 setVectorUp surfaceNormal position _baserunover2;
_baserunover3 = createVehicle ["Land_MBG_Shoothouse_1", [(_position select 0) + 7, (_position select 1) - 15,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover3 setDir 0;
_baserunover3 setVectorUp surfaceNormal position _baserunover3;
_baserunover4 = createVehicle ["Land_MBG_Shoothouse_1",[(_position select 0) + 3, (_position select 1) - 39.5,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover4 setDir 0;
_baserunover4 setVectorUp surfaceNormal position _baserunover4;
_baserunover5 = createVehicle ["Land_A_Castle_Bergfrit", [(_position select 0) + 9.5, (_position select 1) + 3,-10.52],[], 0, "CAN_COLLIDE"];
_baserunover5 setDir 0;
_baserunover5 setVectorUp surfaceNormal position _baserunover5;
_baserunover6 = createVehicle ["Land_A_Castle_Donjon_dam", [(_position select 0) + 4, (_position select 1) + 17,-1.93],[], 0, "CAN_COLLIDE"];
_baserunover6 setDir 0;
_baserunover6 setVectorUp surfaceNormal position _baserunover6;
_baserunover7 = createVehicle ["Land_A_Castle_Wall1_20", [(_position select 0) - 11.6, (_position select 1) + 21.7,-7.28],[], 0, "CAN_COLLIDE"];
_baserunover7 setDir 0;
_baserunover7 setVectorUp surfaceNormal position _baserunover7;
_baserunover8 = createVehicle ["Land_A_Castle_Wall1_20", [(_position select 0) - 35.4, (_position select 1) + 6.4,-7.28],[], 0, "CAN_COLLIDE"];
_baserunover8 setDir 0;
_baserunover8 setVectorUp surfaceNormal position _baserunover8;
_baserunover9 = createVehicle ["Land_A_Castle_Donjon", [(_position select 0) + 16, (_position select 1) - 10.3,-1.93],[], 0, "CAN_COLLIDE"];
_baserunover9 setDir 0;
_baserunover9 setVectorUp surfaceNormal position _baserunover9;
_baserunover10 = createVehicle ["Sign_arrow_down_large_EP1", [(_position select 0) + 15, (_position select 1) - 35,+0.52],[], 0, "CAN_COLLIDE"];
_baserunover10 setDir 0;
_baserunover10 setVectorUp surfaceNormal position _baserunover10;
_baserunover11 = createVehicle ["Sign_arrow_down_large_EP1", [(_position select 0) - 8.6, (_position select 1) - 51,+0.52],[], 0, "CAN_COLLIDE"];
_baserunover11 setDir 0;
_baserunover11 setVectorUp surfaceNormal position _baserunover11;
_baserunover12 = createVehicle ["Sign_arrow_down_large_EP1", [(_position select 0) - 27., (_position select 1) - 30.5,+0.52],[], 0, "CAN_COLLIDE"];
_baserunover12 setDir 0;
_baserunover12 setVectorUp surfaceNormal position _baserunover12;
_baserunover13 = createVehicle ["Sign_arrow_down_large_EP1",[(_position select 0) - 46, (_position select 1) - 17.4,+0.52],[], 0, "CAN_COLLIDE"];
_baserunover13 setDir 0;
_baserunover13 setVectorUp surfaceNormal position _baserunover13;
_baserunover14 = createVehicle ["Sign_arrow_down_large_EP1", [(_position select 0) - 22.7, (_position select 1) + 7.7,+0.52],[], 0, "CAN_COLLIDE"];
_baserunover14 setDir 0;
_baserunover14 setVectorUp surfaceNormal position _baserunover14;
_baserunover15 = createVehicle ["MAP_t_acer2s", [(_position select 0) - 8, (_position select 1) - 31,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover15 setDir 0;
_baserunover15 setVectorUp surfaceNormal position _baserunover15;
_baserunover16 = createVehicle ["MAP_t_acer2s", [(_position select 0) - 46.5, (_position select 1) - 15,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover16 setDir 91.4;
_baserunover16 setVectorUp surfaceNormal position _baserunover16;
_baserunover17 = createVehicle ["MAP_t_acer2s", [(_position select 0) - 23, (_position select 1) + 10,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover17 setDir 89.09;
_baserunover17 setVectorUp surfaceNormal position _baserunover17;
_baserunover18 = createVehicle ["MAP_t_acer2s", [(_position select 0) - 27.3, (_position select 1) - 28,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover18 setDir 90.6;
_baserunover18 setVectorUp surfaceNormal position _baserunover18;
_baserunover19 = createVehicle ["MAP_t_acer2s", [(_position select 0) + 14, (_position select 1) - 32,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover19 setDir -88.1;
_baserunover19 setVectorUp surfaceNormal position _baserunover19;
_baserunover20 = createVehicle ["MAP_t_acer2s", [(_position select 0) - 8.5, (_position select 1) - 48,-0.12],[], 0, "CAN_COLLIDE"];
_baserunover20 setDir 86.08;
_baserunover20 setVectorUp surfaceNormal position _baserunover20;


// Add loot
{
_loot_box addWeaponCargoGlobal [_x,1];
} forEach (_loot select 0);
{
_loot_box addMagazineCargoGlobal [_x,1];
} forEach (_loot select 1);


// Send Top Right message to users , requires Remote message script
_hint = parseText format["<t align='center' color='#FF0000' shadow='2' size='1.75'>Maze</t><br/><t align='center' color='#ffffff'>Bandits lost a crate in a maze, get to it first!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


// Send center message to users 
// [nil,nil,rTitleText,"Bandits lost a crate in a maze, get to it first!]", "PLAIN",10] call RE;


diag_log(format["Loot event setup, waiting for %1 seconds", _wait_time]);


// Wait
sleep _wait_time;


// Clean up
EPOCH_EVENT_RUNNING = false;
deleteVehicle _loot_box;
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
deleteVehicle _baserunover19;
deleteVehicle _baserunover20;

deleteMarker _event_marker;
if (_debug) then {
deleteMarker _debug_marker;
};