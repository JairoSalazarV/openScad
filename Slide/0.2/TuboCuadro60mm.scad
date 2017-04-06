include <../../Spectometer/72mm/V0.1/Diffracter.scad>
include <../../Spectometer/72mm/V0.1/Frame.scad>
include <../../library.scad>
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

tuboH = 60;
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


if( 1 )
{
    creaTubo();
    
    //creaPuentes();
    

  
}

bridgeD = 5;
bridgeW = 8.3;
module creaPuentes()
{
    translate([-(coberW/2)+3.5,(coberW/2),1])
    rotate([90,0,0])
    cylinder( r=1, coberW );
    
    translate([-(coberW/2)+3.5,(coberW/2),tuboH-1])
    rotate([90,0,0])
    cylinder( r=1, coberW );
    
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
 translate([-(bigW+2)/2,-(bigW+2)/2,tuboH-3])
 cube([bigW+2,bigW+2,40]);
     
 translate([-(bigW+2)/2,-(bigW+2)/2,-40+coberH-3])
 cube([bigW+2,bigW+2,40]);

 //Tornillos
 tornPass();

 }

 //TuboExterno
 difference()
 {
  translate([-(coberW)/2,-(coberW)/2,0])
  %cube([coberW,coberW,tuboH]);
  

 }

}

puentCuW = tuboRadio*1.85;
module areaExterna()
{
    //Cobertura
    translate([-coberW/2,-coberW/2,0])
    cube([coberW,coberW,coberH]);

    translate([-coberW/2,-coberW/2,tuboH-coberH])
    cube([coberW,coberW,coberH]);
    
    //translate([0,-puentCuW/2,0])
    //cube([coberW/2,puentCuW,tuboH]);

}

module tornPass()
{
translate([-ori+4,-ori+4,-0.1])
cylinder(r=torrRadio,tuboH*1.1);
translate([ori-4,-ori+4,-0.1])
cylinder(r=torrRadio,tuboH*1.1);
translate([-ori+4,ori-4,-0.1])
cylinder(r=torrRadio,tuboH*1.1);
translate([ori-4,ori-4,-0.1])
cylinder(r=torrRadio,tuboH*1.1);
}

module creaRosca()
{
huyoMasPared(roscaDiam,roscaPared,roscaH,center=true, $fn=100);
huyoMasPared(roscaDiam-1,roscaPared,0.75,center=true, $fn=100);
translate([0,0,3])
thread_in_pitch(roscaDiam,7,1.5);
}

