// This script will calculate how much ammo of each type this unit is carrying
params ["_unit"];
_return = [0,0,0,0,0,0];
_pistols      = ["9x21","45ACP"];
_intermediate = ["65x39","556x45","762x39","545x39","580x42","650x39"];
_rifle        = ["762x51","762x54","338","408","127x54","93x64","50BW"];
_heavy        = ["127x99","127x108"];
_calibers     = [_pistols,_intermediate,_rifle,_heavy];
_mags = magazinesAmmoFull _unit;
{
  _mag      = _x;
  _name     = _mag select 0;
  _count    = _mag select 1;
  _caliber  = (_name splitString "_") select 1;
  
  for "_i" from 0 to 3 do
  {
    {
      scopeName "currentCaliber";
      if(_x == _caliber) then
      {
        _return set [_i, (_return select _i) + _count];
        breakOut "currentCaliber";
      }
    } forEach (_calibers select _i);
  };
} forEach _mags;

_return