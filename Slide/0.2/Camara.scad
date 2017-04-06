include <Sello35GradosCorto.scad>
include <alsaCam.scad>
include <../../library.scad>


camaraPared  = 8;

tuboSellDiam = 52+3;//52mm+2 holgura
tuboSellR = tuboSellDiam / 2;
tuboSellP = 3.5;//Profundidad del sello


camCableX = 1.4;
camCableY = 20;

if( 0 )
{
    creaCamBase();
}


module creaCamBase()
{
    difference()
    {
        //Pared
        translate([-(bigW-2)/2,-(bigW-2)/2,0])
        cube( [(bigW-2),(bigW-2),camaraPared] );
        
        //Sello hembra
        translate([0,0,camaraPared-4])
        huyoMasPared(68,7,4.2,$fn=100);
        //Ahorro de material
        translate([0,0,camaraPared-4])
        huyoMasPared(42,11,4.2);
        
        //Pasa cable
        pasaCable();
        
        //Tornillos
        tornPass();
        
        
    }
    
    //translate([0,0,10])
    creaAlsaCamara( 25 );
}

module pasaCable()
{
    //Pasa cable
    rotate([0,0,90])
    translate([-15, -camCableY/2, -0.1])
    cube( [camCableX, camCableY, 20] );
}
