SurvivalCheck = compile preprocessFileLineNumbers "SurvivalCheck.sqf";
CountAmmo     = compile preprocessFileLineNumbers "CountAmmo.sqf";
LogDeath      = compile preprocessFileLineNumbers "LogDeath.sqf";
GenerateUnit  = compile preprocessFileLineNumbers "GenerateUnit.sqf";

PlayerBattleGroup = createGroup west;
AIBattleGroup = createGroup east;

// Tuple system:
// For a given side:
// [BattleUnits, BattleAlive, BattleWounded, BattleDead]
// BattleUnits contain tuples
PlayerBattleUnits   = [];
AIBattleUnits       = [];
PlayerBattleDead    = [];
PlayerBattleWounded = [];
AIBattleDead        = [];
AIBattleWounded     = [];

PlayerBattleUnit = [0, PlayerBattleGroup, getMarkerPos "BattleZonePlayer"] call GenerateUnit;
PlayerBattleUnit addEventHandler ["killed", {execVM "PlayerDeath.sqf"; PlayerBattleWounded pushBack PlayerBattleUnit}];
PlayerBattleUnit addAction ["End Battle", {execVM "BattleEnd.sqf"}];
[PlayerBattleUnit] joinSilent PlayerBattleGroup;
PlayerBattleUnits pushBack PlayerBattleUnit;
selectPlayer PlayerBattleUnit;

for "_i" from 1 to 4 do
{
  _unit = [1, PlayerBattleGroup, getMarkerPos "BattleZonePlayer"] call GenerateUnit;
  _unit addEventHandler ["killed", {
        if(!([_this select 0, 1] call SurvivalCheck)) then {
          [_this select 0, _this select 1, true] call LogDeath;
          PlayerBattleDead pushBack (_this select 0);
        } else {
          [_this select 0, _this select 1, false] call LogDeath;
          PlayerBattleWounded pushBack (_this select 0);
        };
    }];
  [_unit] joinSilent PlayerBattleGroup;
  PlayerBattleUnits pushBack _unit;
};

for "_i" from 1 to 5 do
{
  _unit = [2, AIBattleGroup, getMarkerPos "BattleZoneAI"] call GenerateUnit;
  _unit addEventHandler ["killed", {
        if(!([_this select 0, 1] call SurvivalCheck)) then {
          [_this select 0, _this select 1, true] call LogDeath;
          AIBattleDead pushBack (_this select 0);
        } else {
          [_this select 0, _this select 1, false] call LogDeath;
          AIBattleWounded pushBack (_this select 0);
        };
    }];
  [_unit] joinSilent AIBattleGroup;
  AIBattleUnits pushBack _unit;
};

_wpP = PlayerBattleGroup addWaypoint [getMarkerPos "BattleZoneAI", 50];
_wpP setWaypointType "SAD";
_wpP setWaypointCombatMode "RED";
sleep 1;
_wpA = AIBattleGroup addWaypoint [getMarkerPos "BattleZonePlayer", 50];
_wpA setWaypointType "SAD";
_wpA setWaypointCombatMode "RED";
sleep 1;

BattleActive = true;
while{BattleActive} do
{
  //if(count units PlayerBattleGroup == 0) then
  _pDead = count PlayerBattleDead;
  _pWounded = count PlayerBattleWounded;
  _pActive = count PlayerBattleUnits - _pWounded - _pDead;

  _aDead = count AIBattleDead;
  _aWounded = count AIBattleWounded;
  _aActive = count AIBattleUnits - _aWounded - _aDead;

  hintSilent format ["Yours\n%1 active, %2 wounded, %3 dead\n\nEnemy\n%4 active, %5 wounded, %6 dead", _pActive, _pWounded, _pDead,_aActive, _aWounded, _aDead];
  if(_pActive == 0) then
  {
    hint "You have been defeated.";
    BattleActive = false;
  };
  //if(count units AIBattleGroup == 0) then
  if(_aActive == 0) then
  {
    hint "You have defeated the enemy!";
    BattleActive = false;
  };
  _wpA setWaypointPosition [(getPos (leader PlayerBattleGroup)), 0];
  _wpP setWaypointPosition [(getPos (leader AIBattleGroup)), 0];
  sleep 1;
};

PlayerBattleUnit removeAllEventHandlers "killed";
selectPlayer PlayerUnit;

{
  _ammo = [_x] call CountAmmo;
  (Supply_Ammo select 0) set [1, (Supply_Ammo select 0 select 1) + (_ammo select 0)];
  (Supply_Ammo select 1) set [1, (Supply_Ammo select 1 select 1) + (_ammo select 1)];
  (Supply_Ammo select 2) set [1, (Supply_Ammo select 2 select 1) + (_ammo select 2)];
  (Supply_Ammo select 3) set [1, (Supply_Ammo select 3 select 1) + (_ammo select 3)];
} forEach PlayerBattleUnits;

deleteVehicle PlayerBattleUnit;
{
  deleteVehicle _x;
} forEach PlayerBattleUnits;
deleteGroup PlayerBattleGroup;
{
  deleteVehicle _x;
} forEach AIBattleUnits;
deleteGroup AIBattleGroup;

sleep 5;
hint format ["%1 dead\n%2 wounded", count PlayerBattleDead, count PlayerBattleWounded];
sleep 5;
hint format ["Pistol:%1\nIntermediate:%2\nRifle:%3\nHeavy:%4\n", Supply_Ammo select 0 select 1, Supply_Ammo select 1 select 1, Supply_Ammo select 2 select 1, Supply_Ammo select 3 select 1];