nanoPared = 3;
nanoP2 = nanoPared * 2;

nanoW = 20;
nanoH = 45;
nanoD = 18;

difference()
{
    cube([
            nanoW+nanoP2,
            nanoH+nanoP2,
            nanoD+nanoPared
        ]);
    
    translate([nanoPared,nanoPared,nanoPared])
    cube([nanoW,nanoH,nanoD+1]);
    
    translate([
                ((nanoP2+nanoW)/2)-5,0,nanoPared])
    cube([10,7,nanoP2]);
}

cejaW = nanoW+nanoP2+20;
translate([-10,(nanoH/2),0])

difference()
{
    cube([cejaW,10,nanoPared-0.1]);
    
    translate([4,5,-0.1])
    cylinder(r=2.3,nanoP2);
    
    translate([cejaW-4,5,-0.1])
    cylinder(r=2.3,nanoP2);
}