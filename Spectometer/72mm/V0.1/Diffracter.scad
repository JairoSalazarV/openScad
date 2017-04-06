//include <Tapa.scad>
include <../../../library.scad>


bigW = 88;
ori = bigW/2;
raspSellR = 59;
tuboH = 140;
H = 18.5;
selloH = 7;
tornR = 2;

huecoPared = 12;
huecoH = 22;
selloHembraRadio=40;

//Activate this to display
if(false)
{
translate([0,0,bigW/2])
rotate([0,90,0])
diffracter();


//soporteCylinder(radio=25.2,altura=3.8);

}


module diffracter(){	

difference(){

//Bloque
translate([-bigW/2,-bigW/2,0])
cube([bigW,bigW,H]);


translate([
						-(bigW-huecoPared)/2,
						-(bigW-huecoPared)/2,
						(huecoH/2)
					])
		cube([
					bigW-huecoPared,
					bigW-huecoPared,
					H-huecoH]
				);


//Diffractador
translate([-37.25,-40,-0.1])
cube([74.5,80,5.6]);

//Macro
translate([0,0,5.4])
cylinder(r=(74.5/2),8.2);

//Sello de raspberry
//translate([0,0,-0.1])
//cylinder(r=(raspSellR/2)+1,2);

//Tubo
//translate([0,0,-0.1])
//cylinder(r=(52/2),200);

//Tornillos abajo
translate([-ori+4,-ori+4,-0.1])
cylinder(r=tornR,20);
translate([ori-4,-ori+4,-0.1])
cylinder(r=tornR,20);
translate([-ori+4,ori-4,-0.1])
cylinder(r=tornR,20);
translate([ori-4,ori-4,-0.1])
cylinder(r=tornR,20);

//Hueco
cylinder(r=35.5,H+1);

//Tornillos caja
translate([0,0,(tuboH/2)-7])
rotate([0,90,0])
tornillosArriba();

//Tornillo tripie
translate([-ori-0.1,0,(tuboH/2)+7])
rotate([0,90,0])
cylinder(r=5/2,5.31);

//Sello hembra
translate([0,0,H-3])
cylinder(r=selloHembraRadio,4);

}

//Sello cobertura
//translate([0,0,H-1])
//huyoMasPared(58,3,3);


}




