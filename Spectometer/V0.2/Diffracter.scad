include <Tapa.scad>


bigW = 70;
ori = bigW/2;
raspSellR = 59;
tuboH = 140;
H = 12;
selloH = 7;

huecoPared = 12;
huecoH = 22;

//diffracter();



module diffracter(){


translate([0,0,10])

difference()
{
creaTapa();

translate([0,0,-0.1])
cylinder( r=21, 10 );

}

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
translate([-25.5,-25.5,-0.1])
cube([51,51,3.1]);

//Macro
translate([0,0,-0.1])
cylinder(r=(54.5/2),10);

//Sello de raspberry
translate([0,0,-0.1])
cylinder(r=(raspSellR/2),2);

//Tubo
translate([0,0,-0.1])
cylinder(r=(52/2),200);

//Tornillos abajo
translate([-ori+4,-ori+4,-0.1])
cylinder(r=2,10);
translate([ori-4,-ori+4,-0.1])
cylinder(r=2,10);
translate([-ori+4,ori-4,-0.1])
cylinder(r=2,10);
translate([ori-4,ori-4,-0.1])
cylinder(r=2,10);

//Hueco
//translate([0,0,2+8+1+2])
//cylinder(r=(raspSellR/2),tuboH+0.1);

//Tornillos arriba
translate([-ori+4,-ori+4,H-9])
cylinder(r=2,10);
translate([ori-4,-ori+4,H-9])
cylinder(r=2,10);
translate([-ori+4,ori-4,H-9])
cylinder(r=2,10);
translate([ori-4,ori-4,H-9])
cylinder(r=2,10);

//Tornillos caja
translate([0,0,(tuboH/2)-7])
rotate([0,90,0])
tornillosArriba();

//Tornillo tripie
translate([-ori-0.1,0,(tuboH/2)+7])
rotate([0,90,0])
cylinder(r=5/2,5.31);


}


}




