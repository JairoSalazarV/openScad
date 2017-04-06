include <Sello35GradosCorto.scad>
include <../../library.scad>
include <Camara.scad>



//**************************
// Importados de la creación
// de la caja de raspberry pi
//**************************
pared = 4;
pared2 = 2*pared;
medPared = pared/2;

raspX = 56;//58
raspY = 85;//85
raspZ = 15.5;//15.5
raspD1 = 3.45;
raspDP = 22.5;
raspD2 = raspDP+pared2;//Altura lados
raspAlza = 2.6;//2.6
//**************************

cajaBaCamH = 5;
camCableX = 1.4;

creaCaja();

//
//translate([20,-46,-5])
//%cube([13,13,13]);

module creaCaja()
{
    difference()
    {
        //Toda el área
        translate([0,0,0])//Pone a nivel
        camBaCajAreaExterna();
        
        //Tornillos
        translate([-(camCubeW/2),-(camCubeH/2),-0.1])
        tornillosBaseCamara( pared2 + 0.4 );
        
        //Cabeza de tornillos
        //translate([-(camCubeW/2),-(camCubeH/2),6])
        //tornillosBaseCamaraCabeza(4,6);
        
        //Sello cuadrado
        translate([
                    -(camCubeW+2.5)/2,
                    -(camCubeH+2.5)/2,
                    -camaraPared+4])
        cube( [camCubeW+2.5,camCubeH+2.5,camaraPared-1] );
        
        //Sello hembra
        huyoMasPared(43,7,6.5);
        
        //Pasa Cable
        pasaCable();
        
        //Sello cuadro
        translate([0,0,4])
        cuboMasPared(
                        camCubeW-3,
                        camCubeH+8//10
                        ,6//4
                        ,6//5
                        ,5);//5
                
    }
    
    
    
    //Soporte macho
    //huyoMasPared(43,2,5.5);
    
    //Alsa de la cámara
    translate([0,0,cajaBaCamH])
    rotate([180,0,0])
    creaAlsaCamara( cajaBaCamH );
    
    
    
    /*
    difference()
    {
        //La cámara
        translate([0,0,camaraPared])
        rotate([180,0,0])
        creaCamBase();
        
        //Pasa Cable
        pasaCable();
        
        //Cabeza de tornillos
        translate([-(camCubeW/2),-(camCubeH/2),4.2])
        tornillosBaseCamaraCabeza(4,6);
    }
    */
    
    
    
    
    
    

    
}



module pasaCable()
{
    //Pasa cable
    rotate([0,0,-90])
    translate([-(camCubeW/2)+15, -camCableY/2, -0.1])
    cube( [camCableX, camCableY, 20] );
}

module camBaCajAreaExterna()
{
    //Pared
    translate([-((camCubeH+6)/2),-(raspY/2)-(pared/2)-3, 0])
    cube([camCubeH+6,raspY+pared2+2,pared+3.5]);
    
    //Caja de raspberry pi
    //translate([-(raspX/2)+3,(-raspY/2),4])
    //camaraBaseCaja();
    
    
    
    
    //cube( [camCubeW,camCubeH,camaraPared] );
    
}



module camaraBaseCaja()
{

difference()
{
bigCaja();

translate([-medPared,-medPared, raspD2-pared+0.1])
cube([raspX+pared,raspY+pared,pared]);

translate([2.4,-medPared-(medPared/2),pared+raspAlza+1.3])
cube([16,medPared,11.3]);

translate([2.4,-pared-(medPared/2)-0.1,pared+raspAlza+1.3])
cube([16,medPared,11.3]);

}
}



module bigCaja()
{
crearRaspCard();
ladoConnector();
ladoUSB();
ladoMiniSD();
ladoPines();
}


module ladoPines()
{
translate([raspX,-pared,0])
cube([pared,raspY+pared2,raspD2]);
}


module ladoMiniSD()
{
difference()
{
translate([-pared,raspY,0])
cube([raspX+pared+1,pared,raspD2]);

translate([(raspX/2)-8,raspY-1,pared])
cube([15,medPared+1,50]);
}

}

module ladoUSB()
{

difference()
{

translate([-pared,-pared,0])
cube([raspX+pared+1,pared,raspD2]);

translate([1,-medPared,pared+raspAlza])
cube([54,medPared+0.1,22]);

}

}





module ladoConnector()
{


translate([-pared,-1,raspD2-pared])
cube([medPared,raspY+2,pared]);

difference()
{
translate([-pared,-1,0])
cube([pared,raspY+2,raspD2]);

translate([-pared-1,raspY-16.4,5.8])
cube([2.2,12,8]);

translate([-2,27.5,pared+2])
cube([3.1,35,25]);

translate([-1,68.5,pared+2])
cube([2,12,25]);

translate([-pared+1,raspY-14.4,pared+raspAlza+1.4])
{
	cube([1,8,3.3]);
	translate([1.1,0,0])
	cube([1,8,3.3]);
}

}

}







module crearRaspCard()
{
	cube([raspX,raspY,pared]);
	cuatroTorn(3);

	translate([-1,-1,0])
	cube([raspX+2,raspY+2,pared]);

}



module cuatroTorn(radio)
{
	translate([raspD1,raspY-raspD1,0])
	cylHue(pared+raspAlza,radio);

	translate([raspX-raspD1,raspY-raspD1,0])
	cylHue(pared+raspAlza,radio);

	translate([raspD1,23.5,0])
	cylHue(pared+raspAlza,radio);

	translate([raspX-raspD1,23.5,0])
	cylHue(pared+raspAlza,radio);

}

module cylHue(h,radio){
	difference()
	{
		cylinder(r=radio,h,$fn=20);
		translate([0,0,pared-1])
		cylinder(r=1.5,h,$fn=20);
	}
}

module tornillosBaseCamaraCabeza( intCabezaR, intCabezaH )
{
    translate( [12,4,-0.2] )
    huecoParaCabezaTornillo(intCabezaR, intCabezaH);        
    translate( [12,camCubeH-4,-0.2] )
    huecoParaCabezaTornillo(intCabezaR, intCabezaH);        
    
    translate( [camCubeW-4,4,-0.2] )
    huecoParaCabezaTornillo(intCabezaR, intCabezaH);        
    
    translate( [camCubeW-4,camCubeH-4,-0.2] )
    huecoParaCabezaTornillo(intCabezaR, intCabezaH);        
}
