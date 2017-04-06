include <alsaCam.scad>

genW = 59;
genD = 6;

camLenW = 9;
camLenDesv = 11;



difference()
{
    
    translate([-camLenDesv,1,0])
    creaAlsaCamara(genD);
    
    translate([-((camLenW+4)/2)-camLenDesv,-2.5,7-2])
    cube([camLenW+4,20,4]);    
    
    translate([-(camLenW/2)-camLenDesv,-camLenW/2,-0.1])
    cube([camLenW,camLenW,8]);
}    
    
difference()
{
    translate([-genW/2,-genW/2,0])
    cube([genW,genW,genD]);
    
    translate([-12-camLenDesv,-1.5,-0.1])
    cube([24,16,genD+1+5]);
    
    translate([-(camLenW/2)-camLenDesv,-(camLenW/2),-0.1])
    cube([camLenW,camLenW,8]);
    
}



