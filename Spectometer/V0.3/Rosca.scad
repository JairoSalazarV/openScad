include <ScrewsAndNuts/ISOThreadLeg.scad>
include <../../library.scad>
include <Tubo.scad>


roscaDiam = 11;//Tubo de la rosca
roscaH=24;//ALtura del tubo de la rosca
roscaPared=3;//Pared del tubo de la rosca
roscaSurcoW = 70;
roscaSurcoH = 6;

tapaRadio = tuboRadio + 7;
tapaSellRadio = tuboRadio-4;
tapaSellW = 5;
tapaSellH = 4;


//Tapa
difference()
{
  //Ceja para tapar
  translate([-(bigW+6)/2,-(bigW+6)/2,0])
  cube([bigW+6,bigW+6,2.9]);

  //Tornillos
  translate([0,0,-5])
  tornPass();
}


difference()
{

 translate([-(bigW-2)/2,-(bigW-2)/2,0])
 cube([bigW-2,bigW-2,roscaSurcoH]);

 translate([0,0,-0.1])
 cylinder(r=roscaDiam/2,roscaSurcoH+0.2);

 translate([0,0,3])
 huyoMasPared((tapaSellRadio*2),tapaSellW,tapaSellH+0.2);

 translate([0,0,3])
 huyoMasPared((roscaDiam*2)+1,11,tapaSellH+0.2);

 //Tornillos
 translate([0,0,-5])
 tornPass();

}


translate([0,0,roscaH])
rotate([0,180,0])
creaRosca();

module creaRosca()
{
huyoMasPared(roscaDiam,roscaPared,roscaH,center=true);
huyoMasPared(roscaDiam-0.8,roscaPared,0.75,center=true);
translate([0,0,3])
thread_in_pitch(roscaDiam,7,0.9);
}