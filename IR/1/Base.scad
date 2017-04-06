pared = 3;
raspW = 84.5;
raspH = 56;


//Tornillos
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



difference()
{
cube([raspW,raspH,pared]);
raspTornillos();
}










module raspTornillos()
{
	translate([x1,y1,-0.1])
	cylinder(r=raspTor,(pared*2));

	translate([x2,y2,-0.1])
	cylinder(r=raspTor,(pared*2));

	translate([x3,y3,-0.1])
	cylinder(r=raspTor,(pared*2));

	translate([x4,y4,-0.1])
	cylinder(r=raspTor,(pared*2));
}