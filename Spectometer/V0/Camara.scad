


pared=4.5;
diffLado = 8;
fibOpPlug = 12.75;
frenteH = 50+pared;
diffW = 51;
torHemW=8;
fibW=9.5;
torHemOffset = (diffW/2)-
				  (torHemW/2);



difference(){
translate( [
				-((diffW+pared)/2),
				-((diffW+pared)/2),
				0
			] )
carcaza();

translate([-17/2,-13.5/2,-0.1])
cube([10,12,7]);

}



portaTornillos();

translate([0,0,50])

difference(){
camCejaArea();
translate([
-((diffW-pared)/2),
-((diffW-pared)/2),
-0.1
])
cube([
		(diffW-pared),
		(diffW-pared),
		10
	]);
}





module camCejaArea(){
	translate([
				-(diffW+pared-1)/2,
				-(diffW+pared-1)/2,
				0
				])
	cube([
			(diffW+pared-1),
			(diffW+pared-1),
			pared
		  ]);
	translate([
				-(diffW-1)/2,
				-(diffW-1)/2,
				0
				])
	cube([
			(diffW-1),
			(diffW-1),
			pared+2
		  ]);
}



module portaTornillos(){

translate([-15,-15,0])
tornillo();
translate([-15,15,0])
tornillo();
translate([15,-15,0])
tornillo();
translate([15,15,0])
tornillo();

}


module tornillo(){

difference(){	
cylinder(r=4,15+pared);
translate([0,0,pared])
cylinder(r=3/2,15+0.1);
}

}






module carcaza(){
difference(){
//Area
frenteArea();
//Hueco
translate([(pared/2)+.5,(pared/2)+.5,pared])
cube([diffW-1,diffW-1,frenteH]);

}
}


module frenteArea(){
//Cuadro
cube([
		diffW+pared,
		diffW+pared,
		frenteH
	]);
//Tornillos hembra
translate([
				(diffW/2)+(pared/2),
				-(torHemW/2)+1,
				frenteH-torHemW])
tornHemBase();

translate([
				(diffW/2)+(pared/2),
				(diffW+(2*pared)-1),
				frenteH-torHemW])
tornHemBase();

//translate([
//				-(torHemW/2)+1,
//				(diffW/2)+(pared/2),
//				frenteH-torHemW])
//tornHemBase();
translate([
				diffW+(torHemW/2)+(pared/2),
				(diffW/2)+(pared/2),
				frenteH-torHemW])
tornHemBase();



}



module plugBase(){
difference(){
cylinder(r=15/2,fibOpPlug);
translate([0,0,-0.1])
cylinder(r=fibW/2,fibOpPlug+0.2);

}
}

module tornHemBase(){
difference(){
translate([-torHemW/2,-torHemW/2,0])
cube([torHemW,torHemW,torHemW]);
translate([0,0,1])
cylinder(r=3/2,torHemW+1);

}
}








