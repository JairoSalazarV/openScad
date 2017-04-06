include <../../library.scad>
include <Diffracter.scad>
//include <lente.scad>

pared = 3;


//lenRIntNavajas = 19/2;
lenIntHNavajas = 4;//3.6

offsetRanura = -0.35;//-.
offsetNavaja = 0.5;//0
offsetPosDer = 0.0;

navW = 21.5+offsetNavaja;
navH = 43;
navP = 3;//3
navTorR = 1.35;//1.2
navSepW = 9.2+offsetRanura;
navSepH = 2;


navBigW = (navW*2) + (pared*2);
navBigH = navH + pared;

navajasH = navP+lenIntHNavajas;

navajasH = 6;//8 //Quitar para altura real

soloProbar = 0;

navHoleRad = 14;

if( 0 )
{
    if( soloProbar )
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
    else
    {
        translate([0,0,navajasH])
        rotate([0,180,0])
        creaNavajas( navajasH );
    }
}




module creaNavajas( intH )
{


//%cylinder(r=34,15);
difference()
{
    //Área navajas-lente
    translate([-bigW/2,-bigW/2,0])
    cube([bigW,bigW,intH]);
    
    //Recorte área navaja
    translate([-navW-offsetPosDer,-navH/2,-0.1])
    cube([(navW*2),navH,navP]);
    
    //Área tapón
    //translate([0,0,navP-0.4])
    cylinder(r=navHoleRad,intH+0.1);
    
    //Tornillitos
    translate([-navW/2,13,0])
    cylinder(r=navTorR,navP+lenIntHNavajas-0.1,$fn=20);
    translate([navW/2,13,0])
    cylinder(r=navTorR,navP+lenIntHNavajas-0.1,$fn=20);
    translate([-navW/2,-13,0])
    cylinder(r=navTorR,navP+lenIntHNavajas-0.1,$fn=20);
    translate([navW/2,-13,0])
    cylinder(r=navTorR,navP+lenIntHNavajas-0.1,$fn=20);
    
    //Tornillos abajo
    translate([-ori+4,-ori+4,-0.1])
    cylinder(r=tornR,20,$fn=20);
    translate([ori-4,-ori+4,-0.1])
    cylinder(r=tornR,20,$fn=20);
    translate([-ori+4,ori-4,-0.1])
    cylinder(r=tornR,20,$fn=20);
    translate([ori-4,ori-4,-0.1])
    cylinder(r=tornR,20,$fn=20);
    
    //Sello
    translate([0,0,-0.1])
    huyoMasPared(
                   64,//73
                   35,//30
                   intH+1
                  );
    //translate([0,0,-0.1])
    //cylinder(r=selloHembraRadio,4);
    
}

//translate([0,0,pared-lenP+0.2])
//translate([0,0,navajasH-lenP+0.4])
//thread_in_pitch(lenDiam,lenP,1.7);

translate([-navSepW/2,-navH/2,0])
cube([navSepW,navSepH,navP]);

translate([-(navSepW/2),(navH/2)-navSepH,0])
cube([navSepW,navSepH,navP]);



}
