params ["_uid","_grp","_pos"];
_id = UnitDefsUid find _uid;

_unit = [_id, _grp, _pos] call GenerateUnit;

// return
_unit