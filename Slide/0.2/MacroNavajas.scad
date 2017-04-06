include <navaja.scad>


//translate([0,0,6])
//rotate([0,180,0])
navajasCorto();

difference()
{
    translate([-59/2,-59/2,0])
    cube([59,59,14]);
    
    translate([-45/2,-45/2,-0.1])
    cube([45,45,15]);
    
    translate([0,0,5.99])
    cylinder(r=54.5/2,14+1);
    
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