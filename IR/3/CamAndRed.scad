pared = 4;
pared2 = 2*pared;
medPared = pared/2;

raspX = 56;//58
raspY = 85;//85
raspZ = 15.5;//15.5
raspD1 = 3.45;
raspDP = 22;
raspD2 = raspDP+pared2;//Altura lados
raspAlza = 13-pared;
raspCamTor = 1;


difference()
{
creaBaseMesa();
translate([-9/2,-9/2,-0.1])

cube([9,9,15]);

tornillosCam();

}

module tornillosCam()
{
translate([-11.7,10.75,3.5])
cylinder(r=raspCamTor,5);

translate([-11.7,-10.75,3.5])
cylinder(r=raspCamTor,5);

translate([0,10.75,3.5])
cylinder(r=raspCamTor,5);

translate([0,-10.75,3.5])
cylinder(r=raspCamTor,5);

translate([-13,-4,4.25])
cube([9,9.8,4]);


}


module creaBaseMesa()
{
translate([-15,-13,3])
cube([25,26,3]);

difference()
{

translate([-28.5,-52,0])
crearMesa();

translate([0,0,-0.1])
cylinder(r=51.8/2,2.5);

}
}


module crearMesa()
{

difference()
{
translate([1,20.7,0])
cube([54.5,63.7,pared]);

translate([0,0,-0.1])
cuatroTornHue(2.8);
}

cuatroTorn(2.8);




}






module cuatroTorn(radio)
{
	translate([raspD1,raspY-raspD1,0])
	cylHue(pared+raspAlza,radio);

	translate([raspX-raspD1,raspY-raspD1,0])
	cylHue(pared+raspAlza,radio);

	translate([raspD1,23.5,0])
	cylHue(pared+raspAlza,radio);

	translate([raspX-raspD1,23.5,0])
	cylHue(pared+raspAlza,radio);

}


module cuatroTornHue(radio)
{
	translate([raspD1,raspY-raspD1,0])
	cylHue2(pared+raspAlza,radio);

	translate([raspX-raspD1,raspY-raspD1,0])
	cylHue2(pared+raspAlza,radio);

	translate([raspD1,23.5,0])
	cylHue2(pared+raspAlza,radio);

	translate([raspX-raspD1,23.5,0])
	cylHue2(pared+raspAlza,radio);

}


module cylHue(h,radio){
	difference()
	{
		cylinder(r=radio,h);
		translate([0,0,-1])
		cylinder(r=2,h*2);
	}
}

module cylHue2(h,radio){
	cylinder(r=2,h);
}
