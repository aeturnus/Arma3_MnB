// This script will calculate whether or not a unit will survive
params ["_guy","_surgery"];
_abdomen    = (vehicle _guy) getHitPointDamage "hitAbdomen";
_arms       = (vehicle _guy) getHitPointDamage "hitArms";
_body       = (vehicle _guy) getHitPointDamage "hitBody";
_chest      = (vehicle _guy) getHitPointDamage "hitChest";
_diaphragm  = (vehicle _guy) getHitPointDamage "hitDiaphragm";
_face       = (vehicle _guy) getHitPointDamage "hitFace";
_hands      = (vehicle _guy) getHitPointDamage "hitHands";
_head       = (vehicle _guy) getHitPointDamage "hitHead";
_legs       = (vehicle _guy) getHitPointDamage "hitLegs";
_neck       = (vehicle _guy) getHitPointDamage "hitNeck";
_pelvis     = (vehicle _guy) getHitPointDamage "hitPelvis";

_rand = random 1.0;

_threshold = 0;
_threshold = _threshold + _abdomen   * 0.15;
_threshold = _threshold + _arms      * 0.05;
_threshold = _threshold + _body      * 0.15;
_threshold = _threshold + _chest     * 0.25;
_threshold = _threshold + _diaphragm * 0.10;
_threshold = _threshold + _face      * 0.50;
_threshold = _threshold + _hands     * 0.05;
_threshold = _threshold + _head      * 0.50;
_threshold = _threshold + _legs      * 0.10;
_threshold = _threshold + _neck      * 0.25;
_threshold = _threshold + _pelvis    * 0.10;
_threshold = _threshold * (1 - (_surgery-1)*.10);

//hint format ["Threshold: %1\nRandom: %2", _threshold, _rand];

_return = true;
if(_rand < _threshold) then {
  _return = false;
};
//hint format ["Survives: %1", _return];
_return