include <ScrewsAndNuts/ISOThreadLeg.scad>
include <../../library.scad>

roscaDiam = 11;
roscaH=24;
roscaPared=2;
roscaSurcoW = 56;
roscaSurcoH = 5;


difference()
{
cylinder(r=roscaSurcoW/2,roscaSurcoH);

translate([0,0,-0.1])
cylinder(r=roscaDiam/2,roscaSurcoH+0.2);

translate([0,0,2])
huyoMasPared(46.5,2.4	,roscaSurcoH);

}


translate([0,0,roscaH])
rotate([0,180,0])
creaRosca();

module creaRosca()
{
huyoMasPared(roscaDiam,roscaPared,roscaH,center=true);
huyoMasPared(roscaDiam-0.8,roscaPared,0.75,center=true);
translate([0,0,3])
thread_in_pitch(roscaDiam,7,0.9);
}