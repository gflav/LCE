private ["_camp"];

_x = _this select 0;
_y = _this select 1;

_camp = [
	["GunRack_DZ",[0.691772, 0.0252686],312.852,1,0,{}],
	["Land_tires_EP1",[-0.350342, 1.14404],326.896,1,0,{}],
	["Land_fortified_nest_big",[-2.30457, 3.43677],116.481,1,0,{}],
	["Land_Chair_EP1",[2.03894, 2.29846],212.826,1,0,{}],
	["Land_Barrel_water",[-3.32288, -0.419922],2.43314,1,0,{}],
	["FoldTable",[1.10376, 3.23315],295.193,1,0,{}],
	["FlagCarrierBAF",[2.34241, -3.17371],0,1,0,{}],
	["Land_Fire_barrel",[3.3363, -2.12463],0.00966339,1,0,{}],
	["Land_bags_stack_EP1",[-4.69006, 0.628906],0.0643673,1,0,{}],
	["Land_Fire_barrel",[5.87317, 3.05481],0.0232726,1,0,{}],
	["Land_Antenna",[2.54724, 7.80029],299.797,1,0,{}]
];

[[_x, _y], 0, _camp] call DT_fnc_ObjectsMapper;

["Profiteer1", [_x + 2.35327,_y + 3.38037], (115-180)] call DT_fnc_CreateTrader;
