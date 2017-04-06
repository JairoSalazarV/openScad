include <settingsLenghts0-1.scad>
include <creaJaulaBase.scad>


if(false){
	translate([-camW/2,-camH/2,0])
	%cube([camW,camH,camP]);
}

difference(){

	creaJaulaBase();
	
	//Quita el área donde entra la cámara
	translate(
				[
					-((camDispW+5)/2),
					-((camDispH-10)/2),
					-0.1
				])
	cube(
			[
				camDispW+8,
				camDispH-10,
				baseH+0.2]);
	
}











