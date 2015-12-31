/*
	Bandit Supply Heli Crash by lazyink (Full credit for original code to TheSzerdi & TAW_Tonic)
	New Mission Format by Vampire
*/

private ["_missName","_coords","_ranChopper","_chopper","_truck","_trash","_trash2","_crate","_crate2"];

//Name of the Mission
_missName = "Helicopter Landing";

//DZMSFindPos loops BIS_fnc_findSafePos until it gets a valid result
_coords = call DZMSFindPos;

//[nil,nil,rTitleText,"A Supply Helicopter has been Forced to Land!\nStop the Bandits from Taking Control of it!", "PLAIN",10] call RE;


// Send message to users
_hint = parseText format["<t align='center' color='#ff0000' shadow='2' size='1.55'>Helicopter Landing</t><br/><t align='center' color='#ffffff'>A Supply Helicopter has been Forced to Land! Stop the Bandits from Taking Control of it!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";


//DZMSAddMajMarker is a simple script that adds a marker to the location
[_coords,_missname] ExecVM DZMSAddMajMarker;

//We create the vehicles like normal
_ranChopper = ["heli"] call DZMSGetVeh;
_chopper = createVehicle [_ranChopper,_coords,[], 0, "NONE"];
_chopper setVehicleLock "LOCKED";

//DZMSSetupVehicle prevents the vehicle from disappearing and sets fuel and such
[_chopper] call DZMSSetupVehicle;
_chopper setDir -36.279881;


//DZMSAISpawn spawns AI to the mission.
//Usage: [_coords, count, skillLevel, unitArray]
[[(_coords select 0) - 8.4614,(_coords select 1) - 5.0527,0],2,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) - 8.4614,(_coords select 1) - 5.0527,0],2,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 7.5337,(_coords select 1) + 4.2656,0],5,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;
[[(_coords select 0) + 3.5337,(_coords select 1) + 2.2656,0],5,3,"DZMSUnitsMajor"] call DZMSAISpawn;
sleep 5;

//Wait until the player is within 30 meters and also meets the kill req
[_coords,"DZMSUnitsMajor"] call DZMSWaitMissionComp;

_chopper setVehicleLock "UNLOCKED";

//Let everyone know the mission is over
//[nil,nil,rTitleText,"The Helicopter has been Taken by Survivors!", "PLAIN",6] call RE;

// Send message to users
_hint = parseText format["<t align='center' color='#00ff00' shadow='2' size='1.55'>Helicopter Landing</t><br/><t align='center' color='#ffffff'>The Helicopter has been Taken by Survivors!</t>"];
customRemoteMessage = ['hint', _hint];
publicVariable "customRemoteMessage";

diag_log text format["[DZMS]: Major SM4 Helicopter Landing Mission has Ended."];
deleteMarker "DZMSMajMarker";
deleteMarker "DZMSMajDot";

//Let the timer know the mission is over
DZMSMajDone = true;