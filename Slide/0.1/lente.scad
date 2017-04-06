include <../../ScrewsAndNuts/ISOThreadLeg.scad>
include <../../library.scad>
include <Diffracter.scad>
include <./Tubo60mm.scad>

include <navaja.scad>

//pared = 3;


lenDiam = 25+1;
lenR = lenDiam/2;
lenP = 3.5;
lenDiamInt = 17;
lenRInt = lenDiamInt/2;


lenteH = coberH+lenP-3;

if( 0 )
{
    //Lente
    crearLente();
    
    //Navajas
    translate([0,0,-0.5])
    creaNavajas();
}

module crearLente()
{
//%cylinder(r=34,15);
difference()
{
    //Área navajas-lente
    translate([-coberW/2,-coberW/2,0])
    cube([coberW,coberW,lenteH]);
    
    //Cobertura
    translate([-(bigW+2)/2,-(bigW+2)/2,-40+coberH-3])
    cube([bigW+2,bigW+2,40]);
    
    //Área lente-frente
    translate([0,0,-0.1])
    cylinder(r=lenR,lenteH+0.2);
    
    //Tornillos abajo
    translate([-ori+4,-ori+4,-0.1])
    cylinder(r=tornR,20);
    translate([ori-4,-ori+4,-0.1])
    cylinder(r=tornR,20);
    translate([-ori+4,ori-4,-0.1])
    cylinder(r=tornR,20);
    translate([ori-4,ori-4,-0.1])
    cylinder(r=tornR,20);
    
     //Tornillitos
    translate([-navW/2,13,0])
    cylinder(r=navTorR,navP+lenIntHNavajas-0.1,$fn=20);
    translate([navW/2,13,0])
    cylinder(r=navTorR,navP+lenIntHNavajas-0.1,$fn=20);
    translate([-navW/2,-13,0])
    cylinder(r=navTorR,navP+lenIntHNavajas-0.1,$fn=20);
    translate([navW/2,-13,0])
    cylinder(r=navTorR,navP+lenIntHNavajas-0.1,$fn=20);
    
}

//Rosca
translate([0,0,lenteH-lenP+0.4])
thread_in_pitch(lenDiam,lenP,1.7);
}
