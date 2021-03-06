#define DEG_X 0.50
#define DEG_Y 0.50
//#define OFF_X 0.25
//#define OFF_Y 0.25
#define OFF_X 0.5
#define OFF_Y 0.5
#define MIN_OFF_X 0.25
#define MIN_OFF_Y 0.25

#define SET_TIME 1
#define WAIT_TIME 2
#define CLR_TIME 1
disableSerialization;

_state = 0;

ppRadial ppEffectAdjust [0.0, 0.0, 0.0, 0.0];
ppColor ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0.299,0.587,0.114,0]];
[ppRadial, ppColor] ppEffectCommit 0;
while {alive player} do
{
  _damage = damage player;
  _health = 1 - _damage;
  switch (_state) do
  {
    case 0:
    {
      ppRadial ppEffectAdjust [0.0, 0.0, OFF_X*_health max MIN_OFF_X, OFF_Y*_health max MIN_OFF_Y];
      ppColor ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0.299,0.587,0.114,0]];
      _state = 1;
      [ppRadial, ppColor] ppEffectCommit SET_TIME;
      waitUntil {ppEffectCommitted ppRadial};
    };
    case 1:
    {
      _state = 2;
      sleep WAIT_TIME;
    };
    case 2:
    {
      ppRadial ppEffectAdjust [DEG_X*_damage, DEG_Y*_damage, OFF_X*_health max MIN_OFF_X, OFF_Y*_health max MIN_OFF_Y];
      //ppColor ppEffectAdjust [1,1,0,[_health,0,0,0],[_damage,_health,_health,_health],[0.299,0.587,0.114,0]];
      ppColor ppEffectAdjust [1,1,0,[_health,0,0,0],[1,_health,_health,_health],[0.299,0.587,0.114,0]];
      _state = 0;
      [ppRadial, ppColor] ppEffectCommit CLR_TIME;
      waitUntil {ppEffectCommitted ppRadial};
    };
  }
};
ppRadial ppEffectAdjust [0.0, 0.0, 0.0, 0.0];
ppColor ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0.299,0.587,0.114,0]];
[ppRadial, ppColor] ppEffectCommit 0;
//ppEffectDestroy [ppRadial, ppColor];