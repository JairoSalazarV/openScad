


pared=4.5;
diffLado = 8;
fibOpPlug = 12.75;
frenteH = 85+3+fibOpPlug;
diffW = 51;
torHemW=8;
fibW=9.5;
torHemOffset = (diffW/2)-
				  (torHemW/2);

difference(){
//Area
frenteArea();
//Hueco
translate([(pared/2)+.5,(pared/2)+.5,pared])
cube([diffW-1,diffW-1,frenteH]);
//Diffracter
translate([pared/2,pared/2,frenteH-3])
cube([diffW,diffW,4]);


//Plug base
translate([
				pared+diffLado+2,
				diffW/2,
				-0.1
			])
cylinder(r=(fibW/2)+1,fibOpPlug+0.2);
}


module frenteArea(){
//Cuadro
cube([
		diffW+pared,
		diffW+pared,
		frenteH
	]);
//Tornillos hembra
//translate([
//				(diffW/2)+(pared/2),
//				-(torHemW/2)+1,
//				frenteH-torHemW])
//tornHemBase();

translate([
				(diffW/2)+(pared/2),
				(diffW+(2*pared)-1),
				frenteH-torHemW])
tornHemBase();

translate([
				-(torHemW/2)+1,
				(diffW/2)+(pared/2),
				frenteH-torHemW])
tornHemBase();
translate([
				diffW+(torHemW/2)+(pared/2),
				(diffW/2)+(pared/2),
				frenteH-torHemW])
tornHemBase();



}

translate([
				pared+diffLado+2,
				diffW/2,
				0
			])
plugBase();

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
translate([0,0,-0.1])
cylinder(r=3.5/2,torHemW+0.2);

}
}








