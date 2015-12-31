private["_smoke","_pos","_posZero","_hint"];

// Send message to users
_hint = parseText format["<t align='center' color='#ffc000' shadow='2' size='1.55'>ZERO "+str(ZeroVersion)+" Started</t><br/><t align='center' color='#ffffff'>Players have triggered Zero 8! Capture all the outposts to spawn the loot crate!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

ZERO8Step = 1;
ZEROMarkerState = "triggered";

while {!ZERO8Spawn} do
{
    [35,5] call DZMSSleep; // sleep 25 seconds
};

diag_log("****************************** < ZERO 8 > crate is Spawned " );

ZEROMarkerState = "end";

// DEBUG TIME
if(ZERODebug) then {
	[25,5] call ZEROSleep;
} else{
	[180,5] call ZEROSleep; // 3min
};

_hint = parseText format["<t align='center' color='#ffc000' shadow='2' size='1.55'>ZERO "+str(ZeroVersion)+" - Spawned</t><br/><t align='center' color='#ffffff'>The outposts have been captured! The Zero 8 loot crate has spawned!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

[] call ZeroTriggerLoot;

if(ZERODebug) then {
	_debugMarker = createMarker ["_debugMarker",ZEROcratePosition];
	_debugMarker setMarkerColor "ColorBlack";
	_debugMarker setMarkerType "waypoint";
	_debugMarker = _debugMarker;
};

diag_log("****************************** DEBUG: ZERO 8 crate spawned here " + str(ZEROCratePosition));



