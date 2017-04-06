include <Tubo.scad>
include <Camara.scad>

squareW = 6.4;
slideW = 1.2;
slideH = 17.9;

offSetX = 10;



slideAper();

//squareAper();



module roscaLenFrente(){
difference(){
cylinder(r=18/2,1);
translate([0,0,-0.1])
cylinder(r=(16.5/2),5);
}
}





module squareAper(){
difference(){
	//Área
	creaFrente();	
	//Aperture
	translate([
				-(squareW/2)-offSetX,
				-squareW/2,
				-0.1
				])
	cube([squareW,squareW,5]);
}

//Rosca lente frente
translate([0,0,6])
roscaLenFrente();

}


module slideAper(){
difference(){
	//Área
	creaFrente();	
	//Aperture
	translate([
				 -(slideW/2)-offSetX,
				 -(slideH/2),
				 -0.1
				])
	cube([slideW,slideH,5]);
}
//Rosca lente frente
translate([-offSetX,0,6])
roscaLenFrente();
}






module creaFrente(){
difference(){

//Área
creaBloqueSlide();

//Rosca
translate([-offSetX,0,2])
cylinder(r=18/2,20);

//Carcaza
translate([-offSetX,0,9])
cylinder(r=22/2,9);

//Tornillos
translate([-ori+4,-ori+4,-0.1])
cylinder(r=2,10);
translate([ori-4,-ori+4,-0.1])
cylinder(r=2,10);
translate([-ori+4,ori-4,-0.1])
cylinder(r=2,10);
translate([ori-4,ori-4,-0.1])
cylinder(r=2,10);

}
}


module creaBloqueSlide(){
//Bloque
translate([-bigW/2,-bigW/2,0])
cube([bigW,bigW,4]);

//Sello
translate([-offSetX,0,0])
cylinder(r=(26/2)-0.5,17);


}








