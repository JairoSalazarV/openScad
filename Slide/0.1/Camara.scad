include <Sello35GradosCorto.scad>
include <alsaCam.scad>
include <../../library.scad>


camaraPared  = 6.5;

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
        translate([-camCubeW/2,-camCubeH/2,0])
        cube( [camCubeW,camCubeH,camaraPared] );
        
        //Tornillos
        translate([-camCubeW/2,-camCubeH/2,0])
        tornillosBaseCamara( camaraPared + 0.4, $fn=20);
        
        //Sello externo
        translate([0,0,camaraPared-tuboSellP+0.1])
        cylinder(r=tuboSellR,tuboSellP);
        
        //Pasa cable
        //rotate([0,0,-90])
        //translate([(camCubeW/2)-16, -camCableY/2, -0.1])
        //cube( [camCableX, camCableY, camaraPared+0.4] );
        
        //Sello hembra
        //translate([0,0,-0.1])
        //huyoMasPared(43,7,2);
        
        
        
    }
    
    rotate([0,0,0])
    creaAlsaCamara( camaraPared );
}
