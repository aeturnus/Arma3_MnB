// create the HUD
disableSerialization;
titleRsc["MyHUD", "PLAIN"];
waitUntil {!isNull (uiNamespace getVariable 'tst_hud')};

// get the control
_hud = (uiNamespace getVariable 'tst_hud') displayCtrl 20000;

// constantly update the player direction in the control
waitUntil {
  _hud ctrlSetText format["Dir: %1",round(getDir player)];
  // until the player presses <Esc>
  //(isKeyPressed 0x01) 
  (!alive player)
};

// then destroy the HUD via an empty titleText message
titleText["", "PLAIN"];