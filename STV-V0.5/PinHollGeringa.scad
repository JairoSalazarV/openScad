include <Tubo.scad>
include <Camara.scad>

offsetW = 1;
pared = 4;
tapaW = 25.8;
fibW=9.5;
gomaW = 3.9+offsetW;
gomaH = 2.8;

jeringaW = 4.36+offsetW;
jeringaH = 8.8;
agujaH = 13-1.5;//-offset
lenteH = 8.8;

tapaFibH = agujaH+jeringaH+
			 gomaH+lenteH;


difference(){
//Pared
cylinder(
			r=((tapaW+pared)/2),
			tapaFibH
		 );
//Deja pared
translate([0,0,gomaH])
cylinder(
			r=(tapaW/2),
			tapaFibH+0.2
		 );
//Hueco de jeringa
translate([0,0,-0.1])
cylinder(
			r=jeringaW/2,
			tapaFibH+0.2
		 );
}


//Baía de jeringa
difference(){
	//Pared de jeringa
	cylinder(
				r=(
					jeringaW+
					pared)/2,
					(gomaH+jeringaH)
			  );
	//Hueco para jeringa
	translate([0,0,-0.1])
	cylinder(
				r=(gomaW)/2,
				(gomaH+jeringaH+0.2)
			  );
	//Hueco para goma
	translate([0,0,-0.1])
	cylinder(
				r=jeringaW/2,
				jeringaH
			  );
}



translate([0,0,tapaFibH-1.5])
createRosca(tapaW,0.5,1);

module createRosca(w,h,l){
	difference(){
	cylinder(r=((w+1)/2),h);
	translate([0,0,-0.1])
	cylinder(r=(w-l)/2,h+0.2);
	}
}







