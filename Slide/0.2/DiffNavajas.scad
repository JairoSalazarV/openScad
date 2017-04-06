include <CannonRosca.scad>
include <navaja.scad>



if( 1 )
{
    allDiffNav();
}



module allDiffNav()
{

translate([0,0,6])
rotate([0,180,0])
cilindro();

translate([0,0,navajasH])
rotate([0,180,0])
creaNavajas( navajasH );

}


module cilindro()
{
    translate([0,0,5.-5-5.8])
    difference()
    {
        areaCubreDiff();
        
        translate([0,0,-0.1])
        cylinder(r=((64-2.5)/2),navajasH+5.8+3,$fn=100);
        
    }
}

module areaCubreDiff()
{
    
    cylinder(r=((64)/2),navajasH+5.8,$fn=100);
    
    orejasYTornillos( navajasH+2.8 );
}


module orejasYTornillos( intH )
{
difference()
{
    creaOrejas(intH);
    tornTriang( intH );
}
}


module creaOrejas( intH )
{
    translate([0,36,0])
    cylinder(r=8,intH,$fn=100);

    translate([31,-18,0])
    cylinder(r=8,intH,$fn=100);

    translate([-31,-18,0])
    cylinder(r=8,intH,$fn=100);
}

module tornTriang( intH )
{
    translate([-32,-18,-0.1])
    cylinder(r=3,intH+1,$fn=20);
    
    translate([32,-18,-0.1])
    cylinder(r=3,intH+1,$fn=20);
    
    translate([0,36,-0.1])
    cylinder(r=3,intH+1,$fn=20);
    
}
