if(false)
{
logo(10,2,2,2);
}

//dMin(10,2,2);
module dMin(iSize,iPared,iH)
{
    translate([iPared*1.59,0,0])
    {
    cMin(iSize*.53,iPared*.53,iH);
    translate([iPared*.75,0,0])
    cube([iPared,iSize,iH]);
    }
}

module tMin(iSize,iPared,iH)
{
  iSize = iSize*0.9;
  translate([0,iSize*.1,0])
  {
  difference()
  {
    hull()
    {
      translate([-iPared*.7,0,0])
      cube([iPared,iSize*1,iH]);

      cube([iSize*.4,iPared,iH]);

      translate([-iPared*.3,0,0])
      cylinder( r=(iPared*0.6), iH, $fn=100 );     
    }
    
    translate([iPared,iPared,-0.1])
    hull()
    {
      translate([-iPared*.7,0,0])
      cube([iPared,iSize*1,iH]);

      cube([iSize*.4,iPared,iH]);

      translate([-iPared*.35,0,0])
      cylinder( r=(iPared*0.6), iH+2, $fn=100 );     
    }
    
    translate([iSize*.28,-iSize*.4,-0.1])
    cube([iSize,iSize,iH+2]);
    
  }
  
  translate([-(iSize*.35),iSize*.6,0])
  cube([iSize*.6,iPared,iH]);
  
  }
        
}


module eLe(iSize,iPared,iH)
{
    translate([-iPared*.7,0,0])
    cube([iPared,iSize*1,iH]);
    
    cube([iSize*.4,iPared,iH]);
}

module hMin(iSize,iPared,iH)
{
    puente(iSize,iPared,iH);
    
    translate([-iPared*.7,0,0])
    cube([iPared*.85,iSize*1,iH]);
   
}

module nMin(iSize,iPared,iH)
{
    puente(iSize,iPared,iH);
    
    translate([-iPared*.7,0,0])
    cube([iPared*.85,iSize*.57,iH]);
   
}

module cMin(iSize,iPared,iH)
{
    translate([0,iSize*0.6,0])
    {
    difference()
    {
        oMin(iSize, iPared, iH);
        
        translate([0,-iPared*1.15,-0.1])
        cube([iSize*.8,iPared*2.2,iH+1]);
    }
    }
}




module Te(iSize, iPared)
{
    translate([-(iPared*1/2),0,0])
    cube( [iPared*1, iSize, leth] );
    
    translate([-(iSize*0.8)/2,iSize-iPared*1,0])
    cube( [iSize*0.8,iPared*1, leth] );
}

module oMin(iSize, iPared, iH)
{
  difference()
  {
    cylinder( r=(iSize*0.6), iH, $fn=100 );
    
    translate([0,0,-0.1])
    cylinder( r=(iSize*0.3), iH+2, $fn=100 );
    //cylinder( r=(iSize/2)-iPared, iH+1, $fn=100 );
  }
}



module eMin(iSize,iPared,iH)
{
    translate([0,iSize*0.0,0])
    {
    difference()
    {
        translate()
        cMin(iSize, iPared*1.8, iH);
        
        translate([0,-iPared*1.3,-0.1])
        cube([iSize*.8,iPared,iH+1]);
    }
    
    translate([-iSize*.1,iPared*5.5,0])
    cube([iSize*0.6,iPared,iH]);
    }
}

module De(iSize,iPared,iH)
{
  translate([0, iSize/2, 0])
  difference()
  {
      mediaLuna(iSize, iH);
      
      translate([-(iSize*0.08), 0, -0.5])
      mediaLuna(iSize*0.8, iH+1);
  }
  
  translate([0,iPared*.2,0])
  cube([iPared*.8, iSize*.9, iH]);
}


module mediaLuna(iSize, iH)
{
  difference()
  {
    cylinder( r=iSize/2, iH, $fn=100 );
      
    translate([-iSize, -iSize/2, -0.1])
    cube(iSize,iSize,iH);
  }
}

