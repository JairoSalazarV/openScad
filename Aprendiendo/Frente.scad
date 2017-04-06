include <settingsLenghts.scad>


//Alto de la capa de apertura
aperH = 2;

h = 18; //Altura total


CrearFrente();





module CrearFrente(){
	difference(){
		cylinder(r=radioC+pared,h);

		translate([0,0,-1])
		cylinder(r=radioC,profDelante+1);

		cylinder(r=radioC-1.5,h);

		//Ranura
		//translate([-(aperW/2),-(aperW/2),profDelante-0.5])
		//cube([aperW,aperW,aperH+1]);

		translate([0,0,(profDelante+aperH)])
		cylinder(r=radioC,h);

	}
	
	translate([radioC+pared+1,0,0])
	creaGuiaCentrada();

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