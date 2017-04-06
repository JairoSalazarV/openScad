include <alsaCam.scad>

genW = 59;
genD = 4;


diffW = 50;
diffH = 25;
diffD = 2;

    
difference()
{
    translate([-genW/2,-genW/2,0])
    cube([genW,genW,genD]);
    
    translate([-(diffW+5)/2,-(diffH+10)/2,genD-diffD+0.1])
    cube([diffW+5,diffH+10,diffD]);
    
    translate([-diffW/2,-diffH/2,-0.1])
    cube([diffW,diffH,diffD+1]);
    
}



