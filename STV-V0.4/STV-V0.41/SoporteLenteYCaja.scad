include <Camara.scad>

//lupa
lupaW = 54.4+6;

//bc=Base de cámara
bcW = lupaW+10;
bcH = lupaW+5;
bcD = 6;

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



//createSoporteLenYCaj();


module createSoporteLenYCaj(){

createBaseDelantera();


//Separation
translate([0,0,2.5])
difference(){
cylinder(r=lupaW/2,1.5);

translate([0,0,-0.2])
cylinder(r=((lupaW/2)-1.3),rbD+2);
}
}



module createBaseDelantera(){


difference(){
createBaseAdelante();

//Rosca de tubo
translate([0,0,-0.2
])
cylinder(r=lupaW/2,15);


//Tornillos de la caja
translate([-rbW/2-5,(-bcW/2)-rbH/2.5,4])
rotate([0,90,0])
cylinder(r=1,10);

translate([rbW/2-5,(-bcW/2)-rbH/2.5,4])
rotate([0,90,0])
cylinder(r=1,10);	

translate([rbW/2-7,(-bcW/2)+5,4])
rotate([90,0,0])
cylinder(r=1,30);

translate([-rbW/2+7,(-bcW/2)+5,4])
rotate([90,0,0])
cylinder(r=1,30);

translate([0,(-bcW/2)-(rbH/2),4])
rotate([90,0,0])
cylinder(r=1,15);

//Área de raspberry
translate([-rbW/2+rbPared,-bcH+(rbH/2)-rbPared,rbPared])
cube([rbW-(rbPared*2),rbH-(rbPared*2),10]);

}

}



	



module createBaseAdelante(){

//Caja rasp atrás
translate([-rbW/2,(-bcH/2)-rbH+0.1,0])
cube([rbW,rbH,rbD]);

//Portacamara
translate([-bcW/2,-bcH/2,0])
cube([bcW,bcH,bcD]);

}








