include <settingsLenghts.scad>


/////////////////////////////////////

// Cuanto se deja entre la tapa auxiliar y la planta alta
tmpHolg = 1.8;

//Pone la apertura
translate([0,0,cejaH+tmpHolg])
creaCilApertura();

//Pone la guia hembra
translate([0,0,cejaH+pared+tmpHolg])
creaGuiaDeAjuste(cejaH);

//Pone guia macho
creaGuia(cejaH+tmpHolg);




module creaGuiaDeAjuste(h){
	//Pone el circulo soporte
	tmpW = mcW-guiaW;	
	tmpWSop = 0;//cejaH/2 para imprimir con soporte
	//creaPared(tmpWSop);//Soporte
	
	//Pone la pared de la guia
	difference(){
		cylinder(r=mcW-pared,tmpWSop+cejaH);
		translate([0,0,-0.1])
		cylinder(r=mcW-pared-pared,h+cejaH+0.2);
		//Pone la guia
		translate([-(guiaW/3),tmpW,tmpWSop+0.1])
		creaGuiaCentrada(h);
		translate([(guiaW/3),tmpW,tmpWSop+0.1])
		creaGuiaCentrada(h);
		//Repite la guia porque no alcanza
		translate([-(guiaW/3),tmpW-(guiaW/2),tmpWSop+0.1])
		creaGuiaCentrada(h);
		translate([(guiaW/3),tmpW-(guiaW/2),tmpWSop+0.1])
		creaGuiaCentrada(h);
	}
}
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