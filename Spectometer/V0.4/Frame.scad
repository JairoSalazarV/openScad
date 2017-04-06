include <Diffracter.scad>

frameW = 64;
frameH = 53.5;
frameD = 2.5;

slideW = frameW - 9;
slideH = frameH - 10;
slideD = 0.8;

winW = slideW;
winH = slideH - 10;

diffW = winW+5;
diffH = winH+13;


//Activate this to display
if(false)
{
  Frame();
}

module Frame()
{
difference()
{

  //translate([-frameW/2,-frameH/2,0])
  //cube([frameW,frameH,frameD]);

  areaSello();

  translate([-winW/2,-winH/2,-0.5])
  cube([winW,winH,frameD*2]);

  translate([-diffW/2,-diffH/2,frameD-0.8])
  cube([diffW,diffH,2]);

}
}


module areaSello()
{
  //cylinder(r=(raspSellR/2)-1,frameD);

  translate([-(frameW)/2,-(frameH)/2,0])
  cube([frameW,frameH,frameD]);
}
