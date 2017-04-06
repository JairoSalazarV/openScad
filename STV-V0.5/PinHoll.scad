include <Tubo.scad>
include <Camara.scad>


pared = 4;
tapaW = 25.5;
tapaFibH = 12.75+2+8.8;
fibW=9.5;

difference(){
//Pared
cylinder(
			r=((tapaW+pared)/2),
			tapaFibH
		 );
//Hueco
translate([0,0,12.75])
cylinder(r=tapaW/2,tapaFibH);
//Fibra óptica space
translate([0,0,-0.1])
cylinder(r=fibW/2,tapaFibH);

}

translate([0,0,tapaFibH-1.5])
createRosca(tapaW,0.5,0.7);

module createRosca(w,h,l){
	difference(){
	cylinder(r=((w+1)/2),h);
	translate([0,0,-0.1])
	cylinder(r=(w-l)/2,h+0.2);
	}
}







