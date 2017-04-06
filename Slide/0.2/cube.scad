include <navaja.scad>
include <camaraCaja.scad>


//Bajar milimetros para que alcance el connector a entrar
//Recorrer la camara unos milimetros a la derecha
//Poner en la orilla la ranura del lente del frente


cubeP = 3;
cubeX = 70;
cubeY = 68;
cubeZ = 60+2+5;
cubeRad = 56/2;
cubeRan = 2;
cubeRanP = 2;

tornLen = 12;

techoX = 50;
techoY = 40;
techoZ = 20;

if( 1 )
{
    mainCube();
    
    //allTapaInside();
}

module mainCube()
{
    difference()
    {      
        //Slots y Rasp-Caja
        allAreaSlotsAndCam();
        
        //Ceja
        allTapa();
        
        //Tornillos de tapa
        tornTapa( 1.5, 12 );
    }
}




module allTapaInside()
{
    difference()
    {
        areaAllTapaInside();
    
        //Tornillos de tapa
        translate([0,0,8])
        tornTapa( 1.75, 12 );
        
        //Tornillos Cabeza
        translate([0,0,6])
        tornTapa( 3, 5 );
    
    }
}

module areaAllTapaInside()
{
    //Lado cámara
    translate([2,2,64])
    cube([27,89.5,3.1]);
    
    //Lado slots
    translate([27,14.5,64])
    cube([69,64,3.1]);
}


module allTapa()
{
    //Lado cámara
    translate([1.5,1.5,64])
    cube([28,90.5,3.1]);
    
    //Lado slots
    translate([26.5,14,64])
    cube([70,65,3.1]);
}

module tornTapa(intR, intH)
{
    translate([50,20,64-intH+0.1])
    cylinder(r=intR,intH,$fn=20);
    
    translate([50,72,64-intH+0.1])
    cylinder(r=intR,intH,$fn=20);
}

module allAreaSlotsAndCam()
{

    //Slots
    translate([(raspD2+cubeX-3),((raspY/2)+pared),0])
    rotate([0,0,180])
    slots();

    //Caja
    translate([0,pared,(raspX+pared)])
    rotate([0,90,0])
    camaraBaseCajaInt();
}


module camaraBaseCajaInt()
{

//Cam paredes
translate([-medPared-2-3,-medPared, raspD2-pared+1])
cube([raspX+pared+2+3,12,3]);
translate([-medPared-2-3,raspY-13, raspD2-pared+1])
cube([raspX+pared+2+3,17,3]);


difference()
{
bigCajaInt();
//Ceja anterior
//translate([-medPared-5,-medPared, raspD2-pared+0.1])
//cube([raspX+pared+5,raspY+pared,pared]);

translate([2.4,-medPared-(medPared/2),pared+raspAlza+1.3])
cube([16,medPared,11.3]);

translate([2.4,-pared-(medPared/2)-0.1,pared+raspAlza+1.3])
cube([16,medPared,11.3]);

}
}

module bigCajaInt()
{
crearRaspCardInt();
//ladoConnector();
ladoUSBInt();
ladoMiniSDInt();
ladoPines();
}

module crearRaspCardInt()
{
    translate([-4-3,0,0])
	cube([raspX+5+3,raspY,pared]);
	cuatroTorn(3);

}

module ladoMiniSDInt()
{
    difference()
    {
    translate([-pared-3,raspY,0])
    cube([raspX+pared+1+3,pared,raspD2]);

    translate([-15,raspY-0.5,pared])
    cube([70,medPared+1,14]);
    }

}

module ladoUSBInt()
{

    difference()
    {

    translate([-pared-3,-pared,0])
    cube([raspX+pared+1+3,pared,raspD2]);

    translate([-15,-medPared,pared+raspAlza])
    cube([70,medPared+0.1,21]);

    }

}




module slots()
{

    difference()
    {
        creaArea();
        
        //Cannon | Macro and Slide
        translate([2,0,0])
        genericCube(7+14);
        
        //Diffracter
        translate([23+30,0,0])
        genericCube(4);
        //genericCube(4);
        
        //Camera
        translate([57+5,0,0])
        genericCube(6);
        
        //Tornillos
        //tornillos();
        
        //Techo        
        translate([21,-19,45])
        cube([techoX,techoY,techoZ]);
        
    }

}

module tornillos()
{
    translate([cubeX/2,-(cubeY/2)+tornLen-1,5])
    rotate([90,0,0])
    cylinder(r=2,tornLen,$fn=30);
    
    translate([cubeX/2,(cubeY/2)+1,5])
    rotate([90,0,0])
    cylinder(r=2,tornLen,$fn=30);
}

module genericCube(intH)
{
    translate([0,-30,cubeRanP])
    cube([intH,60,60+10]);
}


module creaArea()
{
    difference()
    {
        translate([0,-cubeY/2,0])
        cube([cubeX,cubeY,cubeZ]);
    
        translate([-0.1,0,cubeRad+(cubeP*2)])
        rotate([0,90,0])
        cylinder(r=cubeRad,cubeX+1,$fn=100);
        
        //Para que quepa la cámara
        translate([65,17,35])
        cube([8,10,30]);
        //Para que quepa la cámara
        translate([65,-26,35])
        cube([8,10,30]);
    }
}

module navajaCuadro( intH )
{
    difference()
    {
        translate([0,0,intH])
        rotate([0,180,0])
        creaNavajas( intH );
        
        translate([0,0,-0.2])
        cuboMasPared(49,49,30,30,15);
        
    }
}


