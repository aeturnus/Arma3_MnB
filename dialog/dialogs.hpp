#include "common.hpp"

class MyHelloWorldDialog {
	idd = 0;
	movingEnable = 0;
	enableSimulation = 0;
	class controlsBackground { 
		// define controls here
	};
	class objects { 
		// define controls here
	};
	class controls { 
		// define controls here
	
		class MyHelloText: RscText {
			idc = -1;
			text = "Hello world";
			x = 0.80;
			y = 0.10;
			w = 0.20;
			h = 0.05;
		};
	};
};