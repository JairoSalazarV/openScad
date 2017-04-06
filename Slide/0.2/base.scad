h = 12;
pared = 2.5;
diametro = 200;

pataR1 = 2;
pataR2 = 3.3;
torR = 5;


translate([0,0,h+pared])
rotate([0,180,0])
creaBase();



module creaBase()
{
translate([0,0,h])
difference()
{
    cylinder(r=(diametro/2),pared,$fn=100);
    
    translate([-(diametro+2)/2,-(diametro),-0.1])
    cube([diametro+2,diametro+1,pared+1]);
    
    translate([0,torR+2,1])
    cylinder(r=torR,pared,$fn=100);
    
    translate([0,torR+2,-1])
    cylinder(r=2,pared*2,$fn=100);
    
}

translate([-(diametro/2)+pataR2+1,pataR2+1,0])
cylinder(r1=pataR1,r2=pataR2,h+pared);

translate([(diametro/2)-pataR2-1,pataR2+1,0])
cylinder(r1=pataR1,r2=pataR2,h+pared);

translate([0,(diametro/2)-pataR2-1,0])
cylinder(r1=pataR1,r2=pataR2,h+pared);

translate([(diametro/4),(diametro/4)-pataR2-1,0])
cylinder(r1=pataR1,r2=pataR2,h+pared);

translate([-(diametro/4),(diametro/4)-pataR2-1,0])
cylinder(r1=pataR1,r2=pataR2,h+pared);

}