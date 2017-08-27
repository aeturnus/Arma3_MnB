#include "common.hpp"

class BarIndicator{
	idd = 0;
	movingEnable = 1;
	enableSimulation = 1;
	class controlsBackground { 
		// define controls here
	};
	class objects { 
		// define controls here
	};
	class controls { 
		// define controls here
	
		class BarText: RscText {
			idc = -1;
			moving = 1;
			text = "world";
			x = 0.0;
			y = 1.0;
			w = 0.0;
			h = 0.20;
			colorBackground[] = {0,0,0,1};
			textBackground[] = {1,1,1,1};
		};
	};
};