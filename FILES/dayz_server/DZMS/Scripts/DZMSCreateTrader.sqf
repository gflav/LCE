private ["_trader","_unit_133"];

_trader = createAgent ["US_Delta_Force_Undercover_Takistani06_EP1", [13722,2912.17,0], [], 0, "CAN_COLLIDE"];
_unit_133 = _trader;
_trader setDir 175.489;
_trader setVehicleInit "this allowDammage false; this disableAI 'FSM'; this disableAI 'MOVE'; this disableAI 'AUTOTARGET'; this disableAI 'TARGET'; this setBehaviour 'CARELESS'; this forceSpeed 0;";
_trader setUnitAbility 0.60000002;
_trader allowDammage false; _trader disableAI 'FSM'; _trader disableAI 'MOVE'; _trader disableAI 'AUTOTARGET'; _trader disableAI 'TARGET'; _trader setBehaviour 'CARELESS'; _trader forceSpeed 0;_trader enableSimulation false;