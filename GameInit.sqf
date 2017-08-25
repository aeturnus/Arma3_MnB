SurvivalCheck = compile preprocessFileLineNumbers "SurvivalCheck.sqf";
CountAmmo     = compile preprocessFileLineNumbers "CountAmmo.sqf";
LogDeath      = compile preprocessFileLineNumbers "LogDeath.sqf";
GenerateUnit  = compile preprocessFileLineNumbers "GenerateUnit.sqf";
GenerateUnitUid = compile preprocessFileLineNumbers "GenerateUnitUid.sqf";

Supply_Money = 100;
Supply_Ammo = [
                ["Pistol",      0],
                ["Intermediate",0],
                ["Rifle",       0],
                ["Heavy",       0],
                ["Launcher",    0],
                ["Explosives",  0]
              ];
execVM "UnitDefs.sqf";
/*
{
  hint format ["%1: %2", _x select 0, _x select 1];
  sleep 3;
} forEach Supply_Ammo
*/
PlayerName = name InitialUnit;
PlayerFace = face InitialUnit;
PlayerSpeaker = speaker InitialUnit;
PlayerGroup = createGroup west;
PlayerGroup setGroupId [format ["%1's Party",PlayerName]];
PlayerUnit = PlayerGroup createUnit ["C_man_casual_1_F", getMarkerPos "BaseCamp", [], 0, "NONE"];
[PlayerUnit] join PlayerGroup;  // because createUnit won't set the side
selectPlayer PlayerUnit;
deleteVehicle InitialUnit;

//PlayerUnit addEventHandler ["killed", {execVM "PlayerDeath.sqf"}];
PlayerUnit setName format ["%1 (Player)", PlayerName];
PlayerUnit setFace PlayerFace;
PlayerUnit setSpeaker PlayerSpeaker;

PlayerUnit addAction ["Begin test battle", {execVM "BattleInitTest.sqf"}];
PlayerUnit addAction ["GenerateTestUnit", {
  _genUnit = compile preprocessFileLineNumbers "GenerateUnit.sqf";
  _unit = [1,group player, getPos PlayerUnit] call _genUnit;
}];