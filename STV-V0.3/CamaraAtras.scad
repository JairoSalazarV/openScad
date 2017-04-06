include <settingsLenghts.scad>
include <creaJaulaBase.scad>


if(false){
	translate([-camW/2,-camH/2,0])
	%cube([camW,camH,camP]);
}

tmpHolg = 1.5;
camLog5MpW = 70+tmpHolg;//x
camLog5MpH = 30+tmpHolg;//y
camLog5MpD = 20;//z
camLog5MpLenX = camLog5MpW-17;
camLog5MpLenY = camLog5MpH-15;

//translate([-camLog5MpLenX,-camLog5MpLenY,tmpH])
//creaCamLog5MpArea();

tmpH = 3;

difference(){
	//Área gorda
	translate([0,0,camLog5MpD])
	rotate([0,180,0])	
	creaJaulaBaseEspecial();
	
	//Quita área de la cámara
	translate([-camLog5MpLenX,-camLog5MpLenY,tmpH+1])
	cube([camLog5MpW,camLog5MpH,camLog5MpD]);

	//Quita área de USB
	translate([-(camLog5MpW/2)+5,-3,-6])
	cube([18,9,20]);

	//Ahorra material
	translate([-70,18,tmpH])
	cube([120,10,50]);
	translate([-70,-28,tmpH])
	cube([120,9,50]);
	translate([-77,-25,tmpH])
	cube([18,50,50]);
	translate([21,-27,tmpH])
	cube([18,50,50]);
	translate([-69,-45,tmpH])
	cube([33,20,40]);
	translate([-23,-45,tmpH])
	cube([33,20,50]);
	translate([-69,25,tmpH])
	cube([33,20,40]);
	translate([-23,25,tmpH])
	cube([33,20,50]);
	translate([22,-50,tmpH])
	cube([33,100,50]);

}




module creaJaulaBaseEspecial(){

	creaJaulaBase(tmpH+camLog5MpD);

	translate([40,-40.5,0])
	cube(
				[
					22,
					camFrentH+varillaW+5,
					tmpH+camLog5MpD]);
	
	
}



module creaCamLog5MpArea(){
	cube([camLog5MpW,camLog5MpH,camLog5MpD]);

	//translate([camLog5MpLenX-2.5,camLog5MpLenY-2.5])
	//cube([5,5,camLog5MpD+2]);

}








