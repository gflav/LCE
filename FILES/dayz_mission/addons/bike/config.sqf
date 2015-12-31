//  **FORMAT** -- (note no comma after last array entry)
//
//  DZE_DEPLOYABLES_CONFIG = [
//      [_clickItem,_deployOffset,_packDistance,_damageLimit,_packAny,_cargo,_ammo,_hive,_plot,_simulation,_road,_deployables,_near,_parts,_condition],
//      [_clickItem,_deployOffset,_packDistance,_damageLimit,_packAny,_cargo,_ammo,_hive,_plot,_simulation,_road,_deployables,_near,_parts,_condition],
//      [...more stuff here...]
//  ];
//    
//  parameter    | description                                                         |  type  | example
// --------------|---------------------------------------------------------------------|--------|--------
// _clickItem    | class name of the item to click on                                  | string | "ItemToolbox"
// _deployOffset | [_side,_front,_up] array to offset the deployable when buiding      | array  | [0,2,1]
// _packDistance | how close does the packer need to be to pack the object?            | number | 5
// _damageLimit  | item can't be repacked if damage is > this. (-1 = no re-packing)    | number | 0.1
// _packAny      | can anyone repack the deployable?                                   | bool   | false
// _cargo        | clear the cargo of the deployable?                                  | bool   | false
// _ammo         | should vehicle ammo be cleared? (does not persist through restart)  | bool   | true
// _hive         | write deployable to database?                                       | bool   | false
// _plot         | require a plot from the owner to build the deployable?              | bool   | false
// _simulation   | enable simulation (movement/damage) for the object? (true for cars) | bool   | true
// _road         | enable road building for this object?                               | bool   | true
// _deployables  | array of class names that can be deployed with this method          | array  | ["MMT_Civ"]
// _near         | array of items required nearby to build (workshop/fire/fueltank)    | array  | []
// _parts        | array of parts required to build (will be taken from player)        | array  | ["ItemToolbox"]
// _condition    | string of code to evaluate to determine whether action is shown     | string | "!(isNull player) && {(getPlayerUID player) in DZE_DEPLOYABLE_ADMINS}"

DZE_DEPLOYABLES_CONFIG = [
     // deploy a non-permanent bike from a toolbox right in front of the player that can be re-packed by the owner as long as it's under 10% damage
    ["ItemToolbox",[0,2,1],5,0.9,true,false,false,false,false,true,true,["MMT_Civ"],[],["ItemToolbox"],"true"],
     // AA Static
    ["Kostey_map_case",[0,5,3],5,0.8,false,false,true,true,false,true,true,["ZU23_TK_GUE_EP1"],[],["Kostey_map_case","PartGeneric","29Rnd_30mm_AGS30","ItemBriefcase100oz"],"true"],
    // AGS Static
    ["Kostey_map_case",[0,5,3],5,0.8,false,false,true,true,false,true,true,["AGS_TK_EP1"],[],["Kostey_map_case","PartGeneric","29Rnd_30mm_AGS30","ItemBriefcase100oz"],"true"],
     // M2 Static
	["Kostey_notebook",[0,3,1],5,0.8,false,false,true,true,false,true,true,["M2StaticMG"],[],["Kostey_notebook","PartGeneric","100Rnd_127x99_M2","ItemBriefcase50oz"],"true"],
     // DSHKM Static
	["Kostey_notebook",[0,3,1],5,0.8,false,false,true,true,false,true,true,["DSHKM_CDF"],[],["Kostey_notebook","PartGeneric","50Rnd_127x107_DSHKM","ItemBriefcase50oz"],"true"],
	 // Zero 2 house
	["Kostey_photos",[0,10,1],5,-1,false,false,true,true,false,true,true,["MAP_dum_istan3_pumpa"],[],["Kostey_photos","ItemEmerald","ItemObsidian","ItemSapphire"],"true"],
     // Zero 2 house
	["CDF_dogtags",[0,3,1],5,-1,false,false,true,true,false,true,true,["FlagCarrierUSA_EP1"],[],["CDF_dogtags",'PartGeneric','ItemSandbag',"ItemBriefcase100oz"],"true"],
    //
	//["CDF_dogtags",[0,5,1],5,-1,false,false,true,true,false,false,false,["Land_CamoNetB_NATO"],[],["CDF_dogtags",'ItemCanvas','ItemCanvas','ItemCanvas','ItemBurlap','ItemPole','ItemCanvas'],"true"],
	 // Fuel Tank
	["Cobalt_File",[0,6,1],5,0.8,false,false,false,true,false,true,true,["US_WarfareBUAVterminal_EP1"],[],["Cobalt_File","PartGeneric","PartGeneric","ItemFuelBarrel","ItemFuelBarrel","ItemFuelBarrel","ItemGenerator"],"true"],
     // m240 nest
	["Cobalt_File",[0,3,1],5,0.8,false,false,false,true,false,true,true,["Land_Fort_Watchtower"],[],["Cobalt_File","PartGeneric","ItemSandbag","ItemSandbag","ItemBriefcase50oz"],"true"],
     // TOW Static
	["Moscow_Bombing_File",[0,3,1],5,0.8,false,false,true,true,false,true,true,["TOW_TriPod_US_EP1"],[],["Moscow_Bombing_File","PartGeneric","PG7V","ItemGPS","ItemBriefcase100oz"],"true"],
     // SPG9 Static
	["Moscow_Bombing_File",[0,3,1],5,0.8,false,false,true,true,false,true,true,["SPG9_TK_GUE_EP1"],[],["Moscow_Bombing_File","PartGeneric","PG7V","ItemBriefcase100oz"],"true"],
	 // masion Static
	["EvMoney",[0,30,1],5,-1,false,false,true,true,false,true,true,["Land_A_Villa_EP1"],[],["EvMoney","ItemRuby","ItemRuby","ItemRuby","ItemRuby","ItemRuby","ItemRuby","ItemRuby","ItemRuby"],"true"]
];

// **DZE_DEPLOYABLE_NAME_MAP format
//  
//  DZE_DEPLOYABLE_NAME_MAP = [
//      [_class,_name],
//      [_class,_name],
//      [... more ...]
//  ];
//
//  parameter    | description                                                         |  type  | example
// --------------|---------------------------------------------------------------------|--------|--------
// _class        | class name of the item you want to replace the name of              | string | "Notebook"
// _name         | new name to display when right clicking                             | string | "Macbook Pro"
//
DZE_DEPLOYABLE_NAME_MAP = [
    ["Notebook","Macbook Pro"]
];

DZE_DEPLOYABLE_ADMINS = [];
