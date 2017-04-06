include <Tubo.scad>
include <Camara.scad>


pared = 4;
tapaW = 27;
tapaFibH = 10+8;
fibW=10;

//translate([0,0,22])
//rotate([0.0,180])
fibraOpt();




module fibraOpt(){
difference(){
cylinder(r=(tapaW/2)-1,2);
//Fibra óptica space
translate([0,0,-0.1])
cylinder(r=1.05,15);
}

}


