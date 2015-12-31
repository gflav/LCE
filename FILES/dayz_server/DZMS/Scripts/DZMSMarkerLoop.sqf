/*
	Marker Resetter by Vampire
	Marker Resetter checks if a Mission is running and resets the marker for JIPs
*/
private["_run","_nul","_nil","_calledTriggered3","_calledTriggered2","_calledTriggered","_zeroTriggeredMission","_zero8main","_zero8dot","_zip","_calledTriggered8Step1","_calledTriggered8Step2","_calledTriggered8Step3"];

diag_log text format ["[DZMS]: Mission Marker Loop for JIPs Starting!"];

//Lets define these
if (isNil "DZMSMajCoords")then{DZMSMajCoords = [0,0,0];};
if (isNil "DZMSMinCoords")then{DZMSMinCoords = [0,0,0];};

//Lets start the timer
_run = true;
_calledTriggered = false;
_calledTriggered2 = false;
_calledTriggered3 = false;
_calledTriggered4 = false;
_zeroTriggeredMission = "Zero_triggered_4";


_ZeroSteps = false;
_calledTriggered8Step1 = false;
_calledTriggered8Step2 = false;
_calledTriggered8Step3 = false;
_calledtriggered8step4 = false;
_calledtriggered8step5 = false;
_calledTriggered8Step6 = false;

