


pared=3.5;
diffLado = 8;
fibOpPlug = 12.75;
frenteH = 50+pared;
diffW = 51;
torHemW=8;
fibW=9.5;
torHemOffset = (diffW/2)-
				  (torHemW/2);







portaTornillos();







module portaTornillos(){

translate([-3,-3,0])
tornillo();
translate([-3,3,0])
tornillo();
translate([3,-3,0])
tornillo();
translate([3,3,0])
tornillo();

}


module tornillo(){

difference(){	
cylinder(r=2.5,10);
translate([0,0,-0.1])
cylinder(r=3/2,15+0.1);
}

}

