include <Camara.scad>
include <SoporteLenteYCaja.scad>


tuboH = 50;

tuboRadio = (lupaW-1)/2;


//Tubo
difference(){

cylinder(r=tuboRadio,tuboH);

translate([0,0,1
])
cylinder(r=(tuboRadio)-rbPared,tuboH+2);

//Apertura
translate([-3,-3,-0.1])
cube([6,6,6]);

}

