//Ancho de la pared
pared  = 3;
//Radio del centro hueco
radioC = 11;
//Alto de la capa de apertura
aperH = 6;
//Ancho de la apertura
aperW = 5;
//Ancho del lente macro
macroW = 9.3;
//Profundidad del macro
macroH = 3;
//Profundidad parte de atras y delante
profDelante = 6;
profAtras = 6;

//
//Alto del cilindro del Macro
conH = 10;
//Ancho de la base del macro
macroBW = 9;
macroFH = 6;
macroFW = 10;

//
//Cilindro del MacroConnector
mcW = 32;
mcH = 20;
mcConnH = 8.5;//Altura connector a ranura
mcPared = 5;
mcCejaH = 6;

//
// Cilindro del diffracter
diffH = 15;
diffBase = 2;

diffAreaX = 36;
diffAreaY = 25;
diffAreaZ = (3*diffBase);

diffBaseX = diffAreaX+10;
diffBaseY = diffAreaY+10;
diffBaseZ = diffBase;

difference(){	
	cylinder(r=mcW,diffH);

	translate([0, 0, -0.1])
	cylinder(r=mcW-2.9,diffH+(2*mcCejaH)+1);

}


module cejaExterior(){	
	difference(){
		cylinder(r=mcW+1,mcCejaH-0.5);
		translate([0, 0, -0.1])
		cylinder(r=mcW-3.1,mcCejaH+0.1);
	}
}

module Macro(){
	difference(){
		cylinder(r=radioC+pared,mcConnH+conH-0.1);

		translate([0, 0, -0.5])
		cylinder(r=radioC+0.1,mcConnH);

		translate([0, 0, mcConnH-0.6])
		cylinder(r=macroBW,conH+0.6);
	
		translate([0, 0, mcConnH-0.6])
		cylinder(r=macroFW, macroFH+0.6);

	}
}



module cilindroPared(h){
	translate([0, 0, h/2]){
		difference(){
			cylinder(r=radioC+pared,h, center=true);
			cylinder(r=radioC,h+2, center=true);
		}
	}
}

module apertura(){
	//Crea apertura
	translate([0, 0, (aperH/2)+profDelante ]){
		difference(){
			cylinder(r=radioC+1,aperH,center=true);
			translate([0, 0, aperH-macroH]){
				cylinder(r=macroW/2,aperH,center=true);
			}
			cube([aperW,aperW,aperH+2],center=true);		
		}
	}
}