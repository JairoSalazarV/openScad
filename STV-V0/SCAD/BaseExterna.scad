include <settingsLenghts.scad>


/////////////////////////////////////
tmpWExt = mcW+pared+1;
espW = 3;

difference(){
	//Pone el cilindro principal
	cylinder(r=tmpWExt,cejaH-0.4);

	//Quita centro
	translate([0,0,-0.1])
	cylinder(r=tmpWExt-pared,cejaH);

	
	translate([-espW/2,-tmpWExt,-0.1])
	cube([espW,tmpWExt*2+1,cejaH]);
}