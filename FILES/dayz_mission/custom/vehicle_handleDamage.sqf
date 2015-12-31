private["_selection","_state","_strH","_total","_unit"];
_unit = _this select 0;
_selection = _this select 1;
_total = _this select 2;

_state = false;

if (!isNil 'safezones') then {{if ((_unit distance (_x select 0)) < 120) exitWith {_state = true;};} forEach safezones;};if (_state) exitWith {};
// Plot pole damamge
//if ((locked _unit && (count (crew _unit)) == 0) && (count(nearestObjects [_unit, ["Plastic_Pole_EP1_DZ"],30]) > 0)) exitWith {};
 
 
// diag_log text format ["< VEH DAMAGE HANDLER >: Units in vehicle %1",(count (crew _unit))];
 
if ((locked _unit && (count (crew _unit)) == 0) && (count(nearestObjects [_unit, ["Plastic_Pole_EP1_DZ"],30]) > 0)) exitWith {_state = true;};
if (_state) exitWith {};

// diag_log text format ["< VEH DAMAGE HANDLER >: Vehicle is taking %1",_total];



if (_selection != "") then {_strH = "hit_" + _selection;} else {_strH = "totalDmg";};
if (_total >= 0.98) then {_total = 1.0;};
if (local _unit) then {
    if (_total > 0) then {
        _unit setVariable [_strH, _total, true];
        _unit setHit [_selection, _total];
        if (isServer) then {
            [_unit, "damage"] call server_updateObject;
        } else {
            PVDZE_veh_Update = [_unit,"damage"];
            publicVariableServer "PVDZE_veh_Update";
        };
    };
} else {
    PVDZE_send = [_unit,"VehHandleDam",_this];
    publicVariableServer "PVDZE_send";
};
_total