while {_run} do
{
    [35,5] call DZMSSleep; // sleep 25 seconds
	//If the marker exists (meaning the mission is active) lets delete it and re-add it
	if (!(getMarkerColor "DZMSMajMarker" == "")) then {
		deleteMarker "DZMSMajMarker";
		deleteMarker "DZMSMajDot";
		//Re-Add the markers
		_nul = createMarker ["DZMSMajMarker", DZMSMajCoords];
		"DZMSMajMarker" setMarkerColor "ColorRed";
		"DZMSMajMarker" setMarkerShape "ELLIPSE";
		"DZMSMajMarker" setMarkerBrush "Grid";
		"DZMSMajMarker" setMarkerSize [175,175];
		_zap = createMarker ["DZMSMajDot", DZMSMajCoords];
		"DZMSMajDot" setMarkerColor "ColorBlack";
		"DZMSMajDot" setMarkerType "Vehicle";
		"DZMSMajDot" setMarkerText DZMSMajName;
	};
	//Lets do the same for the minor mission
	if (!(getMarkerColor "DZMSMinMarker" == "")) then {
		deleteMarker "DZMSMinMarker";
		deleteMarker "DZMSMinDot";
		//Re-Add the markers
		_nil = createMarker ["DZMSMinMarker", DZMSMinCoords];
		"DZMSMinMarker" setMarkerColor "ColorBlue";
		"DZMSMinMarker" setMarkerShape "ELLIPSE";
		"DZMSMinMarker" setMarkerBrush "Grid";
		"DZMSMinMarker" setMarkerSize [150,150];
		_zip = createMarker ["DZMSMinDot", DZMSMinCoords];
		"DZMSMinDot" setMarkerColor "ColorBlack";
		"DZMSMinDot" setMarkerType "Vehicle";
		"DZMSMinDot" setMarkerText DZMSMinName;
	};
	
	
	//
	// Check for trigger then spawn nasty AI
	// 
	if(ZEROVersion != 8) then {
		if(ZEROMarkerState=="triggered" && !_calledTriggered) then{
			if(ZEROVersion == 4) then{
				_zeroTriggeredMission = "Zero_triggered_4";
				[] execVM format ["\z\addons\dayz_server\DZMS\Missions\Major\%1.sqf",_zeroTriggeredMission];
				// ZEROMarkerState
				//diag_log text format ["[DZMS]: ZEROMarkerState is: %1.",ZEROMarkerState];
				_calledTriggered = true;
			};
			
		};
		if(ZEROMarkerState=="looted" && !_calledTriggered2) then{
			if(ZEROVersion == 5) then{
				_zeroTriggeredMission = "Zero_triggered_5";
				[] execVM format ["\z\addons\dayz_server\DZMS\Missions\Major\%1.sqf",_zeroTriggeredMission];
				_calledTriggered2 = true;
			};
			if(ZEROVersion == 2) then{
				_zeroTrader = "DZMSCreateTrader";
				[] execVM format ["\z\addons\dayz_server\DZMS\Scripts\%1.sqf",_zeroTrader];
				diag_log text format ["[DZMS]: Create trader at Zero 2 is: %1.",ZEROMarkerState];
				_calledTriggered = true;
			};
			
		};
		if(ZEROMarkerState=="spawned" && !_calledTriggered3) then{
			if(ZEROVersion == 2) then{
				_zeroTriggeredMission = "Zero_triggered_2";
				[] execVM format ["\z\addons\dayz_server\DZMS\Missions\Major\%1.sqf",_zeroTriggeredMission];
				_calledTriggered3 = true;
			};
			if(ZEROVersion == 6) then{
				_zeroTriggeredMission = "Zero_triggered_6";
				[] execVM format ["\z\addons\dayz_server\DZMS\Missions\Major\%1.sqf",_zeroTriggeredMission];
				_calledTriggered3 = true;
			};
			if(ZEROVersion == 7) then{
				_zeroTriggeredMission = "Zero_triggered_7";
				[] execVM format ["\z\addons\dayz_server\DZMS\Missions\Major\%1.sqf",_zeroTriggeredMission];
				_calledTriggered3 = true;
			};
		};
	} else {
		
		//diag_log text format ["[DZMS LOOP]: ZERO 8 Loop is: %1.",ZERO8Step];
				
		if(ZEROMarkerState=="triggered" && !_ZeroSteps) then{
		
			//diag_log text format ["[DZMS LOOP]: ZERO 8 Inner Loop"];
		
			if (!(getMarkerColor "DZMSZero8Marker" == "")) then {
				deleteMarker "DZMSZero8Marker";
				deleteMarker "DZMSZero8Dot";
				//Re-Add the markers
				_zero8main = createMarker ["DZMSZero8Marker", DZMSZero8Coords];
				"DZMSZero8Marker" setMarkerColor "ColorOrange";
				"DZMSZero8Marker" setMarkerShape "ELLIPSE";
				"DZMSZero8Marker" setMarkerBrush "Grid";
				"DZMSZero8Marker" setMarkerSize [150,150];
				_zero8dot = createMarker ["DZMSZero8Dot", DZMSZero8Coords];
				"DZMSZero8Dot" setMarkerColor "ColorBlack";
				"DZMSZero8Dot" setMarkerType "Vehicle";
				"DZMSZero8Dot" setMarkerText DZMSZero8Name;
			};
			
			if(ZERO8Step == 1 && !_calledTriggered8Step1) then{
				_zeroTriggeredMission = "Zero_triggered_8Step1";
				[] execVM format ["\z\addons\dayz_server\DZMS\Missions\Major\%1.sqf",_zeroTriggeredMission];
				_calledTriggered8Step1 = true;
			};
			if(ZERO8Step == 2 && !_calledTriggered8Step2) then{
				_zeroTriggeredMission = "Zero_triggered_8Step2";
				[] execVM format ["\z\addons\dayz_server\DZMS\Missions\Major\%1.sqf",_zeroTriggeredMission];
				_calledTriggered8Step2 = true;
			};
			if(ZERO8Step == 3 && !_calledTriggered8Step3) then{
				_zeroTriggeredMission = "Zero_triggered_8Step3";
				[] execVM format ["\z\addons\dayz_server\DZMS\Missions\Major\%1.sqf",_zeroTriggeredMission];
				_calledTriggered8Step3 = true;
			};
			if(ZERO8Step == 4 && !_calledTriggered8Step4) then{
				_zeroTriggeredMission = "Zero_triggered_8Step4";
				[] execVM format ["\z\addons\dayz_server\DZMS\Missions\Major\%1.sqf",_zeroTriggeredMission];
				_calledTriggered8Step4 = true;
			};
			if(ZERO8Step == 5 && !_calledTriggered8Step5) then{
				_zeroTriggeredMission = "Zero_triggered_8Step5";
				[] execVM format ["\z\addons\dayz_server\DZMS\Missions\Major\%1.sqf",_zeroTriggeredMission];
				_calledTriggered8Step5 = true;
			};
			if(ZERO8Step == 6 && !_calledTriggered8Step6) then{
				_calledTriggered8Step6 = true;
				_ZeroSteps = true;
				ZERO8Spawn = true;
				_zeroTriggeredMission = "Zero_triggered_8";
				[] execVM format ["\z\addons\dayz_server\DZMS\Missions\Major\%1.sqf",_zeroTriggeredMission];
			};
		};
		
		
	};
	
	
};