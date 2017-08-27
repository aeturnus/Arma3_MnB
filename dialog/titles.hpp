#include "common.hpp"

class RscTitles {
	class MyHUD {
		idd = -1;           // IDD not needed
		duration = 999999;  // show "forever"

		// store HUD in global var 'tst_hud'
		//onLoad = "tst_hud = _this select 0";
		onLoad = "uiNamespace setVariable ['tst_hud', _this select 0]";
		  
		// define a regular static text control
		class Controls {
		  class TXT: RscText {
			idc = 20000;
			//type = 0;                           
			//style = 2;                          
			x = .45; y = .0;                     
			w = 0.1; h = 0.05;                  
			colorText[] = {1, 1, 1, 1};         
			colorBackground[] = {1, .5, 0, .6}; 
			//font = "TahomaB";                   
			SizeEx = .04;                       
			text = "";     
			};
		};
	};
}; 