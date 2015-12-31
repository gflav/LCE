private["_smoke","_pos","_posZero","_hint"];



ZEROMarkerState = "triggered";

// Send message to users
_hint = parseText format["<t align='center' color='#ffc000' shadow='2' size='1.55'>ZERO "+str(ZeroVersion)+" - 30 Min</t><br/><t align='center' color='#ffffff'>Zero players triggered the crate! The loot crate will spawn in 30 minutes!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


diag_log("****************************** <ZERO> crate is triggered " );


// DEBUG TIME
if(ZERODebug) then {
	[25,5] call ZEROSleep;
} else{
	[900,5] call ZEROSleep;
};



_hint = parseText format["<t align='center' color='#ffc000' shadow='2' size='1.55'>ZERO "+str(ZeroVersion)+" - 15 Min</t><br/><t align='center' color='#ffffff'>The Zero loot crate will spawn in 15 minutes! Who will get the crate?</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";



ZEROMarkerState = "halfway";



// DEBUG TIME
if(ZERODebug) then {
	[25,5] call ZEROSleep;
} else{
	[450,5] call ZEROSleep;
};



_hint = parseText format["<t align='center' color='#ffc000' shadow='2' size='1.55'>ZERO "+str(ZeroVersion)+" - 7 Min</t><br/><t align='center' color='#ffffff'>The Zero loot crate will spawn in 7 minutes! Get there fast!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";



ZEROMarkerState = "end";



// DEBUG TIME
if(ZERODebug) then {
	[25,5] call ZEROSleep;
} else{
	[450,5] call ZEROSleep;
};



_hint = parseText format["<t align='center' color='#ffc000' shadow='2' size='1.55'>ZERO "+str(ZeroVersion)+" - Spawned</t><br/><t align='center' color='#ffffff'>The Zero loot crate has spawned in one of the surrounding buildings!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";



[] call ZeroTriggerLoot;


if(ZERODebug) then {
	_debugMarker = createMarker ["_debugMarker",ZEROcratePosition];
	_debugMarker setMarkerColor "ColorBlack";
	_debugMarker setMarkerType "waypoint";
	_debugMarker = _debugMarker;
};



diag_log("****************************** DEBUG: ZERO4 crate spawned here " + str(ZEROCratePosition));



