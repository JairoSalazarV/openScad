pared = 4;
pared2 = pared*2;
W = 40;
slideX = W+2;
slideY = 2;
slideZ = 5;


difference()
{
cube([W,W,W]);
translate([pared,pared,pared])
cube([W-pared2,W-pared2,W]);

translate([-1,(W/2)-(slideY/2),W-slideZ+0.1])
cube([slideX,slideY,slideZ]);

}