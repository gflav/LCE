private["_trigger","_triggerList","_bombRoll","_bombChance","_smoke","_playerAtCrate","_marker","_pos"];

_bombRoll = random 1;
_bombChance = 0.95;
_pos = ZEROCratePosition;

// Send message to users
_hint = parseText format["<t align='center' color='#ffc000' shadow='2' size='1.55'>ZERO "+str(ZeroVersion)+" - LOOTED</t><br/><t align='center' color='#ffffff'>The Zero crate has been looted! But can they escape with it?</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

// Put player into combat mode near crate
// _unit = (nearestObject [getpos player, ZEROCrate]); nearestObject [getpos player, "USOrdnanceBox"]) distance player < 15
// _playerAtCrate = nearestObject [player, "USOrdnanceBox"];
//_unit setVariable["startcombattimer", 1];
// diag_log "***************** <ZERO> looted by %1",(name _playerAtCrate);


if (_bombRoll < _bombChance) then {
	
	[nil,nil,rTitleText,"Zero crate bomb triggered in 20 sec.", "PLAIN DOWN",160] call RE;
	
	[30,4] call ZEROSleep;
	
	diag_log "***************** <ZERO> bomb triggered"; 
	_bomb = createVehicle ["Bo_GBU12_LGB",_pos,[],0,"CAN_COLLIDE"];
	_bomb setPos _pos;
	
};

ZEROMarkerState = "looted";

diag_log "***************** <ZERO> CRATE TRIGGER from ZeroCrateLooted"; 

if(sunOrMoon == 1) then {
    _marker = createVehicle ["smokeShellPurple",_pos,[],0,"CAN_COLLIDE"];
    _marker setPos _pos;
};
if(sunOrMoon != 1) then {
    _marker = createVehicle ["RoadFlare",_pos,[],0,"CAN_COLLIDE"];
	_marker setPos _pos;
};

