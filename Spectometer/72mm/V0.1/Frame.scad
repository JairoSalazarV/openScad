include <Diffracter.scad>

frameW = 80-1.5;//Real hole width - burr
frameH = 75-1.5;//Real hole height - burr
frameD = 2.5;

winW = frameW - 8;
winH = frameH - 16;

slideW = winW + 4;
slideH = winH + 10;
slideD = 0.8;

//Activate this to display
if(false)
{
  Frame();
}

module Frame()
{
difference()
{

  translate([-frameW/2,-frameH/2,0])
  cube([frameW,frameH,frameD]);

  //areaSello();
  translate([-winW/2,-winH/2,-0.1])
  cube([winW,winH,frameD*2]);

  translate([-slideW/2,-slideH/2,frameD-slideD])
  cube([slideW,slideH,2]);

}
}


module areaSello()
{
  //cylinder(r=(raspSellR/2)-1,frameD);

  translate([-(frameW)/2,-(frameH)/2,0])
  cube([frameW,frameH,frameD]);
}
