include <CannonRosca.scad>




if( 1 )
{
    translate([0,0,7])
    rotate([0,180,0])
    genericCannonRosca();
}






module genericCannonRosca()
{

translate([0,0,1])
roscaHembraCannon();

difference()
{
    translate([-30,-30,0])
    cube([60,60,7]);
    
    /*
    translate([-45/2,-45/2,-0.1])
    cube([45,45,15]);*/
    
    translate([0,0,-0.1])
    cylinder(r=55/2,14+1,$fn=100);
    
}
}



module navajasCorto()
{
    difference()
    {
        translate([0,0,navajasH])
        rotate([0,180,0])
        creaNavajas( navajasH );
        
        translate([0,0,-0.2])
        cuboMasPared(49,49,30,30,15);
        
    }
}