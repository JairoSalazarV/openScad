include <Diffracter.scad>
include <Frame.scad>
include <../../library.scad>
// 3.15° for every 100 l/mm




//-- Cono
//cylinder (r1 = 20, r2 = 0, h = 20, $fn = 100);

angulo = 31.5;

coberW = bigW+6;
coberH = 6;
coberOffset = 2.3;//Posición del tubo
coberOffset2 = -7;//Altura del tubo
cobeSellH = 4;
cobeSellW1 = 7;
cobeSellW2 = 7;

torrRadio = 2;

tuboH = 140;
tuboRadio = 30;
tuboConoH = 25;


if(false)
{
  creaTubo();
}

//soporteCylinder(radio=29,altura=coberH);	
//soporteOval(ancho=28, largo=25, alto=coberH);
//soporteCylinder(radio=34,altura=coberH);
//frameSello();

module creaTubo()
{
 difference()
 {
 areaExterna();

 //Cuadro de la pared
 //creaContorno();
 translate([-(bigW+2)/2,-(bigW+2)/2,-40+coberH-3])
 cube([bigW+2,bigW+2,40]);

 //Tornillos
 tornPass();

 //Hueco
 translate([0,0,-0.1])
 cylinder(r=tuboRadio-3,tuboH+0.2);

 }



 //TuboExterno
 difference()
 {
  cylinder(r=tuboRadio,tuboH);
  
  translate([0,0,-0.1])
  cylinder(r=tuboRadio-3,tuboH+0.2);
 }


 difference()
 {

 //Cuadro
 translate([0,0,tuboH-8])
 areaSelloCono()

 //Hueco
 //translate([0,0,tuboH-20])
 //cylinder(r=tuboRadio-3,30);

 //Hace cuadrado el cono
 translate([0,0,tuboH-40])
 rectanculando();

 //Tornillos
 translate([0,0,tuboH-20])
 tornPass();

 //Cobertura
 translate([-(bigW+1.5)/2,-(bigW+1.5)/2,tuboH-4])
 cube([bigW+1.5,bigW+1.5,40]);

 }

}


module rectanculando()
{
	translate([-130/2,-68,0])
	cube([130,30,50]);

	translate([-130/2,38,0])
	cube([130,30,50]);

	translate([-68,-70,0])
	cube([30,130,50]);

	translate([38,-70,0])
	cube([30,130,50]);
}

module areaSelloCono()
{

translate([-coberW/2,-coberW/2,0])
cube([coberW,coberW,8]);

//translate([0,0,-tuboConoH+4])
//cylinder (r1 = tuboRadio, r2 = 38, h = tuboConoH, $fn = 100);

}



//creaSelloMacho();






module creaContorno()
{

 difference()
 {
   translate([-(coberW-4.5)/2,-(coberW-4.5)/2,-3])
   cube([(coberW-4.5),(coberW-4.5),coberH]);

   translate([-(coberW-16)/2,-(coberW-25)/2,-3])
   cube([(coberW-16),(coberW-25),coberH]);
 }

/*
 translate([-(coberW-6)/2,-(coberW-6)/2,-3])
 cube([(coberW-6),8.8,coberH]);

 translate([-(coberW-5)/2,((coberW-5)/2)-8.5,-3])
 cube([(coberW-5),10,coberH]);

 translate([(-(coberW-5)/2),-((coberW-6)/2),-3])
 cube([5.5,(coberW-6),coberH]);

 translate([((coberW-5.5)/2)-5,-((coberW-6)/2),-3])
 cube([5.5,(coberW-6),coberH]);
*/
}



module creaSelloMacho()
{

 translate([0,0,coberH-cobeSellH])
 difference()
 {
  areaSello(frameD=cobeSellH);

  translate([-(frameW-cobeSellW1)/2,-(frameH-cobeSellW2)/2,-0.1])
  cube([frameW-cobeSellW1,frameH-cobeSellW2,cobeSellH+1]);
 }
}

module areaExterna()
{
//Cobertura
translate([-coberW/2,-coberW/2,0])
cube([coberW,coberW,coberH]);

}

module recorteOval()
{
  translate([-0.4,0,-1.9])
  oval(26.8,22.9, 15, center = false);
}

module tornPass()
{
translate([-ori+4,-ori+4,-0.1])
cylinder(r=torrRadio,30);
translate([ori-4,-ori+4,-0.1])
cylinder(r=torrRadio,30);
translate([-ori+4,ori-4,-0.1])
cylinder(r=torrRadio,30);
translate([ori-4,ori-4,-0.1])
cylinder(r=torrRadio,30);
}

