include <Camara.scad>

//lupa
lupaW = 54.4+6;

//bc=Base de cámara
bcW = lupaW+10;
bcH = lupaW+5;
bcD = 10;

//rb=Raspberry atrás
rbW=87 + 6;
rbH=25;
rbD=bcD;
rbPared = 2;

rbConnW = 60;
rbConnH = 19;

//brt=base rosca tubo
brtPared = 4;

cableW = 20;


createBaseTrasera();




module createBaseTrasera(){


difference(){
createBaseAtras();

//Rosca de tubo
translate([0,0,brtPared])
cylinder(r=lupaW/2,20);

//Area de cámara
//translate([-camW/2,-10,brtPared-0.2])
//createCamara();


//Cajara rasp atrás
translate([-rbW/2+rbPared,(-bcH/2)-rbH+0.1+rbPared,rbPared+0.1])
cube([rbW-(2*rbPared),rbH-(2*rbPared),rbD-rbPared]);

//Tornillos para camara
translate([-12.6,-10,5-3])
createCamTornillos();


//Quita ranura cable
translate([-cableW/2,-bcW/2-(cableW/2),5])
cube([cableW,cableW,1.5]);

//Tornillos de la caja
translate([-rbW/2-5,(-bcW/2)-rbH/2.5,5])
rotate([0,90,0])
cylinder(r=1,10);

translate([rbW/2-5,(-bcW/2)-rbH/2.5,5])
rotate([0,90,0])
cylinder(r=1,10);	

translate([rbW/2-7,(-bcW/2)+5,5])
rotate([90,0,0])
cylinder(r=1,30);

translate([-rbW/2+7,(-bcW/2)+5,5])
rotate([90,0,0])
cylinder(r=1,30);

translate([0,(-bcW/2)-(rbH/2),5])
rotate([90,0,0])
cylinder(r=1,15);

translate([-18,-bcW+(rbH/2)+rbPared+1,-1])
cube([rbConnW,rbConnH,10]);

}

}



	



module createBaseAtras(){

//Caja rasp atrás
translate([-rbW/2,(-bcH/2)-rbH+0.1,0])
cube([rbW,rbH,rbD]);

//Portacamara
translate([-bcW/2,-bcH/2,0])
cube([bcW,bcH,bcD]);

}








