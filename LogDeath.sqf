// Logs the death of a soldier
params ["_killed","_killer","_isKilled"];
_weapon = getText(configFile >>"CfgWeapons" >> currentWeapon (vehicle _killer) >> "displayName");
// bug: if killer switches weapons before this is run it'll report the new weapon.
if(_isKilled) then {
  systemChat format ["%1 killed by %2 (%3)", _killed, _killer, _weapon];
} else {
  systemChat format ["%1 knocked unconscious by %2 (%3)", _killed, _killer, _weapon];
};