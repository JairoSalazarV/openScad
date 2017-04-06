pataH = 4;
pataRadio = 13.5;

difference()
{
  translate([-17,-15,0])
  cube([34,53,pataH]);

  translate([0,0,-0.1])
  cylinder(r=pataRadio,pataH+1);
 
}