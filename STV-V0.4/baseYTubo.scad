include <./aux/creaBase.scad>
include <adqLight.scad>

squareH = 5;
squareW = 6;
frenteCeja = 4.5;
frenteCejaH = 3;
tuboH = 93;
tuboRadio = 25;

creaTubo();

module creaTubo(){
	difference(){
		createBaseYTubo();
		cylinder(r=tuboRadio-3,tuboH+2);

		translate([-squareW/2,-squareW/2,tuboH])
		cube(squareW,squareW,squareH);	
	}

	translate([0,0,96])
	adqSquAndTop();
}










module createBaseYTubo(){
	creaBaseHembra();

	//Hembra del cilindro
	translate([0,0,4])
	cylinder(r=tuboRadio,	tuboH);
}



module creaBaseHembra(){
	difference(){
		//Tornillos
		createBase( squareH );

		//Ceja
		translate([-(W/2)+frenteCeja,-(H/2)+frenteCeja,-0.1])
		cube([W-9,H-9,3]);

	}
}