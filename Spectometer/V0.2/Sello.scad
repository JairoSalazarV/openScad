include <Diffracter.scad>
include <../../libraty.scad>



translate([0,0,6])
rotate([0,180,0])
Camara();


difference()
{

translate([15,0,-20])
rotate([0,-31.5,0])/*3.15 cada 100 (antes 40)*/
huyoMasPared(45.7,3,80);

translate([-bigW/2,-bigW/2,-46.9])
cube([bigW*2,bigW*2,50]);

}



module Camara(){


difference(){

//Crear bloque
creaBloqueCam();

//Tornillos abajo
translate([-ori+4,-ori+4,-0.1])
cylinder(r=1.5,30);
translate([ori-4,-ori+4,-0.1])
cylinder(r=1.5,30);
translate([-ori+4,ori-4,-0.1])
cylinder(r=1.5,30);
translate([ori-4,ori-4,-0.1])
cylinder(r=1.5,30);

//Área del diffractor
translate([-17.5,-12,-5])
cube([35,24,30]);


}






}


module tornCam(){
//Tornillos camara
translate([-10,11,-0.1])
cylinder(r=2,30);
translate([10,11,-0.1])
cylinder(r=2,30);
translate([-10,-1,-0.1])
cylinder(r=2,30);
translate([10,-1,-0.1])
cylinder(r=2,30);
}


module creaBloqueCam(){
//Bloque
translate([-bigW/2,-bigW/2,0])
cube([bigW,bigW,3]);

//Sello
cylinder(r=(raspSellR/2)-0.5,6);


}








