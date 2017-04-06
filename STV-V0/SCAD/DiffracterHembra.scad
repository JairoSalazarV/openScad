include <settingsLenghts.scad>


/////////////////////////////////////



//Pone la apertura
translate([0,0,cejaH])
creaCilDiffracter();

//Pone la guia hembra
translate([0,0,cejaH+1.35])
rotate([0,180,0])
creaGuiaHembra(cejaH);

//Pone guia macho
translate([0,0,cejaH+pared+diffD])
creaGuia(cejaH+tmpHolg);






module creaCilDiffracter(){
	difference(){
		//Pone el cilindro principal
		cylinder(r=mcW,pared+diffD);

		//Le quita la base del difractador
		translate([-diffW/2,-diffW/2,pared])
		cube([diffW,diffW,diffD+0.2]);

		//Le quita la ventana
		translate([-diffWinW/2,-diffWinH/2,-0.1])
		cube([diffWinW,diffWinH,diffD+pared+0.2]);
	}
	creaPared(pared+diffD);
}