//include <settingsLenghts.scad>

//Ancho de la pared
pared  = 2;
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
//Ceja entre uniones de cilindros
cejaH = 6;


//
//Ancho de tubo principal (grande)
mcW = 32;//radio
mcH = 30;

//
//Adquisición de luz
luzHBig = 10; //donde va el tornillo
luzWBig = 27; //diametro donde va el tornillo
luzHBigT = 4; //alto del tornillo
luzWBigT = 6; //ancho del tornillo
luzHRosca = 7; //donde va la rosca
luzWRosca = 22; //diametro de donde va la rosca



//Cuadro guia para que no se mueva
guiaH = 10;
guiaW = 2.5;

module creaGuiaCentrada(){
	translate([-guiaW/2,-guiaW/2,h-guiaH])
	cube([guiaW,guiaW,guiaH]);
}

module creaGuiaTornilloCentrada(){
	translate([-luzWBigT/2,-luzWBigT/2,0])
	cube([luzWBigT,luzWBigT,luzHBig+0.2]);
}
module creaGuiaTornilloCentradaArea(){
	tmpW = luzWBigT + pared;
	tmpH = luzHBig  + pared;
	translate([-tmpW/2,-tmpW/2,0])
	cube([tmpW,tmpW,tmpH]);
}


/////////////////////////////////////

crearCilAdqLuz();
crearBaseAdqLuz();
translate([0,mcW-pared+0.1,mcH-guiaH])
creaGuiaCentrada();






module crearCilAdqLuz(){
	difference(){
		//Área grande
		cylinder(r=mcW,mcH);
		//Quita relleno para dejar pared
		translate([0,0,pared])
		cylinder(r=mcW-pared-1,mcH);		
		//Quita relleno para dejar pared
		translate([0,0,mcH-cejaH])
		cylinder(r=mcW-pared,cejaH+0.1);
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