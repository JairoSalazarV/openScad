//Ancho de la pared
pared  = 3;
//Radio del centro hueco
radioC = 11;
//Alto de la capa de apertura
aperH = 2;
//Ancho de la apertura
aperW = 5;
//Ancho del lente macro
macroW = 10.1;
//Profundidad del macro
macroH = 3;
//Profundidad parte de atras y delante
profDelante = 6;
profAtras = 6;

h = 18; //Altura total

//translate([0,0,14])
//rotate([0,90,0])
CrearFrente();

module CrearFrente(){
	difference(){
		cylinder(r=radioC-0.1,h);


		//Ranura
		translate([-(aperW/2),-(aperW/2),-0.5])
		cube([aperW,aperW,aperH+1]);

		translate([0,0,aperH])
		cylinder(r=radioC-pared,h);

	}
}


//cilindroPared(profDelante+aperH+profAtras);
//apertura();

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
				cylinder(r=macroW,aperH,center=true);
			}
			cube([aperW,aperW,aperH+2],center=true);		
		}
	}
}