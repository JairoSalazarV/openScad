include <settingsLenghts.scad>


/////////////////////////////////////

// Cuanto se deja entre la tapa auxiliar y la planta alta
tmpHolg = 1.8;

//Pone la apertura
translate([0,0,cejaH+tmpHolg])
creaCilApertura();

//Pone la guia hembra
translate([0,0,cejaH+pared+tmpHolg])
creaGuiaHembra(cejaH);

//Pone guia macho
creaGuia(cejaH+tmpHolg);





module creaCilApertura(){
	apertW = 49/2;//Radio
	difference(){
		//Pone el cilindro principal
		cylinder(r=mcW,pared);

		//Le quita la apertura
		translate([0,0,-0.1])
		cylinder(r=apertW,pared+0.2);
	}
}