if (!isDedicated) then {
    player_build = compile preprocessFileLineNumbers "custom\snap_pro\player_build.sqf";
    snap_build = compile preprocessFileLineNumbers "custom\snap_pro\snap_build.sqf";
    dayz_spaceInterrupt = compile preprocessFileLineNumbers "custom\snap_pro\dayz_spaceInterrupt.sqf";

    fnc_usec_selfActions =          compile preprocessFileLineNumbers "custom\fn_selfActions.sqf";      
    player_unlockVault =            compile preprocessFileLineNumbers "custom\BuildVectors\compile\player_unlockVault.sqf";
    player_lockVault =          compile preprocessFileLineNumbers "custom\BuildVectors\compile\player_lockVault.sqf";
    fnc_SetPitchBankYaw =       compile preprocessFileLineNumbers "custom\BuildVectors\fnc_SetPitchBankYaw.sqf";
    DZE_build_vector_file =         "custom\BuildVectors\build_vectors.sqf";
    build_vectors =                 compile preprocessFileLineNumbers DZE_build_vector_file;
	player_switchModel = compile preprocessFileLineNumbers "custom\player_switchModel.sqf";
	
};

// player_selectSlot = compile preprocessFileLineNumbers "custom\ui_selectSlot.sqf"; // Right click menus
vehicle_handleDamage = compile preprocessFileLineNumbers "custom\vehicle_handleDamage.sqf"; // Making locked vehicles indestructable near plot poles
local_lockUnlock = compile preprocessFileLineNumbers "custom\local_lockUnlock.sqf";	// When vehicle is local to unit perform locking vehicle
fnc_usec_selfActions = compile preprocessFileLineNumbers "custom\fn_selfActions.sqf";

// Death Board Fixed
player_murderMenu = compile preprocessFileLineNumbers "custom\player_murderMenu.sqf";
