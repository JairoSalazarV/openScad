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
raspD1 = 5;
raspDP = 22.5;
raspD2 = raspDP+pared2;//Altura lados
raspAlza = 2.6;//2.6
offsetElec = -2.5;
//**************************

cajaBaCamH = 5;
camCableX = 1;


//translate([0,0,1])
difference()
{
    
    creaCaja();
    
    translate([-(bigW+2)/2,-(bigW+2)/2,-0.1])
    cube([bigW+2,bigW+2,3]);
}

creaTrabes();

trabesH = 2.5;
module creaTrabes()
{
    translate([-42,-25,0])
    cube([84,2,trabesH]);
    
    translate([-34,-42,0])
    cube([70,2,trabesH]);
    
    translate([-18,-4,0])
    cube([60,2,trabesH]);
    
    translate([-42,-4,0])
    cube([16,2,trabesH]);
    
    translate([-34,40,0])
    cube([70,2,trabesH]);
    
    translate([-42,19,0])
    cube([84,2,trabesH]);
    
    translate([-1,-42,0])
    cube([2,84,trabesH]);
    
    translate([-17,-42,0])
    cube([2,84,trabesH]);

    translate([-35,-42,0])
    cube([2,84,trabesH]);
    
    translate([34,-42,0])
    cube([2,84,trabesH]);
    
    translate([16,-42,0])
    cube([2,84,trabesH]);
    
}


//
//translate([20,-46,-5])
//%cube([13,13,13]);

module creaCaja()
{
    difference()
    {
        //Toda el área
        //translate([0,-1,2])//Pone a nivel
        camBaCajAreaExterna();
        
        //Pasa Cable
        pasaCable();
        
         //Tornillos
        tornPass();
                
    }
    
   
   
    

    
    
    
    
    
    

    
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
    translate([-(coberW/2),-((coberW-1)/2), 0])
    cube([coberW,coberW-1,6]);
    
    //Caja de raspberry pi
    translate([-(raspX/2)+3,(-raspY/2)-0.5,1])
    camaraBaseCaja();
    
    
    
    
    //cube( [camCubeW,camCubeH,camaraPared] );
    
}



module camaraBaseCaja()
{

difference()
{
    

//Cubo
translate([38,0.5,raspD2+4])
rotate([0,180,0])
bigCaja();


//Hueco tapa
//translate([-medPared,-medPared,raspDP])
translate([38+medPared,0.5-medPared,raspD2+4.1])
rotate([0,180,0])
cube([raspX+pared,raspY+pared,pared]);



}
}



module bigCaja()
{
//crearRaspCard();
translate([0,0,raspDP+raspD1+6])
cuatroTorn(3);
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
cube([raspX+pared+3,pared,raspD2]);

translate([(raspX/2)-8,raspY-1,pared-8])
cube([15,medPared+1,25]);
}

}

module ladoUSB()
{

difference()
{

translate([-pared,-pared,0])
cube([raspX+pared,pared,raspD2]);

translate([1,-medPared,pared+raspAlza-4])
cube([54,medPared+0.1,28]);
    
//LAN 1
translate([2.4,-medPared-(medPared/2),pared+raspAlza+1.3])
cube([16,medPared,11.3]);

//LAN 2
translate([2.4,-pared-(medPared/2)-0.1,pared+raspAlza+1.3])
cube([16,medPared,11.3]);

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

translate([-pared-1,raspY-16.4,5.8+offsetElec])//z=5.8
cube([2.2,12,8]);

translate([-2,27.5,pared-12])
cube([3.1,35,25]);

translate([-1,68.5,pared-12])
cube([2,12,25]);

translate([-pared+1,raspY-14.4,pared+raspAlza+1.4])
{
    translate([0,0,offsetElec])
	cube([1,8,3.3]);
	translate([1.1,0,offsetElec])
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
	
    translate([raspD1,raspY-raspD1+2,0])
    rotate([0,180,0])
	cylHue(raspD2-5,radio);
    
    
	translate([raspX-raspD1,raspY-raspD1+2,0])
    rotate([0,180,0])
	cylHue(raspD2-4.5,radio);
    

	translate([raspD1,23.5,0])
    rotate([0,180,0])
	cylHue(raspD2-5,radio);

	translate([raspX-raspD1,23.5,0])
    rotate([0,180,0])
	cylHue(raspD2-5,radio);

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
