/*	
	For DayZ Epoch
	Addons Credits: Jetski Yanahui by Kol9yN, Zakat, Gerasimow9, YuraPetrov, zGuba, A.Karagod, IceBreakr, Sahbazz
*/
startLoadingScreen ["","RscDisplayLoadCustom"];
cutText ["","BLACK OUT"];
enableSaving [false, false];

//REALLY IMPORTANT VALUES
dayZ_instance =	11;					//The instance
dayzHiveRequest = [];
initialized = false;
dayz_previousID = 0;

//disable greeting menu 
player setVariable ["BIS_noCoreConversations", true];
//disable radio messages to be heard and shown in the left lower corner of the screen
enableRadio true;
// May prevent "how are you civillian?" messages from NPC
enableSentences false;

// DayZ Epoch config
spawnShoremode = 0; // Default = 1 (on shore)
spawnArea= 1500; // Default = 1500

setViewDistance 2200;

/*
DefaultMagazines = ["ItemBandage","ItemBandage","ItemMorphine","ItemBandage"];
DefaultWeapons = ["ItemToolbox","ItemFlashlight","ItemMap"];
DefaultBackpack = "DZ_Patrol_Pack_EP1";
DefaultBackpackWeapon = "";
*/

MaxVehicleLimit = 5; // Default = 50
MaxDynamicDebris = 0; // Default = 100
MaxMineVeins = 2;

dayz_MapArea = 14000; // Default = 10000

dayz_minpos = -1; 
dayz_maxpos = 16000;
dayz_spawnselection = 0;
dayz_paraSpawn = false;
//DZE_HaloJump = true;
DZE_AllowCargoCheck = false;
DZE_ForceNameTagsInTrader = true;
DZE_BackpackGuard = false;
DZE_DeathMsgGlobal = true;
DZE_DeathMsgTitleText = false;
DZE_LootSpawnTimer = 1;
DZE_MissionLootTable = true;
DZE_PlayerZed = false;
DZE_PlotPole = [30,30];
DZE_DamageBeforeMaint = 0.09;
DZE_StaticConstructionCount = 2;
DZE_ConfigTrader = false;
DZE_R3F_WEIGHT = false;
DZE_GodModeBase = false;
DZE_ForceNameTagsOff = false;
DZE_ForceNameTags = true;
DZE_HumanityTargetDistance = 20;
DZE_requireplot = 1;
DZE_HeliLift = false;
DZE_BuildingLimit = 500;
DZE_selfTransfuse = true;
DZE_selfTransfuse_Values = [12000, 0, 20];
//dayz_maxLocalZombies = 6;
//dayz_maxZeds = 100;
dayz_fullMoonNights = true;
dayz_sellDistance_vehicle = 50;
dayz_sellDistance_boat = 30;
dayz_sellDistance_air = 60;

dayz_maxAnimals = 6; // Default: 8
dayz_tameDogs = false;
DynamicVehicleDamageLow = 0; // Default: 0
DynamicVehicleDamageHigh = 100; // Default: 100

DZE_BuildOnRoads = false; // Default: False
DZE_noRotate = []; //Objects that cannot be rotated. Ex: DZE_noRotate = ["ItemVault"] (NOTE: The objects magazine classname)
DZE_vectorDegrees = [0.01, 0.1, 1, 5, 15, 45, 90];
DZE_curDegree = 45; //Starting rotation angle. //Prefered any value in array above
DZE_dirWithDegrees = true; //When rotating objects with Q&E, use the custom degrees

EpochEvents = [
    ["any","any","any","any",15,"bombs"],
	["any","any","any","any",45,"weedfield"],
	["any","any","any","any",45,"buildingsupplies"],
    ["any","any","any","any",50,"Treasure"]
];

dayz_fullMoonNights = true;

//Load in compiled functions
//call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\variables.sqf";
call compile preprocessFileLineNumbers "custom\variables.sqf";
progressLoadingScreen 0.1;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\publicEH.sqf";				//Initilize the publicVariable event handlers
progressLoadingScreen 0.2;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\medical\setup_functions_med.sqf";	//Functions used by CLIENT for medical
progressLoadingScreen 0.4;
call compile preprocessFileLineNumbers "\z\addons\dayz_code\init\compiles.sqf";				//Compile regular functions
call compile preprocessFileLineNumbers "custom\compiles.sqf";
call compile preprocessFileLineNumbers "addons\bike\init.sqf";
progressLoadingScreen 0.5;
call compile preprocessFileLineNumbers "server_traders.sqf";				//Compile trader configs
progressLoadingScreen 1.0;

"filmic" setToneMappingParams [0.153, 0.357, 0.231, 0.1573, 0.011, 3.750, 6, 4]; setToneMapping "Filmic";

if (isServer) then {
	call compile preprocessFileLineNumbers "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\dynamic_vehicle.sqf";
	//Compile vehicle configs
	
	// Add trader citys
	_nil = [] execVM "\z\addons\dayz_server\missions\DayZ_Epoch_11.Chernarus\mission.sqf";
	_serverMonitor = [] execVM "\z\addons\dayz_code\system\server_monitor.sqf";
};

if (!isDedicated) then {
	[] execVM "custom\remote_messages.sqf";
	[] execVM "service_point\service_point.sqf";
	
	//Conduct map operations
	0 fadeSound 0;
	waitUntil {!isNil "dayz_loadScreenMsg"};
	dayz_loadScreenMsg = (localize "STR_AUTHENTICATING");
	
	//Run the player monitor
	_id = player addEventHandler ["Respawn", {_id = [] spawn player_death;}];
	_playerMonitor = 	[] execVM "\z\addons\dayz_code\system\player_monitor.sqf";
	
	// Spawn menu
	execVM "spawn\start.sqf";

	//Lights
	//[false,12] execVM "\z\addons\dayz_code\compile\local_lights_init.sqf";
	
	// InfiSTAR SafeZone
	[] execVM 'custom\SafeZones.sqf';\
	
	// traveling trader marker
	[] execVM "player_tradermarkers.sqf";
	
	//_nul = ["DZAI_clientRadio"] execVM "DZAI_Client\dzai_initclient.sqf";
};

[] execVM "customMarkers.sqf";

if (isServer) then {
	call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\messiah_trader.sqf";
	call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\harbinger_trader.sqf";
	call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\balota.sqf";
	call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\North_Cave.sqf";
	call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\NEAF_LCE.sqf";
	call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\blackForestOutpost.sqf";
	call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\racetrack.sqf";
	//call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\Prud_Cave.sqf";
	//call compile preProcessFileLineNumbers "z\addons\dayz_server\AddedBuildings\NWAF_LCE.sqf";
};

//Start Dynamic Weather
execVM "\z\addons\dayz_code\external\DynamicWeatherEffects.sqf";
#include "\z\addons\dayz_code\system\BIS_Effects\init.sqf"

// added for testing godmode vehicles 
//[] execVM 'custom\agn_safezone.sqf';

// Lift
_logistic = execVM "=BTC=_Logistic\=BTC=_Logistic_Init.sqf";

// Teargas, just green smoke
// _null = [] execVM "custom\teargas.sqf";


