batX = 0;//22.4Ancho frente
batY = 21.4;//Alto frente
batZ = 90.5;//Profundo


pared = 4;
pared2 = 2*pared;
medPared = pared/2;

raspX = 58;
raspY = 18;
raspZ = 84.5;

h = batY+pared2;

mainAreaX = raspX+batX+pared2; 
mainAreaY = batY+pared2;
mainAreaZ = batZ+pared+5+4;

mainAreaIntX = mainAreaX-pared2;
mainAreaIntY = mainAreaY-pared;
mainAreaIntZ = mainAreaZ-pared;

x1 = pared+3.5;
z1 = 23.6;
x2 = x1+50;
x3 = pared+3.5;
z3 = 81.9;

cejaHorPosX = mainAreaX-batX-pared;
cejaVertPosX = mainAreaX-pared-2;
torH = batY+pared;


rotate([90,0,90])
doALl();



module doALl(){
difference()
{
	translate([medPared,0,pared])
	doTop();	

	translate([0,-1,0])
	baseBatTorn(2.5);

	translate([0,2,0])
	baseBatTorn(4);

}
}

module doTop()
{
	translate([2,0,-4])
	cube([
			mainAreaX-pared-6.2,
			pared+0.1,
			mainAreaZ-pared2+medPared
	  	]);
	cube([
			mainAreaX-pared,
			pared+0.1,
			mainAreaZ-pared2+medPared
	  	]);
}



module baseBatTorn(r)
{
//Tornillos
translate([x1,0,z1])
tornCyl(r);
translate([x2,0,z1])
tornCyl(r);
translate([x1,0,z3])
tornCyl(r);
translate([x2,0,z3])
tornCyl(r);
}











module tornCyl(rad)
{
	rotate([-90,0,0])
	{
		cylinder(r=rad,torH);
	}
}