module puente(iSize,iPared,iH)
{
    
    difference()
    {
        
    hull()//Exterior
    {
        translate([iSize*0.37,iSize*0.45,0])
        cylinder(r=iPared*.5,iH,$fn=50);
        
        cube([iSize*0.45,iSize*0.51,iH]);
    }
    
    translate([-iPared*.8,-iPared*.8,-0.1])
    hull()//Interior
    {
        translate([iSize*0.42,iSize*0.5,0])
        cylinder(r=iPared*.3,iH,$fn=50);
        
        cube([iSize*0.47,iSize*0.47,iH+1]);
    }
    
    }
}

module oCua(iSize,iH)
{
    cube([iSize*0.4,iSize*0.4,iH]);
    
    translate([iSize*0.5,0,0])
    difference()
    {
        cube([iSize*0.15,iSize*0.6,iH]);
        
        translate([-iSize*0.15,-iSize*0.11,-0.1])
        rotate([0,0,-45])
        cube([iSize*0.25,iSize*0.6,iH*2]);
        
        
        translate([-iSize*0.35,iSize*0.45,-0.1])
        rotate([0,0,-45])
        cube([iSize*0.25,iSize*0.6,iH*2]);
    }
    
    translate([-iSize*.05,iSize*0.06,0])
    difference()
    {
        translate([-iSize*.1,iSize*.445,0])
        cube([iSize*.8,iSize*0.15,iH]);
        
        translate([iSize*0.3,iSize*0.3,-0.1])
        rotate([0,0,-45])
        cube([iSize*0.25,iSize*0.6,iH*2]);
        
        translate([-iSize*0.28,iSize*0.45,-0.1])
        rotate([0,0,-45])
        cube([iSize*0.25,iSize*0.6,iH*2]);

    }
    
    
    
    
}

module logoSimple(letsize,letpared,leth,letoffset)
{
    //De(letsize,letpared,leth);
    dMin(letsize,letpared,leth);
    
    translate([(letsize*0.59)+(1*letoffset),letsize*0,0])
    oCua(letsize,leth);
    
    translate([(letsize*1.5)+(2*letoffset),0,0])
    tMin(letsize,letpared*.8,leth);   
    
    translate([(letsize*2.1)+(3*letoffset),0,0])
    eMin(letsize*.53,letpared*.3,leth*.53);
    
    translate([(letsize*2.8)+(4*letoffset),0,0])
    cMin(letsize*.53,letpared*.53,leth*.53);
    
    translate([(letsize*3.3)+(5*letoffset),0,0])
    hMin(letsize,letpared,leth);

    
}

module logo(letsize,letpared,leth,letoffset)
{
    //De(letsize,letpared,leth);
    dMin(letsize,letpared,leth);
    
    translate([(letsize*0.59)+(1*letoffset),letsize*0,0])
    oCua(letsize,leth);
    
    translate([(letsize*1.5)+(2*letoffset),0,0])
    tMin(letsize,letpared*.8,leth);   
    
    translate([(letsize*2.1)+(3*letoffset),0,0])
    eMin(letsize*.53,letpared*.3,leth*.53);
    
    translate([(letsize*2.8)+(4*letoffset),0,0])
    cMin(letsize*.53,letpared*.53,leth*.53);
    
    translate([(letsize*3.3)+(5*letoffset),0,0])
    hMin(letsize,letpared,leth);
    
    translate([(letsize*4)+(6*letoffset),leth*.75,0])
    cylinder(r=letpared*.75,leth,$fn=50);
    
    translate([(letsize*4.45)+(7*letoffset),0,0])
    nMin(letsize,letpared,leth);
    
    translate([(letsize*5.3)+(8*letoffset),0,0])
    eMin(letsize*.5,letpared*.3,leth*.53);
    
    translate([(letsize*5.85)+(9*letoffset),0,0])
    tMin(letsize,letpared*.8,leth);

    
}