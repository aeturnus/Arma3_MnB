// Generates a unit by its index number: very M&B like
// Returns a reference to the unit
#define EQP           4
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
params ["_id","_grp","_pos"];
_def = UnitDefs select _id;
_equip = _def select EQP;
_classname = EQP_BASECLASS;  // get the classname of the base unit

_unit = _grp createUnit [_classname, _pos, [], 0, "FORM"];
removeAllWeapons _unit; removeAllItems _unit; removeAllAssignedItems _unit; removeUniform _unit; removeVest _unit; removeBackpack _unit; removeHeadgear _unit; removeGoggles _unit;

// Add clothes and backpack
if(EQP_UNIFORM != "NULL") then {
  _unit forceAddUniform EQP_UNIFORM;
};
if(EQP_VEST != "NULL") then {
  _unit addVest EQP_VEST;
};
if(EQP_BACKPACK != "NULL") then {
  _unit addBackpack EQP_BACKPACK;
};
if(EQP_HEADGEAR != "NULL") then {
  _unit addHeadgear EQP_HEADGEAR;
};
if(EQP_GOGGLES != "NULL") then {
  _unit addGoggles EQP_GOGGLES;
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
if(EQP_BINOS != "NULL") then {
  _unit addWeapon EQP_BINOS;
};

// Add items
if(EQP_NVG != "NULL") then {
  _unit linkItem EQP_NVG;
};


// Add default items
_unit linkItem "ItemMap";
_unit linkItem "ItemCompass";
_unit linkItem "ItemWatch";
_unit linkItem "ItemRadio";

/*
_unit setFace "GreekHead_A3_03";
_unit setSpeaker "male06gre";
*/
