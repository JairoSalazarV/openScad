

bigW = 70;
ori = bigW/2;
raspSellR = 59;
tuboH = 140;
H = tuboH+2+8+1+2;
selloH = 7;

huecoPared = 12;
huecoH = 22;

translate([0,0,bigW/2])
rotate([0,90,0])
bigTuboHueco();

module bigTuboHueco()
{
	difference()
	{
		bigTubo();	
		sello();
	}
}


module sello()
{
	translate([0,0,H-selloH])
	cylinder(r=(raspSellR/2)+0.2,selloH+0.1);
	
	translate([0,0,H-selloH-30])
	cylinder(r=(raspSellR/2)-2,selloH+40);
}


module bigTubo(){

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


//Rosca tornillo tripie
difference(){
translate([-ori+1.5,0,(tuboH/2)+7])
rotate([0,90,0])
cylinder(r=5,1);

translate([-ori+1.4,0,(tuboH/2)+7])
rotate([0,90,0])
cylinder(r=5-3,3);


}

}

module tornillosArriba(){
translate([-ori+4,-ori+4,ori-7])
cylinder(r=2,10);
translate([0,-ori+4,ori-7])
cylinder(r=2,10);
translate([-ori+4,ori-4,ori-7])
cylinder(r=2,10);
translate([0,ori-4,ori-7])
cylinder(r=2,10);
}


module tornilloTripie(){
	
}



