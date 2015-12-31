/*
put together for DayZ Epoch
Credits to Shogun338 from Insurrection gaming
modified for separate "gather weed" script
*/
 
private ["_gearmenu","_playerPos","_nearWeed","_weed","_objectID","_objectUID"];
_playerPos = getPosATL player;
_hempqty = {_x == "ItemKiloHemp"} count magazines player;
_nearWeed = count nearestObjects [_playerPos, ["fiberplant"], 4] > 0;
_weed = nearestObject [player, "fiberplant"];
 
if !(_nearWeed) exitWith {
	cutText [format["You need to be near the hemp plants in order to gather."], "PLAIN DOWN"];
};
if (_hempqty > 2) exitWith { 
    cutText [format["WARNING: %1, You have maximum amount of weed in your inventory!", name player], "PLAIN DOWN"];
};
if (dayz_combat == 1) then { 
    cutText [format["You are in Combat and Cannot Gather the hemp."], "PLAIN DOWN"];
} else {
	disableSerialization;
	_gearmenu = FindDisplay 106;
	_gearmenu CloseDisplay 106;
	player playActionNow "Medic";
	r_interrupt = false;
	sleep 6;
	_objectID = _weed getVariable["ObjectID","0"];
	_objectUID = _weed getVariable["ObjectUID","0"];
	deleteVehicle _weed;
	[_objectID,_objectUID] call server_deleteObj;
	_weed setDamage 1;
	player addMagazine "ItemKiloHemp";
	sleep 2;
	cutText [format["You've gathered some hemp! Sell it at the Traveling Trader!!"], "PLAIN DOWN"];	
};