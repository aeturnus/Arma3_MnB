
/*
player, [missionNamespace, "inventory_var"]] call BIS_fnc_saveInventory;
_unit = group player createUnit ["C_man_p_fugitive_F", position player, [], 0, "NONE"];
addSwitchableUnit _unit;
selectPlayer _unit;
player, [missionNamespace, "inventory_var"]] call BIS_fnc_loadInventory;
*/

///*
//DeathCamera = group player createUnit ["VirtualSpectator_F", position player, [], 0, "NONE"];
addSwitchableUnit DeathCamera;
DeathCamera setPos (getPos player vectorAdd [0,0,1]);
selectPlayer DeathCamera;
removeSwitchableUnit DeathCamera;
hint "You have fallen in battle. Your troops will fight on without you.";
//DeathCamera addAction ["End Battle", {execVM "BattleEnd.sqf"; deleteVehicle DeathCamera; }];
DeathCamera addAction ["End Battle", {execVM "BattleEnd.sqf"; removeAllActions DeathCamera}];
//*/

/*
DeathCamera setPos (getPos player vectorAdd [0,0,30]);
selectPlayer DeathCamera;
*/

//["Initialize", [player,[],true]] call BIS_fnc_EGSpectator;