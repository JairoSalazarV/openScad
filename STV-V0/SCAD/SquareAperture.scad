include <settingsLenghts.scad>


/////////////////////////////////////

// Cuanto se deja entre la tapa auxiliar y la planta alta
tmpHolg = 0.5;//Con 0 funcionó forzadito

//Pone la apertura
translate([0,0,cejaH+tmpHolg])
creaCilApertura();

//Pone la guia hembra
translate([0,0,cejaH+pared+tmpHolg])
creaGuiaHembra(cejaH);

//Pone guia macho
creaGuia(cejaH+tmpHolg);





module creaCilApertura(){
	difference(){
		//Pone el cilindro principal
		cylinder(r=mcW,pared);

		//Le quita la apertura
		translate([-aperW/2,-aperW/2,-0.1])
		cube([aperW,aperW,pared+0.2]);
	}
}