// Generates a unit by its index number: very M&B like
// Returns a reference to the unit
#define RNK           3
#define EQP           6
#define SKILLS        7
#define EQP_BASECLASS (_equip select 0)
#define EQP_UNIFORM   (_equip select 1)
#define EQP_VEST      (_equip select 2)
#define EQP_BACKPACK  (_equip select 3)
#define EQP_HEADGEAR  (_equip select 4)
#define EQP_GOGGLES   (_equip select 5)
#define EQP_BINOS     (_equip select 6)
#define EQP_NVG       (_equip select 7)
#define EQP_MAGAZINES (_equip select 8)
#define EQP_PRIMARY   (_equip select 9)
#define EQP_HANDGUN   (_equip select 10)
#define EQP_SECONDARY (_equip select 11)
#define EQP_ITEMS     (_equip select 12)

#define SKL_LEADER    (_skill select 0)
#define SKL_FIREARMS  (_skill select 1)
#define SKL_SPOTTING  (_skill select 2)
params ["_id","_grp","_pos"];
_def = UnitDefs select _id;
_equip = _def select EQP;
_skill = _def select SKILLS;
_classname = EQP_BASECLASS;  // get the classname of the base unit

_unit = _grp createUnit [_classname, _pos, [], 0, "FORM"];
removeAllWeapons _unit; removeAllItems _unit; removeAllAssignedItems _unit; removeUniform _unit; removeVest _unit; removeBackpack _unit; removeHeadgear _unit; removeGoggles _unit;

// Add clothes and backpack
_count = count EQP_UNIFORM;
if(_count != 0) then {
  _index = floor (random _count);
  _unit forceAddUniform (EQP_UNIFORM select _index);
};

_count = count EQP_VEST;
if(_count != 0) then {
  _index = floor (random _count);
  _unit addVest (EQP_VEST select _index);
};

_count = count EQP_BACKPACK;
if(_count != 0) then {
  _index = floor (random _count);
  _unit addBackpack (EQP_BACKPACK select _index);
};

_count = count EQP_HEADGEAR;
if(_count != 0) then {
  _index = floor (random _count);
  _unit addHeadgear (EQP_HEADGEAR select _index);
};

_count = count EQP_GOGGLES;
if(_count != 0) then {
  _index = floor (random _count);
  _unit addGoggles (EQP_GOGGLES select _index);
};

// Add mags
{
  _unit addMagazines [_x select 0, _x select 1];
} forEach (EQP_MAGAZINES);

// Add weapons
if((EQP_PRIMARY select 0) != "NULL") then {
  _unit addWeapon (EQP_PRIMARY select 0);
  {
    _unit addPrimaryWeaponItem _x;
  } forEach (EQP_PRIMARY select 1);
};
if((EQP_HANDGUN select 0) != "NULL") then {
  _unit addWeapon (EQP_HANDGUN select 0);
  {
    _unit addHandgunItem _x;
  } forEach (EQP_HANDGUN select 1);
};
if((EQP_SECONDARY select 0) != "NULL") then {
  _unit addWeapon (EQP_SECONDARY select 0);
  {
    _unit addSecondaryWeaponItem _x;
  } forEach (EQP_SECONDARY select 1);
};

_count = count EQP_BINOS;
if(_count != 0) then {
  _index = floor (random _count);
  _unit addWeapon (EQP_BINOS select _index);
};

_count = count EQP_NVG;
if(_count != 0) then {
  _index = floor (random _count);
  _unit linkItem (EQP_NVG select _index);
};

// Add items
{
  _unit additem _x;
} forEach EQP_ITEMS;

// Add default items
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";


// Set skills
_leadership = SKL_LEADER * 0.10;
_firearms = SKL_FIREARMS * 0.10;
_spotting = SKL_SPOTTING * 0.10;

_unit setSkill ["commanding", _leadership];
_unit setSkill ["aimingAccuracy", _firearms];
_unit setSkill ["aimingShake", _firearms];
_unit setSkill ["aimingSpeed", _firearms];
_unit setSkill ["reloadSpeed", _firearms];
_unit setSkill ["spotDistance", _spotting];
_unit setSkill ["spotTime", _spotting];

_unit setUnitRank (_def select RNK);

_unit
/*
_unit setFace "GreekHead_A3_03";
_unit setSpeaker "male06gre";
*/
