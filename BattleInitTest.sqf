SurvivalCheck = compile preprocessFile "SurvivalCheck.sqf";
CountAmmo     = compile preprocessFile "CountAmmo.sqf";

PlayerBattleGroup = createGroup west;
AIBattleGroup = createGroup east;

PlayerBattleUnits   = [];
AIBattleUnits       = [];
PlayerBattleDead    = [];
PlayerBattleWounded = [];
AIBattleDead        = [];
AIBattleWounded     = [];

PlayerBattleUnit = PlayerBattleGroup createUnit ["C_man_casual_1_F", getMarkerPos "BattleZonePlayer", [], 0, "NONE"];
PlayerBattleUnit addEventHandler ["killed", {execVM "PlayerDeath.sqf"; PlayerBattleWounded pushBack PlayerBattleUnit}];
PlayerBattleUnit addAction ["End Battle", {execVM "BattleEnd.sqf"}];
[PlayerBattleUnit] joinSilent PlayerBattleGroup;
PlayerBattleUnits pushBack PlayerBattleUnit;
selectPlayer PlayerBattleUnit;

removeAllWeapons PlayerBattleUnit; removeAllItems PlayerBattleUnit; removeAllAssignedItems PlayerBattleUnit; removeUniform PlayerBattleUnit; removeVest PlayerBattleUnit; removeBackpack PlayerBattleUnit; removeHeadgear PlayerBattleUnit; removeGoggles PlayerBattleUnit;
PlayerBattleUnit forceAddUniform "U_C_Poor_2"; for "_i" from 1 to 2 do {PlayerBattleUnit addItemToUniform "30Rnd_762x39_Mag_F";};
PlayerBattleUnit addVest "V_BandollierB_cbr"; for "_i" from 1 to 6 do {PlayerBattleUnit addItemToVest "30Rnd_762x39_Mag_F";};
PlayerBattleUnit addWeapon "arifle_AKM_F"; PlayerBattleUnit linkItem "ItemMap"; PlayerBattleUnit linkItem "ItemCompass"; PlayerBattleUnit linkItem "ItemWatch"; PlayerBattleUnit linkItem "ItemRadio";

for "_i" from 1 to 4 do
{
  _unit = PlayerBattleGroup createUnit ["C_man_casual_1_F", getMarkerPos "BattleZonePlayer", [], 0, "FORM"];
  _unit addEventHandler ["killed", {
        if(!([_this select 0, 1] call SurvivalCheck)) then {
          systemChat format ["%1 killed by %2", _this select 0, _this select 1];
          PlayerBattleDead pushBack (_this select 0);
        } else {
          systemChat format ["%1 knocked out by %2", _this select 0, _this select 1];
          PlayerBattleWounded pushBack (_this select 0);
        };
    }];
  
  removeAllWeapons _unit; removeAllItems _unit; removeAllAssignedItems _unit; removeUniform _unit; removeVest _unit; removeBackpack _unit; removeHeadgear _unit; removeGoggles _unit;
  _unit forceAddUniform "U_C_Poor_2"; for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_762x39_Mag_F";};
  _unit addVest "V_BandollierB_cbr"; for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_762x39_Mag_F";};
  _unit addWeapon "arifle_AKM_F"; _unit linkItem "ItemMap"; _unit linkItem "ItemCompass"; _unit linkItem "ItemWatch"; _unit linkItem "ItemRadio";
  [_unit] joinSilent PlayerBattleGroup;

  PlayerBattleUnits pushBack _unit;
};

for "_i" from 1 to 5 do
{
  _unit = AIBattleGroup createUnit ["O_survivor_F", getMarkerPos "BattleZoneAI", [], 0, "FORM"];
  _unit addEventHandler ["killed", {
        if(!([_this select 0, 1] call SurvivalCheck)) then {
          systemChat format ["%1 killed by %2", _this select 0, _this select 1];
          AIBattleDead pushBack (_this select 0);
        } else {
          systemChat format ["%1 knocked out by %2", _this select 0, _this select 1];
          AIBattleWounded pushBack (_this select 0);
        };
    }];
  
  removeAllWeapons _unit; removeAllItems _unit; removeAllAssignedItems _unit; removeUniform _unit; removeVest _unit; removeBackpack _unit; removeHeadgear _unit; removeGoggles _unit;
  _unit forceAddUniform "U_O_CombatUniform_ocamo"; for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_green";};
  _unit addVest "V_HarnessO_brn"; for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
  _unit addWeapon "arifle_Katiba_F"; _unit linkItem "ItemMap"; _unit linkItem "ItemCompass"; _unit linkItem "ItemWatch"; _unit linkItem "ItemRadio";
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