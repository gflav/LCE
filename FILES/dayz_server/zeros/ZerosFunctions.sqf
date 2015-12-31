diag_log text format ["<Zeros>: ************ Zeros Functions Loaded"];

// Marker loop
ZerosMarkerLoop = "\z\addons\dayz_server\zeros\scripts\ZerosLoop.sqf";

// When crate is looted
ZeroLootTriggered = "\z\addons\dayz_server\zeros\scripts\ZeroCrateLooted.sqf";

// Spawn Box
ZeroCrate = "\z\addons\dayz_server\zeros\scripts\ZerosCrate.sqf";

// Create main trigger
ZeroTriggerMain = {
	private ["_triggerArray", "_posZero1","_trg1"];

	// Crate triggers on flags 
	if (ZEROVersion == 2) then {
		_triggerArray=[[13723.8,2899.58,0]];
	};
	if (ZEROVersion == 4) then {
		_triggerArray=[[8032.5601, 13650.695,0]];
	};
	if (ZEROVersion == 5) then {
		_triggerArray=[[8170.74,13402.8]];
	};
	if (ZEROVersion == 6) then {
		_triggerArray=[[8009.7651,13668.656]];
	};
	if (ZEROVersion == 7) then {
		_triggerArray=[[7869.6211, 13658.634]];
	};
	if (ZEROVersion == 8) then {
		_triggerArray=[[7584.1904, 14155.334]];
	};
    _posZero1= floor random count _triggerArray;
    
    ZEROTriggerPosition = _triggerArray select _posZero1;
	
	
	if(ZEROVersion != 8) then{
		
		diag_log "***************** <ZERO> CRATE MAIN TRIGGER INIT "; 
	
		_trg1 = createTrigger["EmptyDetector",ZEROTriggerPosition];
		_trg1 setTriggerArea[2, 2, 360,false];
		_trg1 setTriggerActivation["WEST","PRESENT",false];
		_trg1 setTriggerStatements["this","ExecVM '\z\addons\dayz_server\zeros\scripts\ZerosMission.sqf'",""];
		_trg1 setTriggerType "SWITCH";
	} else {
		diag_log "***************** <ZERO> CRATE MAIN TRIGGER INIT 8"; 
		_trg1 = createTrigger["EmptyDetector",ZEROTriggerPosition];
		_trg1 setTriggerArea[2, 2, 360,false];
		_trg1 setTriggerActivation["WEST","PRESENT",false];
		_trg1 setTriggerStatements["this","ExecVM '\z\addons\dayz_server\zeros\scripts\ZerosMission8.sqf'",""];
		_trg1 setTriggerType "SWITCH";
	};
	
	
};

// Create loot trigger
ZeroTriggerLoot = {
	private ["_trgLoot"];
		
	diag_log "***************** <ZERO> CRATE LOOTED "; 
	
	_trgLoot = createTrigger["EmptyDetector", ZEROcratePosition];
    _trgLoot setTriggerArea[4, 4, 360,false];
    _trgLoot setTriggerActivation["WEST","PRESENT",false];
    _trgLoot setTriggerStatements["this","[thisTrigger,thisList] execVM '\z\addons\dayz_server\zeros\scripts\ZerosCrateLooted.sqf'",""];
    _trgLoot setTriggerType "SWITCH";
	
	[] execVM ZeroCrate;
};


// Timer function 
// sleep function that uses diag_tickTime for accuracy
ZEROSleep = {
    private["_sleepTime","_checkInterval","_startTime"];
	
    _sleepTime = _this select 0;
    _checkInterval = _this select 1;
	
    _startTime = diag_tickTime;
    waitUntil{sleep _checkInterval; (diag_tickTime - _startTime) > _sleepTime;};
};
