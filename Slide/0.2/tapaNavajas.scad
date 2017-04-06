include <navaja.scad>



pasaSlideW = 6;
pasaSlideH = 18;
pasaSlideP = 3.3;

pasaSlideW2 = 18;
pasaSlideH2 = 27;
pasaSlideDesp = 1;

difference()
{
//El área de trabajo
areaTapaNavajas();
    
 //Tornillitos
translate([-navW/2,13,-0.1])
cylinder(r=navTorR,navP+lenIntHNavajas-0.1,$fn=20);
translate([navW/2,13,-0.1])
cylinder(r=navTorR,navP+lenIntHNavajas-0.1,$fn=20);
translate([-navW/2,-13,-0.1])
cylinder(r=navTorR,navP+lenIntHNavajas-0.1,$fn=20);
translate([navW/2,-13,-0.1])
cylinder(r=navTorR,navP+lenIntHNavajas-0.1,$fn=20);  

//Ranuras
translate([-pasaSlideW/2,-pasaSlideH/2,-0.1])
cube([pasaSlideW,pasaSlideH,pasaSlideP+0.5]);
    
translate([-pasaSlideW2/2,-pasaSlideH2/2,pasaSlideDesp])
cube([pasaSlideW2,pasaSlideH2,pasaSlideP+0.5]);

}

module areaTapaNavajas()
{
    
    translate([
            -((navW*2)-2)/2,
            -((navH-(navSepH*2))-2)/2,
            0]
        )
    cube([(navW*2)-2,(navH-(navSepH*2)-2),pasaSlideP]);

    translate([-navW+1,-(navH-(navSepH*2))/2,0])
    cube([5,(navH-(navSepH*2)),pasaSlideP]);

    translate([navW-5-1,-(navH-(navSepH*2))/2,0])
    cube([5,(navH-(navSepH*2)),pasaSlideP]);
    
}
