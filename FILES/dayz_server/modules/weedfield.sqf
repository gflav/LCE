private ["_spawnChance", "_spawnMarker", "_spawnRadius", "_markerRadius", "_item", "_debug", "_start_time", "_loot", "_loot_amount", "_loot_box", "_wait_time", "_spawnRoll", "_position", "_event_marker", "_loot_pos", "_debug_marker","_loot_box", "_hint"];

_spawnChance =  0.30; // Percentage chance of event happening
_markerRadius = 300; // Radius the loot can spawn and used for the marker
_debug = false; // Puts a marker exactly were the loot spawns

_wait_time = 800; 

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
_event_marker setMarkerColor "ColorGreen";
_event_marker setMarkerBrush "Grid";
_event_marker setMarkerAlpha 0.9;
_event_marker setMarkerSize [(_markerRadius + 50), (_markerRadius + 50)];

_loot_pos = [_position,0,(_markerRadius - 100),10,0,2000,0] call BIS_fnc_findSafePos;

if (_debug) then {
	_debug_marker = createMarker [ format ["loot_event_debug_marker_%1", _start_time], _loot_pos];
	_debug_marker setMarkerType "Join";
	_debug_marker setMarkerColor "ColorGreen";
	_debug_marker setMarkerAlpha 1;
};

diag_log(format["Creating ammo box at %1", _loot_pos]);

_buildPlant = random 10;
_offset = 120;

for "_i" from 0 to _buildPlant do {

    _distance1 = random _offset;
    _distance2 = random _offset;

    _plant = createVehicle ["Fiberplant", [(_loot_pos select 0)+_distance1,(_loot_pos select 1)+_distance2, 0], [], 0, "CAN_COLLIDE"];
    _plant setPos [(_loot_pos select 0)+_distance1,(_loot_pos select 1)+_distance2, 0];
    _uID = str(round(random 999999));
    _plant setVariable ["ObjectID", _uID, true];
    _plant setVariable ["ObjectUID", _uID, true];
    _plant setVariable ["lastUpdate",time,true];

};

// Send message to users
_hint = parseText format["<t align='center' color='#52bf90' shadow='2' size='1.55'>Hemp Field</t><br/><t align='center' color='#ffffff'>A hemp field has been marked on the map! Grab a machete and start farming.</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

diag_log(format["Loot event setup, waiting for %1 seconds", _wait_time]);

// Wait
sleep _wait_time;

// Clean up
// deleteVehicle _loot_box;
deleteMarker _event_marker;
if (_debug) then {
	deleteMarker _debug_marker;
};