if (isServer) then {
    waituntil {!isnil "bis_fnc_init"};
    LHD1 call BIS_EW_fnc_createLHD;
};