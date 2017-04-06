include <Camara.scad>


difference(){

translate([-13,-4.5,1])
cube([26,19,1.5]);

//Tornillos camara
translate([-10,12,-0.1])
cylinder(r=2,30);
translate([10,12,-0.1])
cylinder(r=2,30);
translate([-10,-1,-0.1])
cylinder(r=2,30);
translate([10,-1,-0.1])
cylinder(r=2,30);

}

