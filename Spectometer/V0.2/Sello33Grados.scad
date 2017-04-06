include <Diffracter.scad>
include <../../libraty.scad>

// 3.15° for every 100 l/mm

angulo = 33;

difference()
{
translate([0,0,6])
rotate([0,180,0])
Camara();

cilindroRotado();

}


selloArea();







module cilindroRotado()
{

  difference()
  {
    translate([14,0,-10])
	{
    rotate([0,-angulo,0])/*3.15 cada 100 (antes 40)*/
    cylinder(r=46/2,100);
	}

	translate([-bigW/2,-bigW/2,-44.5])
  	cube([bigW*2,bigW*2,50]);

  }

  
}


module selloArea()
{
difference()
{

translate([10,0,-10])
rotate([0,-angulo,0])/*3.15 cada 100 (antes 40)*/
huyoMasPared(45.7,3,42);
translate([-bigW/2,-bigW/2,-46.9])
cube([bigW*2,bigW*2,50]);

}
}



module Camara(){


difference(){

//Crear bloque
creaBloqueCam();

//Tornillos abajo
translate([-ori+4,-ori+4,-0.1])
cylinder(r=2.5,30);
translate([ori-4,-ori+4,-0.1])
cylinder(r=2.5,30);
translate([-ori+4,ori-4,-0.1])
cylinder(r=2.5,30);
translate([ori-4,ori-4,-0.1])
cylinder(r=2.5,30);

//Área del diffractor
translate([-17.5,-12,-5])
cube([35,24,30]);


translate([0,0,-0.5])
cylinder(r=23,5);

translate([6,0,-0.5])
cylinder(r=21,5.1);

translate([-5,0,-0.5])
cylinder(r=22,5.1);

}






}

module recorteAngular()
{

difference()
{
//Área 2 del diffractor
translate([18,0,-20])
rotate([0,-angulo,0])
cylinder(r=22,50);

translate([-50,-50,1.5])
cube([100,100,100]);

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
cylinder(r=(raspSellR/2)-1,5.5);


}








