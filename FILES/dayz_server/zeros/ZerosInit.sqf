private['_ZeroRoll'];

_ZeroRoll = round(random 100);

ZEROVersion = 4;
ZERO8Spawn = false;
ZERO8Step = 0;


if (_ZeroRoll <= 16) then {
	call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\Zero2.sqf";
	diag_log("***************** <ZEROS> ZERO 2 Rolled");
	ZEROVersion = 2;
};
if (_ZeroRoll >= 17 && _ZeroRoll <= 33) then {
	call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\Zero5.sqf";
	diag_log("***************** <ZEROS> ZERO 5 Rolled");
	ZEROVersion = 5;
};
if (_ZeroRoll >= 34 && _ZeroRoll <= 50) then {
	call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\Zero6.sqf";
	diag_log("***************** <ZEROS> ZERO 6 Rolled");
	ZEROVersion = 6;
};
if (_ZeroRoll >= 51 && _ZeroRoll <= 67) then {
	call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\Zero7.sqf";
	diag_log("***************** <ZEROS> ZERO 7 Rolled");
	ZEROVersion = 7;
};
if (_ZeroRoll >= 68 && _ZeroRoll <= 84) then {
	call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\Zero4.sqf";
	diag_log("***************** <ZEROS> ZERO 4 Rolled");
	ZEROVersion = 4;
};
if (_ZeroRoll >= 85 && _ZeroRoll <= 100) then {
	call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\Zero8.sqf";
	ZEROVersion = 8;
	diag_log("***************** <ZEROS> ZERO 8 Rolled");
};

/* force a certain zero
call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\Zero8.sqf";
ZEROVersion = 8;
*/


waitUntil{initialized};

// Lets let the heavier scripts run first
sleep 60;

// vars
call compile preprocessFileLineNumbers "\z\addons\dayz_server\Zeros\ZerosConfig.sqf";

// functions
call compile preprocessFileLineNumbers "\z\addons\dayz_server\Zeros\ZerosFunctions.sqf";

// Start the marker loop
[] ExecVM ZerosMarkerLoop;

// Create the Misson Trigger
[] call ZeroTriggerMain;

