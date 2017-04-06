redLenW = 52;
redLenH = 4;
redLenPared = 4;


createHaro(redLenW,redLenH,redLenPared);
translate([0,0,1])
createHaro(redLenW-1.5,1.5,redLenPared);

module createHaro(w,h,d)
{
	difference()
	{
		cylinder(r=((w+d)/2),h);
		translate([0,0,-0.1])
		cylinder(r=((w)/2),h+0.2);
	}
}