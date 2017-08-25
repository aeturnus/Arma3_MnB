#define NAME_SIN 1
#define NAME_PLU 2

// Logs the death of a soldier
params ["_killed","_killer","_isKilled", "_parties"];
_weapon = getText(configFile >>"CfgWeapons" >> currentWeapon (vehicle _killer) >> "displayName");
// bug: if killer switches weapons before this is run it'll report the new weapon.

// finding the 
_killedId = -1;
_killerId = -1;
{
  scopeName "FindKilled";
  _index = (_x select 0) find _killed;
  if(_index != -1) then {
    _killedId = (_x select 1) select _index;
    breakOut "FindKilled";
  };
} forEach _parties;
{
  scopeName "FindKiller";
  _index = (_x select 0) find _killer;
  if(_index != -1) then {
    _killerId = (_x select 1) select _index;
    breakOut "FindKiller";
  };
} forEach _parties;

_killedName = (UnitDefs select _killedId) select NAME_SIN;
_killerName = (UnitDefs select _killerId) select NAME_SIN;
/*
if(_killedId != -1) then {
  _killedName = (UnitDefs select _killedId) select 0;
} else {
  _killedName = _killed;
};

if(_killerId != -1) then {
  _killerName = (UnitDefs select _killerId) select 0;
} else {
  _killerName = _killer;
};
*/

if(_isKilled) then {
  systemChat format ["%1 killed by %2 (%3)", _killedName, _killerName, _weapon];
} else {
  systemChat format ["%1 knocked unconscious by %2 (%3)", _killedName, _killerName, _weapon];
};