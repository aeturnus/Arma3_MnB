// units array: [ [uid,num], ... ]

params ["_playerStats", "_playerUnits", "_aiUnits", "_loc"];

PlayerBattleGroup = createGroup west;
AIBattleGroup = createGroup east;

// Tuple system:
// For a given side:
// [BattleUnits, BattleIDs, BattleActive, BattleWounded, BattleDead]
// BattleUnits maps to BattleIDs
PlayerBattleUnits   = [];
PlayerBattleIDs     = [];
PlayerBattleActive  = [];
PlayerBattleWounded = [];
PlayerBattleDead    = [];
AIBattleUnits       = [];
AIBattleIDs         = [];
AIBattleActive      = [];
AIBattleDead        = [];
AIBattleWounded     = [];

PlayerBattle = [PlayerBattleUnits, PlayerBattleIDs, PlayerBattleActive, PlayerBattleWounded, PlayerBattleDead];
AIBattle = [AIBattleUnits, AIBattleIDs, AIBattleActive, AIBattleWounded, AIBattleDead];

Parties = [PlayerBattle, AIBattle];

// select spawn locations
// flip coin for A or B marker
_flip = round(random 1.0);
//hint format ["%1",_flip];
_ploc = "";
_aloc = "";
if(_flip == 0) then 
{
  _ploc = _loc + "_A";
  _aloc = _loc + "_B";
}
else
{
  _ploc = _loc + "_B";
  _aloc = _loc + "_A"; 
};
Psurg = _playerStats select 0;
Asurg = 0;

PlayerBattleUnit = ["player", PlayerBattleGroup, getMarkerPos _ploc] call GenerateUnitUid;
PlayerBattleUnit addEventHandler ["killed", {execVM "PlayerDeath.sqf"; PlayerBattleWounded pushBack PlayerBattleUnit}];
PlayerBattleUnit addAction ["End Battle", {execVM "BattleEnd.sqf"}];
[PlayerBattleUnit] joinSilent PlayerBattleGroup;
PlayerBattleUnits pushBack PlayerBattleUnit;
PlayerBattleActive pushBack PlayerBattleUnit;
PlayerBattleIds pushBack 0;
selectPlayer PlayerBattleUnit;
PlayerBattleUnit setCustomAimCoef 10/1;

// add units
{
  _uid = _x select 0;
  _count = _x select 1;
  for "_i" from 1 to _count do
  {
    _unit = [_uid, PlayerBattleGroup, getMarkerPos _ploc] call GenerateUnitUid;
    _unit addEventHandler ["killed", {
          PlayerBattleActive = PlayerBattleActive - [(_this select 0)];
          if(!([_this select 0, Psurg] call SurvivalCheck)) then {
            [_this select 0, _this select 1, true, Parties] call LogDeath;
            PlayerBattleDead pushBack (_this select 0);
          } else {
            [_this select 0, _this select 1, false, Parties] call LogDeath;
            PlayerBattleWounded pushBack (_this select 0);
          };
      }];
    [_unit] joinSilent PlayerBattleGroup;
    PlayerBattleUnits pushBack _unit;
    PlayerBattleActive pushBack _unit;
    PlayerBattleIDs   pushBack (UnitDefsUid find _uid);
  }
} forEach _playerUnits;
{
  _uid = _x select 0;
  _count = _x select 1;
  for "_i" from 1 to _count do
  {
    _unit = [_uid, AIBattleGroup, getMarkerPos _aloc] call GenerateUnitUid;
    _unit addEventHandler ["killed", {
          AIBattleActive = AIBattleActive - [(_this select 0)];
          if(!([_this select 0, Asurg] call SurvivalCheck)) then {
            [_this select 0, _this select 1, true, Parties] call LogDeath;
            AIBattleDead pushBack (_this select 0);
          } else {
            [_this select 0, _this select 1, false, Parties] call LogDeath;
            AIBattleWounded pushBack (_this select 0);
          };
      }];
    [_unit] joinSilent AIBattleGroup;
    AIBattleUnits pushBack _unit;
    AIBattleActive pushBack _unit;
    AIBattleIDs   pushBack (UnitDefsUid find _uid);
  }
} forEach _aiUnits;

_wpP = PlayerBattleGroup addWaypoint [getMarkerPos _aloc, 50];
_wpP setWaypointType "SAD";
_wpP setWaypointCombatMode "RED";
sleep 1;
_wpA = AIBattleGroup addWaypoint [getMarkerPos _ploc, 50];
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