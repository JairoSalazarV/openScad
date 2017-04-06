include <ScrewsAndNuts/ISOThreadLeg.scad>
include <../../library.scad>

roscaDiam = 11;
roscaH=24;
roscaPared=2;
roscaSurcoW = 56;
roscaSurcoH = 5;


module creaTapa()
{
difference()
{
cylinder(r=roscaSurcoW/2,roscaSurcoH);

translate([0,0,2])
huyoMasPared(46.5,2.4	,roscaSurcoH);

}
}
