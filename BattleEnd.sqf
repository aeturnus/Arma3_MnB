/*
PlayerBattleUnit removeAllEventHandlers "killed";
selectPlayer PlayerUnit;
deleteVehicle PlayerBattleUnit;

{
  deleteVehicle _x;
} forEach units PlayerBattleGroup;
deleteGroup PlayerBattleGroup;

{
  deleteVehicle _x;
} forEach units AIBattleGroup;
deleteGroup AIBattleGroup;
*/
BattleActive = false;