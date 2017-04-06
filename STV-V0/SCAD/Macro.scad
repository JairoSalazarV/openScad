include <settingsLenghts.scad>


/////////////////////////////////////

// Cuanto se deja entre la tapa auxiliar y la planta alta
tmpHolg = 1.8;
macBaseW = 49/2; //radio interno del macro
macContW = 57/2; // radio del contorno del macro
macBaseH = 9; // alto del macro
macTapaW = 52/2; // radio de la tapa

//Pone la base del macro
translate([0,0,cejaH+tmpHolg])
creaBaseMacro();

//Pone la pared de la tapa
translate([0,0,cejaH+pared+tmpHolg])
creaPared(macBaseH);

//Pone la tapa del macro
translate([0,0,cejaH+tmpHolg+macBaseH+pared])
creaTapaMacro(macBaseH);

//Pone la guia hembra
translate([0,0,cejaH+pared+tmpHolg+macBaseH])
creaGuiaHembra(cejaH);

//Pone guia macho
creaGuia(cejaH+tmpHolg);


module creaPared(h){
	difference(){
		//Pone el cilindro principal
		cylinder(r=mcW,h);

		//Le quita el contorno exterior
		translate([0,0,-0.1])
		cylinder(r=mcW-pared,h+0.2);
	}
}

module creaTapaMacro(){
	difference(){
		//Pone el cilindro principal
		cylinder(r=mcW,pared);
		//Le quita el contorno exterior
		translate([0,0,-0.1])
		cylinder(r=macTapaW,pared+0.2);
	}
}

module creaBaseMacro(){
	difference(){
		//Pone el cilindro principal
		cylinder(r=mcW,pared);

		//Le quita el contorno exterior
		translate([0,0,pared/2])
		cylinder(r=macContW,pared);

		//Le quita la apertura
		translate([0,0,-0.1])
		cylinder(r=macBaseW,pared);
	}
}