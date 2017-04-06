pared = 4;
pared2 = 2*pared;
medPared = pared/2;

ringRad = 51.4;//51.4
esqRad  = 3;

raspX = 57;//58
raspY = 86;//85
raspZ = 15.5;//15.5
raspD1 = 3.45;
raspDP = 22;
raspD2 = raspDP+pared2;//Altura lados
raspAlza = 2.6;

vidrioW = 26;
vidrioD = 0.5;

//translate([-2,-2,27])
tapa();

module tapa()
{

translate([16,40,0])
vidrio();

//translate([30,54.5,0])
//makeRing((ringRad/2),pared-1,pared+1);

difference()
{

hull()
{
	translate([medPared,medPared,0])
	cube([raspX,raspY,pared]);
	esquinas();
}

translate([30,54,-0.1])
cylinder(r=8,10);

translate([30,54,pared-2.7])
cylinder(r=ringRad/2,10);


translate([5.5,25.5,-2])
cylinder(r=2,10);

translate([54.5,25.5,-2])
cylinder(r=2,10);

translate([5.5,83.5,-2])
cylinder(r=2,10);

translate([54.5,83.5,-2])
cylinder(r=2,10);


translate([5.5,25.5,medPared])
cylinder(r=3.5,10);

translate([54.5,25.5,medPared])
cylinder(r=3.5,10);

translate([5.5,83.5,medPared])
cylinder(r=3.5,10);

translate([54.5,83.5,medPared])
cylinder(r=3.5,10);


}

}

module esquinas()
{
	translate([esqRad,esqRad,0])
	cylinder(r=3,pared);
	
	translate([raspX,esqRad,0])
	cylinder(r=3,pared);

	translate([esqRad,raspY,0])
	cylinder(r=3,pared);
	
	translate([raspX,raspY,0])
	cylinder(r=3,pared);

}

module vidrio()
{	
	difference()
	{
	cube([vidrioW+medPared,vidrioW+medPared,medPared+vidrioD]);
	
	translate([1,1,-0.1])
	cube([vidrioW,vidrioW,medPared+vidrioD+0.2]);
	
	}
}


module makeRing(hueco,pared,height)
{
	difference()
	{
		cylinder(r=hueco+pared,height);
		
		translate([0,0,-0.1])
		cylinder(r=hueco,height+0.2);
	}
}
