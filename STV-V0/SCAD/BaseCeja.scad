include <settingsLenghts.scad>

h = cejaH-0.5;
w = guiaW+2.5;


/////////////////////////////////////
difference(){
	//Área grande
	cylinder(r=mcW-pared-1,cejaH-0.3);

	translate([0,mcW-pared-pared-1.7,-0.1])
	translate([-w/2,-w/2,-0.1])
	cube([w,w,h+1]);

	translate([0,0,-0.1])
	cylinder(r=8,cejaH+0.2);
	
}