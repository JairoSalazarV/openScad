include <Diffracter.scad>
include <Frame.scad>
include <../../library.scad>

// 3.15° for every 100 l/mm

angulo = 31.5;

coberW = bigW+6;
coberH = 6;
coberOffset = 2.3;//Posición del tubo
coberOffset2 = -7;//Altura del tubo
cobeSellH = 4;
cobeSellW1 = 7;
cobeSellW2 = 7;

torrRadio = 2;





//soporteCylinder(radio=29,altura=coberH);	
//soporteOval(ancho=28, largo=25, alto=coberH);
//soporteCylinder(radio=34,altura=coberH);
//frameSello();


difference()
{
areaExterna();

//Tubo Interno
translate([15-coberOffset,0,-14.1+coberOffset2])
rotate([0,-angulo,0])//3.15 cada 100 (antes 40)
cylinder(r=(45.7)/2,52);

//Cuadro de la pared
creaContorno();
translate([-bigW/2,-bigW/2,-40+coberH-6])
cube([bigW,bigW,40]);

//Tornillos
tornPass();

//Contorno
creaContorno();

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

//TuboExterno
translate([13-coberOffset,0,-12.5+coberOffset2])
rotate([0,-angulo,0])/*3.15 cada 100 (antes 40)*/
cylinder(r=(45.7+6)/2,48);
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

