include <settingsLenghts.scad>


/////////////////////////////////////

delgadoH = 93;

aperW = 0.5;
aperH = 17.5;

cejaH = 7;//6+poquito

macroW = 21;//20:diametro
macroH = 11;

macroBaseW = 18;//17:diametro
macroBaseH = 6;
macroNoBaseH = macroH-macroBaseH;

tmpPared = pared*2;

crearBaseYTubo();

translate([
				0,
				0,
				delgadoH+luzHBig+luzHRosca+
				pared+(pared*2)+cejaH-0.2+macroH
			])
rotate([0,180,0])
crearBaseAdqLuz();

//Creamos cuadro de apertura
//tmpAperW = aperW+pared;
//tmpAperH = cejaH+delgadoH-0.2;
////translate([0,0,cejaH])
//difference(){
//
//	//Pared
//	translate([-tmpAperW/2,-tmpAperW/2,0])
//	cube([tmpAperW,tmpAperW,tmpAperH+cejaH]);
//
//	//Centro
//	translate([-aperW/2,-aperW/2,-0.1])
//	cube([aperW,aperW,tmpAperH+cejaH+0.2]);
//
//}

//Cerramos el hueco del cuadro de apertura
//translate([0, 0, cejaH])
//difference(){
//	cylinder(r=(luzWBig/2)+1,pared);
//	
//	//Apertura
//	translate([-aperW/2,-aperW/2,-0.1])
//	cube([aperW,aperW,tmpAperH+0.2]);
//}



module crearBaseAdqLuz(){
	
	difference(){
		//Toda el área de trabajo
		cylinder(
					r=(luzWBig/2)+pared,
					luzHBig+luzHRosca+pared+macroH
		  	 	 );

		//Cilindro para que entre lente 
		//adquicisión de luz
		translate([0, 0, -0.1])
		cylinder(r=luzWBig/2,luzHBig+0.1);

		//Espacio para que entre la rosca
		translate([0, 0, luzHBig-0.1])
		cylinder(r=luzWRosca/2,luzHRosca+0.1);
		
		//Área para que entre el macro forzado
		translate([0,0,
							luzHBig+
							luzHRosca-0.1])
		cylinder(r=macroW/2,macroNoBaseH);

		//Área de la base del macro
		translate([0,0,
							luzHBig+luzHRosca+
							macroNoBaseH-0.2
				   ])
		cylinder(r=macroBaseW/2,macroBaseH+0.1);


		//Apertura lineal		
		translate(
						[-aperW/2,
						 -aperH/2,
						 luzHBig+luzHRosca+
						 macroNoBaseH+macroBaseH-0.2
						]
					)
		cube([aperW,aperH,macroH]);


		//Área del tornillo
		translate([0,luzWBig/2,-0.1])
		creaGuiaTornilloCentrada();

	}
}

module crearBaseYTubo(){

	//Pone guia macho
	creaGuia(cejaH);

	//Pone la extensión
	translate([0,0,cejaH])
	creaPared(1);

	//Crea el techo
	translate([0,0,cejaH])
	difference(){
		cylinder(r=mcW,tmpPared);
		translate([0,0,-0.1])
		cylinder(r=(luzWBig/2)+pared,cejaH);
	}

	//Pone pared del cilindro grande	
	translate([0,0,cejaH])
	difference(){
		cylinder(
					r=(luzWBig/2)+pared,
					delgadoH+tmpPared+1
				 );
		translate([0,0,-0.1])
		cylinder(
					r=(luzWBig/2),
					delgadoH+tmpPared+1+0.2
				  );
	}

}

