include <Diffracter.scad>
include <Frame.scad>
include <../../../library.scad>

include <Letras.scad>

// 3.15° for every 100 l/mm

angulo = 35;

coberW = bigW+6;
coberH = 6;
coberOffset = 6;//Posición del tubo
coberOffset2 = -1;//Altura del tubo (-7)->(-8)
cobeSellH = 4;
cobeSellW1 = 7;
cobeSellW2 = 7;

torrRadio = 2;
conoRadio = 42;




//soporteCylinder(radio=29,altura=coberH);	
//soporteOval(ancho=28, largo=25, alto=coberH);
//soporteCylinder(radio=34,altura=coberH);
//frameSello();

if(true)
{
    creaSello();
}

//translate([-80,-20,cobeSellH+1])
//%cube([40,40,1]);



module creaSello()
{
    difference()
    {
    createAll();

    translate([-100,-100,-200])
    cube([200,200,200]);
    
    translate([-bigW*.38,-bigW*.52,coberH-0.5])
    logoSimple(13,2,2,4);

    }   
}

module createAll()
{

difference()
{
areaExterna();

//Tubo Interno
translate([23-coberOffset,0,-32.9+coberOffset2])
rotate([0,-angulo,0])/*3.15 cada 100 (antes 40)*/
cylinder (r1 = conoRadio, r2 = (51.7-6)/2, h = 70, $fn = 100);

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

}




module creaContorno()
{

 difference()
 {
   translate([-(coberW-4.5)/2,-(coberW-4.5)/2,-3])
   cube([(coberW-4.5),(coberW-4.5),coberH]);

   translate([-(coberW-15)/2,-(coberW-23)/2,-3])
   cube([(coberW-15),(coberW-23),coberH]);
 }
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
translate([23-coberOffset,0,-33+coberOffset2])
rotate([0,-angulo,0])/*3.15 cada 100 (antes 40)*/
//cylinder(r=(51.7)/2,48);
cylinder (r1 = conoRadio+3, r2 = 51.7/2, h = 70, $fn = 100);
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

