batX = 22.4;//Ancho frente
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
torH = 18+pared;


//tripod

camNonTripod();

translate([mainAreaX-1,0/*(pared2+batY-20)/2*/,(mainAreaZ/2)-10])
tripodHole();









module tripodHole()
{
difference()
{
cube([4.5+pared+1,pared2+batY,20]);
translate([pared+0.6,(pared2+batY)/2,10])
rotate([0,90,0])
cylinder(r=3,5);
}
}

module camNonTripod()
{
	baseConHome();
	translate([32,0,52])
	camHole();
}

module baseConHome()
{
	difference()
	{
		baseSinHole();

		translate([22,-1,42])
		cube([20,20,20]);
	}
}

module camHole()
{
	difference()
	{
		translate([-20,0,-20])
		cube([40,6,40]);

		translate([-4.5,-0.1,-4.5])
		cube([9,9,9]);
	}
}

module baseSinHole()
{
difference()
{
	baseHoles();

	translate([medPared,batY+pared,pared])
	doTop();	
}
}

module doTop()
{
	cube([
			mainAreaX-pared,
			pared+0.1,
			mainAreaZ-pared2+medPared
	  	]);
}

module baseHoles()
{
	difference()
	{
		baseBatTorn();
		raspHoles();
	}
}


module raspHoles()
{

	posIni = torH-pared-4;

	translate([-3,posIni,32-4.5])
	cube([pared2,9,9]);

	translate([-3,posIni,54-8-2])
	cube([pared2,8,18]);

	translate([-3,posIni,75-4.5-2])
	cube([pared2,7,11]);

}

module baseBatTorn()
{


difference()
{
	cube([
			mainAreaX,
			mainAreaY,
			mainAreaZ
	  	]);

	translate([pared+0.1,pared+0.1,-0.1])
	cube([
			mainAreaIntX,
			mainAreaIntY,
			mainAreaIntZ
	  	]);

}

//Ceja horizontal
translate([cejaHorPosX,0,0])
cube([batX+pared,pared+2,pared]);

//Ceja vertical
translate([cejaVertPosX,0,0])
cube([pared+2,pared2+batY,pared]);

//Tornillos
translate([x1,0,z1])
tornCyl();
translate([x2,0,z1])
tornCyl();
translate([x1,0,z3])
tornCyl();
translate([x2,0,z3])
tornCyl();

}











module tornCyl()
{
	rotate([-90,0,0])
	{
		difference()
		{
			cylinder(r=3.5,torH);
			translate([0,0,(torH/2)+1])
			cylinder(r=2,torH/2);
		}
	}
}





//batPosX = mainAreaX-pared-batX;
//translate([batPosX,pared,pared])
//cube([batX,batY,batZ]);