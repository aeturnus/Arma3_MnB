PlayerBattleGroup = createGroup west;
AIBattleGroup = createGroup east;

PlayerBattleUnit = PlayerBattleGroup createUnit ["C_man_casual_1_F", getMarkerPos "BattleZonePlayer", [], 0, "NONE"];
PlayerBattleUnit addEventHandler ["killed", {execVM "PlayerDeath.sqf"}];
PlayerBattleUnit addAction ["End Battle", {execVM "BattleEnd.sqf"}];
[PlayerBattleUnit] join PlayerBattleGroup;
selectPlayer PlayerBattleUnit;

removeAllWeapons PlayerBattleUnit; removeAllItems PlayerBattleUnit; removeAllAssignedItems PlayerBattleUnit; removeUniform PlayerBattleUnit; removeVest PlayerBattleUnit; removeBackpack PlayerBattleUnit; removeHeadgear PlayerBattleUnit; removeGoggles PlayerBattleUnit;
PlayerBattleUnit forceAddUniform "U_C_Poor_2"; for "_i" from 1 to 2 do {PlayerBattleUnit addItemToUniform "30Rnd_762x39_Mag_F";};
PlayerBattleUnit addVest "V_BandollierB_cbr"; for "_i" from 1 to 6 do {PlayerBattleUnit addItemToVest "30Rnd_762x39_Mag_F";};
PlayerBattleUnit addWeapon "arifle_AKM_F"; PlayerBattleUnit linkItem "ItemMap"; PlayerBattleUnit linkItem "ItemCompass"; PlayerBattleUnit linkItem "ItemWatch"; PlayerBattleUnit linkItem "ItemRadio";

for "_i" from 1 to 4 do
{
  _unit = PlayerBattleGroup createUnit ["C_man_casual_1_F", getMarkerPos "BattleZonePlayer", [], 0, "FORM"];
  _unit addEventHandler ["killed", {systemChat format ["%1 killed by %2", _this select 0, _this select 1]}];
  
  removeAllWeapons _unit; removeAllItems _unit; removeAllAssignedItems _unit; removeUniform _unit; removeVest _unit; removeBackpack _unit; removeHeadgear _unit; removeGoggles _unit;
  _unit forceAddUniform "U_C_Poor_2"; for "_i" from 1 to 2 do {_unit addItemToUniform "30Rnd_762x39_Mag_F";};
  _unit addVest "V_BandollierB_cbr"; for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_762x39_Mag_F";};
  _unit addWeapon "arifle_AKM_F"; _unit linkItem "ItemMap"; _unit linkItem "ItemCompass"; _unit linkItem "ItemWatch"; _unit linkItem "ItemRadio";
  [_unit] join PlayerBattleGroup;
};

for "_i" from 1 to 5 do
{
  _unit = AIBattleGroup createUnit ["O_survivor_F", getMarkerPos "BattleZoneAI", [], 0, "FORM"];
  _unit addEventHandler ["killed", {systemChat format ["%1 killed by %2", _this select 0, _this select 1]}];
  
  removeAllWeapons _unit; removeAllItems _unit; removeAllAssignedItems _unit; removeUniform _unit; removeVest _unit; removeBackpack _unit; removeHeadgear _unit; removeGoggles _unit;
  _unit forceAddUniform "U_O_CombatUniform_ocamo"; for "_i" from 1 to 3 do {_unit addItemToUniform "30Rnd_65x39_caseless_green";};
  _unit addVest "V_HarnessO_brn"; for "_i" from 1 to 6 do {_unit addItemToVest "30Rnd_65x39_caseless_green";};
  _unit addWeapon "arifle_Katiba_F"; _unit linkItem "ItemMap"; _unit linkItem "ItemCompass"; _unit linkItem "ItemWatch"; _unit linkItem "ItemRadio";
  [_unit] join AIBattleGroup;
};

_wp = PlayerBattleGroup addWaypoint [getMarkerPos "BattleZoneAI", 0];
//_wp setWaypointType "SEEK & DESTROY";
_wp setWaypointType "MOVE";
_wp = AIBattleGroup addWaypoint [getMarkerPos "BattleZonePlayer", 0];
_wp setWaypointType "MOVE";
//_wp setWaypointType "SEEK & DESTROY";
active = true;
while{active} do
{
  if(count units PlayerBattleGroup == 0) then
  {
    hint "You have been defeated.";
    active = false;
  };
  if(count units AIBattleGroup == 0) then
  {
    hint "You have defeated the enemy!";
    active = false;
  };
  sleep 1;
};