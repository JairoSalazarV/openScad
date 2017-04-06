pared = 4;
pared2 = 2*pared;
h = 25;
raspW = 84.5;
raspH = 56;


//Tornillos
tornDeep = 7;
baseTor = 3+1;
raspTor = 1+1;
raspTorCeja = 4;
x1 = 23.5;
y1 = raspTorCeja;
x2 = x1;
y2 = raspH-raspTorCeja;
x3 = raspW-raspTorCeja;
y3 = raspTorCeja;
x4 = x3;
y4 = raspH-raspTorCeja;
camW=26;
camH=25;
alsaCamX = (raspW/2)+9;
alsaCamY = (raspH/2)-(5);

batW = 94.7;
batH = 23;
batD = 22;


translate([0,-raspH,0])
tornAndCam();

bateriaArea();



module tornAndCam()
{
	tapaRaspCam();
	guiaBaseTornillos(h);
}


module bateriaArea()
{
	difference()
	{
		translate([0,-0.5,0])
		cube([
				batW+pared2,
				batH+pared2,
				batD+pared2
			]);
		

		translate([
						-0.1,
						-0.6,
						pared]
					)
		cube([batW+1,batH+1,batD+pared+1]);


	}
}


module tapaRaspCam()
{	
	difference()
	{
	placaSolida(5);
	translate([46.5,30,-0.5])
	cube([10,10,20]);
	}
}


module placaSolida(h)
{
	translate([alsaCamX,alsaCamY,0])
	alsaCam(h);
	cube([raspW,raspH,pared]);
}

module guiaBaseTornillos(h)
{
	difference()
	{
	tornillosBase(h);
	translate([0,0,h-(tornDeep-0.2)])
	huevoTornillos(tornDeep);
	}
}


module tornillosBase(h)
{
	translate([x1,y1,0])
	cylinder(r=baseTor,h);

	translate([x2,y2,0])
	cylinder(r=baseTor,h);

	translate([x3,y3,0])
	cylinder(r=baseTor,h);

	translate([x4,y4,0])
	cylinder(r=baseTor,h);
}

module huevoTornillos(h)
{
	translate([x1,y1,-0.1])
	cylinder(r=raspTor,h);

	translate([x2,y2,-0.1])
	cylinder(r=raspTor,h);

	translate([x3,y3,-0.1])
	cylinder(r=raspTor,h);

	translate([x4,y4,-0.1])
	cylinder(r=raspTor,h);
}


module alsaCam(h)
{
difference(){

	translate([-13,-4.5,0])
	cube([camW,camH,h]);

	//Tornillos camara
	translate([-10,12,0.2])
	cylinder(r=1.7,h+1);
	translate([10,12,0.2])
	cylinder(r=1.7,h+1);
	translate([-10,-1,0.2])
	cylinder(r=1.7,h+1);
	translate([10,-1,0.2])
	cylinder(r=1.7,h+1);
}
}