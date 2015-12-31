private["_zeroMarker","_run","_alpha"];

diag_log text format ["******************** <ZEROS> Crate Loop Marker Started!"];

_color = "ColorRed";
_zeroLabel = "Zero "+str(ZEROVersion);
_zeroLabelColor = "ColorBlack";
_alpha = 0.2;
_markerPosition = [8002.71,13659];

if(ZEROVersion == 2) then {
	_markerPosition = [13689.493, 2856.5156];
};

if(ZEROVersion == 8) then {
	_markerPosition = [7584.1904, 14155.334];
};

//Lets start the timer
_run = true;
while {_run} do
{

    [30,5] call ZEROSleep; // sleep 25 seconds
	
	deleteMarker "_zeroMarker";
	deleteMarker "_sectorFOB3";
	deleteMarker "_crateMarker";
	

		switch (ZEROMarkerState) do {
			case "started": { 
				_zeroLabel = "Zero "+str(ZEROVersion);
				_color = "ColorRed";
			};
			case "triggered": { 
				if(ZEROVersion !=8) then {
					_zeroLabel = "Zero "+str(ZEROVersion)+" triggered-30min";
				}else{
					_zeroLabel = "Zero "+str(ZEROVersion)+" triggered outposts";
				};
				_color = "ColorGreen";
			};
			case "halfway": { 
				_zeroLabel = "Zero "+str(ZEROVersion)+" triggered-15min";
				_color = "ColorGreen";
			};
			case "end": { 
				if(ZEROVersion !=8) then {
					_zeroLabel = "Zero "+str(ZEROVersion)+" triggered-7min";
				}else{
					_zeroLabel = "Zero "+str(ZEROVersion)+" loot crate-3min";
				};
				_color = "ColorGreen";
			};
			case "spawned": { 
				_zeroLabel = "Zero "+str(ZEROVersion)+" Spawned";
				_color = "ColorGreen";
			};
			case "looted": { 
				_zeroLabel = "Zero "+str(ZEROVersion)+" Looted";
				_color = "ColorBlack";
				_alpha = 0;
				//_run = false;
			};
			default {
				_zeroLabel = "Zero "+str(ZEROVersion);
				_color = "ColorOrange";
				_alpha = 0;
			};
		};

	
	_zeroMarker = createMarker ["_zeroMarker",_markerPosition];
	_zeroMarker setMarkerSize [650,650];
	_zeroMarker setMarkerShape "ELLIPSE";
	_zeroMarker setMarkerAlpha _alpha;
	_zeroMarker setMarkerColor _color;
	_zeroMarker = _zeroMarker;
	
	// Zero Marker
	_sectorFOB3  = createMarker ["_sectorFOB3", _markerPosition];
	_sectorFOB3  setMarkerType "FOB";
	_sectorFOB3  setMarkerText _zeroLabel;
	_sectorFOB3  setMarkerColor _zeroLabelColor;
	_sectorFOB3  = _sectorFOB3;
	
	//diag_log text format ["******************** <ZEROS> inside loop, crate state = " + str(ZEROMarkerState)];
	
};

