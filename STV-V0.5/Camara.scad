include <Tubo.scad>



//translate([0,0,30])
//bigTubo();

Camara();




module Camara(){

//Alsa para cámara
//translate([-12.5,-10,5])
//cube([25,24,2]);

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

//Tubo para camara
translate([0,0,2])
cylinder(r=(raspSellR/2)-3,18);

//Ranura cable
translate([-10,-ori-5,9])
cube([20,20,1]);

}


difference(){

translate([-13,-4.5,1])
cube([26,19,4]);

tornCam();
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
cube([bigW,bigW,16]);

//Sello
cylinder(r=(raspSellR/2)-0.5,18);


}








