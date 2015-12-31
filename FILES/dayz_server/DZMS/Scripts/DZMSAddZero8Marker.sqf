/*
	Adds a marker for Major Missions. Only runs once.
	DZMSMarkerLoop.sqf keeps this marker updated.
	Usage: [coordinates,missionname]
*/
private["_nul","_nil"];
DZMSZero8Coords = _this select 0;
DZMSZero8Name = _this select 1;

_nul = createMarker ["DZMSZero8Marker", DZMSZero8Coords];
"DZMSZero8Marker" setMarkerColor "ColorOrange";
"DZMSZero8Marker" setMarkerShape "ELLIPSE";
"DZMSZero8Marker" setMarkerBrush "Grid";
"DZMSZero8Marker" setMarkerSize [175,175];
_nil = createMarker ["DZMSZero8Dot", DZMSZero8Coords];
"DZMSZero8Dot" setMarkerColor "ColorBlack";
"DZMSZero8Dot" setMarkerType "Vehicle";
"DZMSZero8Dot" setMarkerText DZMSZero8Name;