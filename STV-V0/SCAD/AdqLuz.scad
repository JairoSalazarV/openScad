include <settingsLenghts.scad>


/////////////////////////////////////

crearCilAdqLuz();
crearBaseAdqLuz();
//Pone la guia
translate([0,0,mcH-cejaH])
creaGuia(cejaH);







module crearCilAdqLuz(){
	difference(){
		//Área grande
		cylinder(r=mcW,mcH);
		//Quita relleno para dejar pared
		translate([0,0,pared])
		cylinder(r=mcW-pared,mcH);		
		//Quita área del cilindro central
		translate([0,0,-0.2])
		cylinder(r=(luzWBig/2)+pared,pared*2);
		//Quita área del cuadrado
		translate([0, (luzWBig/2 + luzWBigT/2)-0.5, -0.1])
		creaGuiaTornilloCentrada();
	}
}

module crearAreaLuz(){
	cylinder(r=(luzWBig/2)+pared,luzHBig+luzHRosca+pared);
	translate([0, (luzWBig/2 + luzWBigT/2)-0.5, 0])
	creaGuiaTornilloCentradaArea();
}

module crearBaseAdqLuz(){
	difference(){
		//Toda el área de trabajo
		crearAreaLuz();

		//Cilindro para que entre lente adquicisión de luz
		translate([0, 0, -0.1])
		cylinder(r=luzWBig/2,luzHBig+0.2);

		//Espacio para que entre el tornillo
		translate([0, (luzWBig/2 + luzWBigT/2)-0.5, -0.1])
		creaGuiaTornilloCentrada();
	
		//Espacio para que entre la rosca
		translate([0, 0, luzHBig])
		cylinder(r=luzWRosca/2,luzHRosca+0.2);

		//Área donde sienta el lente y sirve para bloquear la 
		//luz de las paredes
		translate([0, 0, luzHBig+luzHRosca])
		cylinder(r=(luzWRosca/2)-1,mcH);
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