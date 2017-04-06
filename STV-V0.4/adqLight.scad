include <./aux/creaBase.scad>


frenteH = 19;
frenteCeja = 4.5;
frenteCejaH = 3;

squareW = 6;


//adqSquAndTop();



module adqSquAndTop(){

	adqAndSquare();

	translate([0,0,40])
	frenteTapa();
}






module frenteTapa(){

	difference(){
		//Pared
		difference(){
			cylinder(r=17,5);
			translate([0,0,-0.1])
			cylinder(r=12,8);
		}
		//Ceja
		translate([0,0,-0.1])
		difference(){
			cylinder(r=18,3);
			translate([0,0,-0.1])
			cylinder(r=14,3.1);
		}
	}

}







module adqAndSquare(){

	difference(){
		translate([0,0,4.8])
		cylinder(r=17,frenteH);
		cylinder(r=14,frenteH*2);
	}

	//Rosca lente
	difference(){
		cylinder(r=17,5);
		//Lente rosca
		translate([0,0,-0.1])
		cylinder(r=12.5,7);
	}
}