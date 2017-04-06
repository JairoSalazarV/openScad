include <Diffracter.scad>
include <navaja.scad>

cannonDiam1 = 52.6;
cannonDiam2 = 54.6;
cannonPared = 3;
cannonNavBase = 3;
cannonH = 14+cannonNavBase;




difference()
{
   baseTornillos(); //cylinder(r=bigW/2,cannonNavBase,$fn=100);
    
    translate([0,0,-0.1])
    cylinder(r=(cannonDiam1+2)/2,cannonNavBase+1,$fn=100);
    
    tornTriang();
}


module baseTornillos()
{
    translate([-6,24,0])
    cube([12,18,6]);
        
    translate([35,-27,0])
    rotate([0,0,60])
    cube([12,15,6]);
    
    translate([-42,-17,0])
    rotate([0,0,-60])
    cube([12,15,6]);
    
}

translate([0,0,6])
rotate([0,180,0])
creaNavajas();

module tornTriang()
{
    translate([-32,-18,-0.1])
    cylinder(r=3,cannonPared*4,$fn=20);
    
    translate([32,-18,-0.1])
    cylinder(r=3,cannonPared*4,$fn=20);
    
    translate([0,36,-0.1])
    cylinder(r=3,cannonPared*4,$fn=20);
    
}
