include <../../Letras.scad>

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
raspAlza = 13-pared;

vidrioW = 20;
vidrioD = 0.5;

//translate([-2,-2,27])
if(1)
{
tapa();
}

module tapa()
{



//translate([30,54.5,0])
//makeRing((ringRad/2),pared-1,pared+1);

difference()
{

crearAreaConPatas();

translate([5.5,25.5,-2])
cylinder(r=2.5,40,$fn=30);

translate([54.5,25.5,-2])
cylinder(r=2.5,40,$fn=30);

translate([5.5,83.5,-2])
cylinder(r=2.5,40,$fn=30);

translate([54.5,83.5,-2])
cylinder(r=2.5,40,$fn=30);

rotate([0,180,90])
translate([-85,-38,-1.3])
logoSimple(18,3,3,3);
    
/*
translate([5.5,25.5,-0.1])
cylinder(r=4,3,$fn=30);

translate([54.5,25.5,-0.1])
cylinder(r=4,3,$fn=30);

translate([5.5,83.5,-0.1])
cylinder(r=4,3,$fn=30);

translate([54.5,83.5,-0.1])
cylinder(r=4,3,$fn=30);
*/

}






}


module crearAreaConPatas()
{
    hull()
    {
        translate([medPared,medPared,0])
        cube([raspX,raspY,pared]);
        esquinas();
    }
    
    translate([5.5,25.5,3])
    cylinder(r=4,19-pared,$fn=30);

    translate([54.5,25.5,3])
    cylinder(r=4,19-pared,$fn=30);

    translate([5.5,83.5,3])
    cylinder(r=4,19-pared,$fn=30);

    translate([54.5,83.5,3])
    cylinder(r=4,19-pared,$fn=30);
    
    
}

module creaBaseMesa()
{

    translate([0,0,3])
    crearMesa();

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
		cylinder(r=radio,h,$fn=40);
		translate([0,0,-1])
		cylinder(r=2,h*2,$fn=20);
	}
}

module cylHue2(h,radio){
	cylinder(r=2,h,$fn=20);
}


module esquinas()
{
	translate([esqRad,esqRad,0])
	cylinder(r=3,pared,$fn=20);
	
	translate([raspX,esqRad,0])
	cylinder(r=3,pared,$fn=20);

	translate([esqRad,raspY,0])
	cylinder(r=3,pared,$fn=20);
	
	translate([raspX,raspY,0])
	cylinder(r=3,pared,$fn=20);

}


