



baseRad1 = 12;//20 Base
baseRad2 = 8;// 8 Cuspide
baseH    = 6;//20 Altura

ranuraW = 1.8;//Ancho de lo que entrará
ranuraH = (baseRad1*2)+2;//Lo largo para que cruce
ranuraD = baseH - 1;//Lo profundo

difference()
{
    cylinder(r1=baseRad1,r2=baseRad2,ranuraD);
    
    translate([-ranuraH/2,-ranuraW/2,baseH-ranuraD])
    cube([ranuraH,ranuraW,ranuraD]);
}

