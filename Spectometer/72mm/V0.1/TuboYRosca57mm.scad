include <Diffracter.scad>
include <Frame.scad>
include <../../../library.scad>
include <./ScrewsAndNuts/ISOThreadLeg.scad>

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

tuboH = 57;
tuboRadio = selloHembraRadio-1.5;
tuboConoH = 25;

roscaDiam = 11;//Tubo de la rosca
roscaH=24;//ALtura del tubo de la rosca
roscaPared=7;//Pared del tubo de la rosca
roscaSurcoW = 70;
roscaSurcoH = 6;

//pataW = 11;
//pataH = 16;
//pataPared = 4;




//**************************
//Activate this to display
//**************************
if(true)
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
 cylinder(r=tuboRadio-3,tuboH+0.2, $fn=100);

 }

 //Pata del tubo
 //translate([27,-pataH/2,tuboH-pataPared])
 //cube([pataW,pataH,pataPared]);

 //TuboExterno
 difference()
 {
  cylinder(r=tuboRadio,tuboH, $fn=100);
  
  translate([0,0,-0.1])
  cylinder(r=tuboRadio-3,tuboH+0.2, $fn=100);
 }

 //Rosca
 translate([0,0,tuboH+roscaH-3])
 creaRosca();

 //Cono
 createCono();

}

//createCono();

module createCono()
{
 difference()
 {
   //Crea área de conoi
   translate([0,0,tuboH-0.1])
   cylinder (r1=tuboRadio, r2=roscaDiam-roscaPared-1.3, h=roscaH+9, $fn=100);

   //Quita la tapa
   translate([0,0,tuboH+roscaH-0.1])
   cylinder(r=15,20);

   //Quita el centro
   translate([0,0,tuboH-0.2])
   cylinder(r=roscaDiam-roscaPared+2,roscaH+0.3, $fn=100);

   //Hace hueco para que se quede la parede del cono
   translate([0,0,tuboH-0.2])
   cylinder (r1=tuboRadio-3, r2=roscaDiam-11, h=roscaH+9, $fn=100);

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

module creaRosca()
{
huyoMasPared(roscaDiam,roscaPared,roscaH,center=true, $fn=100);
huyoMasPared(roscaDiam-1,roscaPared,0.75,center=true, $fn=100);
translate([0,0,3])
thread_in_pitch(roscaDiam,7,1.5);
}

