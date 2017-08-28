params ["_damage"];

ppCol = ppEffectCreate ["ColorCorrections",1500];
ppCol ppEffectEnable true;
ppCol ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0.299,0.587,0.114,0]];
ppCol ppEffectCommit 0;
waitUntil {ppEffectCommitted ppCol};

ppCol ppEffectAdjust [(1 + _damage*2) max 2,1,0,[1,0,0,0],[1,1,1,1],[0.299,0.587,0.114,0]];
ppCol ppEffectCommit 0.05;
waitUntil {ppEffectCommitted ppCol};

ppCol ppEffectAdjust [1,1,0,[0,0,0,0],[1,1,1,1],[0.299,0.587,0.114,0]];
ppCol ppEffectCommit 0.05;
waitUntil {ppEffectCommitted ppCol};