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
camCableX = 1;

translate([0,0,1])
creaCaja();

creaTrabes();

trabesH = 2.7;
module creaTrabes()
{
    translate([-29,-20,0])
    cube([58,2,trabesH]);
    
    translate([-29,-39,0])
    cube([58,2,trabesH]);
    
    translate([-20,0,0])
    cube([49,2,trabesH]);
    
    translate([-29.5,0,0])
    cube([5.5,2,trabesH]);
    
    translate([-29,37,0])
    cube([58,2,trabesH]);
    
    translate([-29,17,0])
    cube([58,2,trabesH]);
    
    translate([-1,-37,0])
    cube([2,74,trabesH]);
    
    cuboMasPared(
                    camCubeW+7,
                    camCubeH+20
                    ,2,3,trabesH);
    
}


//
//translate([20,-46,-5])
//%cube([13,13,13]);

module creaCaja()
{
    difference()
    {
        //Toda el área
        translate([0,-1,2])//Pone a nivel
        camBaCajAreaExterna();
        
        //Tornillos
        translate([-(camCubeW/2),-(camCubeH/2),-0.1])
        tornillosBaseCamara( pared2 + 0.4 );
        
        //Cabeza de tornillos
        translate([-(camCubeW/2),-(camCubeH/2),4])
        tornillosBaseCamaraCabeza(4,6);

        //Pasa Cable
        pasaCable();
                
    }
    
    
    //Sello cuadro
    translate([0,0,-1])
    cuboMasPared(
                    camCubeW-1,
                    camCubeH+12
                    ,1.5,1.5,3+1);
   
    

    
    
    
    
    
    

    
}

module pasaCable()
{
    //Pasa cable
    //rotate([0,0,-90])
    translate([-(camCubeW/2)+8, -camCableY/2, -0.1])
    cube( [camCableX, camCableY, 20] );
}

module camBaCajAreaExterna()
{
    //Pared
    translate([-(camCubeH/2),-(raspY/2)-(pared/2)-2, 0])
    cube([camCubeH,raspY+pared2,2]);
    
    //Caja de raspberry pi
    translate([-(raspX/2)+3,(-raspY/2),0])
    camaraBaseCaja();
    
    
    
    
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
