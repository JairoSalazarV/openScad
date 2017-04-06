include <Diffracter.scad>
//include <navaja.scad>

cannonDiam1 = 52.4;
cannonDiam2 = 54.4;
cannonPared = 3;
cannonNavBase = 3;
cannonH = 6;//14-cann..

if( 1 )
{
    allRosca();
}

module allRosca()
{
    
    roscaHembraCannon();



}

module roscaHembraCannon()
{
    
    //creaOrejas();
    
difference()
{

cylinder(r=30,cannonH, $fn=100);
//cylinder( r1=(cannonDiam1+(cannonPared*2))/2, r2=(cannonDiam2+(cannonPared*2))/2, cannonH, $fn=100 );
translate([0,0,-0.1])
cylinder( r1=(cannonDiam1/2), r2=cannonDiam2/2, cannonH+0.2, $fn=100 );
   
}

translate([0,0,cannonH-3.4])
difference()
{
    cylinder( r=(cannonDiam1+7)/2, 1.3  );
    
    translate([0,0,-0.1])
    cylinder( r=(cannonDiam1-1.5)/2, 2  );
    
    rotate([0,0,0])
    translate([-35,-10,-2])
    cube( [70,35,5] );

    rotate([0,0,90])
    translate([-70,-15,-2])
    cube( [70,30,5] );
}


translate([12,23,0])
rotate([0,0,-30])
cube([3.3,3,cannonH-3.4+1.3]);

translate([10,-27,0])
rotate([0,0,20])
cube([3.3,3,cannonH-3.4+1.3]);

translate([-28.5,-7,0])
rotate([0,0,13])
cube([3.3,3,cannonH-3.4+1.3]);





}







module creaOrejas()
{
    translate([0,36,0])
    cylinder(r=8,9,$fn=100);

    translate([31,-18,0])
    cylinder(r=8,9,$fn=100);

    translate([-31,-18,0])
    cylinder(r=8,9,$fn=100);
}

//creaNavajas();

module tornTriang()
{
    translate([-32,-18,-0.1])
    cylinder(r=3,10,$fn=20);
    
    translate([32,-18,-0.1])
    cylinder(r=3,10,$fn=20);
    
    translate([0,36,-0.1])
    cylinder(r=3,10,$fn=20);
    
}
