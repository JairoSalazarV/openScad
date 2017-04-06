include <settingsLenghts.scad>


/////////////////////////////////////

crearBaseAdqLuz();

module crearAreaLuz(){
	cylinder(r=(luzWBig/2)+pared,luzHBig+luzHRosca+pared);
}

module crearBaseAdqLuz(){
	difference(){
		//Toda el área de trabajo
		crearAreaLuz();

		//Cilindro para que entre lente 
		//adquicisión de luz
		translate([0, 0, -0.1])
		cylinder(r=luzWBig/2,luzHBig+0.2);

	
		//Espacio para que entre la rosca
		translate([0, 0, luzHBig])
		cylinder(r=luzWRosca/2,luzHRosca+0.2);

		//Área donde sienta el lente y sirve para
		//bloquear la luz de las paredes
		translate([0, 0, luzHBig+luzHRosca])
		//Le quita la apertura
		translate([-aperW/2,-aperW/2,-0.1])
		cube([aperW,aperW,pared+0.2]);
	}
}


