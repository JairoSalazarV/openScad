module tubo(
	h/*Altura*/,
	w/*Pared*/,
	d/*Diametro*/
){
  difference()
  {
    cylinder(r=(d/2), h);
    translate([0,0,-0.1])
    cylinder(r=(d/2)-(2*w), h+0.2);
  }
}

module huyoMasPared(
	d/*Diametro del hoyo*/,
	w/*Pared*/,
	h/*Altura*/,
){
  difference()
  {
    cylinder(r=((d+(2*w))/2), h);
    translate([0,0,-0.1])
    cylinder(r=(d/2), h+0.2);
  }
}

module cuboMasPared(
    w1, //Largo
    w2, //Ancho
    p1, //Pared
    p2, //Pared
    h   //Alto
)
{    
    difference()
    {
        translate([-(w1+(p1*2))/2,-(w2+(p2*2))/2,0])
        cube([(w1+(p1*2)),(w2+(p2*2)),h]);
        
        translate([-w1/2,-w2/2,-0.2])
        cube([w1,w2,h*2]);
        
    }
    
    
}

soporteW = 0.7;

module soporteCylinder()
{
  difference()
  {
	cylinder(r=radio,altura);

	translate([0,0,-0.1])
	cylinder(r=radio-soporteW,altura+0.2);
  }

  if(true){
  difference()
  {
	cylinder(r=radio+0.75,1);

	translate([0,0,-0.1])
	cylinder(r=radio-0.75,1.25);
  }}

}

module soporteOval()
{
  difference()
  {
	oval(w=ancho, h=largo, height=alto, center = false);

	translate([0,0,-0.1])
	oval(ancho-soporteW, largo, alto+0.2);
  }

  difference()
  {
	oval(w=ancho+1, h=largo+1, height=1, center = false);

	translate([0,0,-0.1])
	oval(w=ancho-1, h=largo-1, height=1.25, center = false);
  }

}


module oval(w,h, height, center = false)
{
  scale([1, h/w, 1]) cylinder(h=height, r=w, center=center);
}
