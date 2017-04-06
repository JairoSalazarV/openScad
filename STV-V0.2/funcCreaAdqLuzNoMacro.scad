include <settingsLenghts0-1.scad>


/////////////////////////////////////


macroW = 21;//20:diametro
macroH = 11;

macroBaseW = 18;//17:diametro
macroBaseH = 6;
macroNoBaseH = macroH-macroBaseH;

tmpPared = pared*2;


if(false){
	translate([	0,0,30])
	rotate([0,180,0])
	crearBaseAdqLuz();
}

module crearBaseAdqLuzNoMacro(){
	
	difference(){
		//Toda el área de trabajo
		cylinder(
					r=(luzWBig/2)+pared,
					luzHBig+luzHRosca
		  	 	 );

		//Cilindro para que entre lente 
		//adquicisión de luz
		translate([0, 0, -0.1])
		cylinder(r=(luzWBig-0.4)/2,luzHBig+0.1);

		//Espacio para que entre la rosca
		translate([0, 0, luzHBig-0.1])
		cylinder(r=luzWRosca/2,luzHRosca+0.2);

		//Área del tornillo
		translate([-3,-3+(luzWBig/2),3.9])
		cube([6,6,6-1+0.2]);


	}
}


