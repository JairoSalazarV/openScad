include <settingsLenghts.scad>


/////////////////////////////////////

muescaW=5;

tmpH = cejaH+pared+tmpHolg;


difference(){
	creaFigura();

	//Quita aro de exceso
	translate([0,0,pared])
	creaAro();
}


//Crea pared arriba
translate([0,0,tmpH-pared])
difference(){
	cylinder(r=(mcW-pared),pared);
	translate([0,0,-0.1])
	cylinder(r=(mcW-pared*3),pared+0.2);
	translate([0,0,-pared])
	creaAro();
}


//Pone guia macho
translate([0,0,(tmpH-pared)])
creaGuia((cejaH+pared+tmpHolg));



module creaFigura(){			
	difference(){
		//Pone el cilindro principal
		cylinder(r=mcW-pared,tmpH);
		//Quita el centro
		translate([0,0,(pared+0.1)])
		cylinder(r=(mcW-pared-pared-2),(tmpH-pared));
		//Le quita la ventana
		translate([-diffWinW/2,-diffWinH/2,-0.1])
		cube([diffWinW,diffWinH,diffD+pared+0.2]);
		//Pone la guia
		translate([-(muescaW/2),(mcW-muescaW+0.6),-0.1])
		cube([muescaW,muescaW,(muescaW*2)]);
	}
}


module creaAro(){
	difference(){
		//Pone el aro
		cylinder(r=(mcW-(pared*2)),tmpH);
		translate([0,0,-0.1])
		cylinder(r=(mcW-(pared*3)-0.2),pared+0.2);
		//Pone la guia
		translate([-(muescaW*1.7/2),(mcW-muescaW-1),-0.1])
		cube([muescaW*1.7,muescaW*1.,(muescaW*2)]);
	}
}



