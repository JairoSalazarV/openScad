include <settingsLenghts0-1.scad>
include <creaJaulaBase.scad>


//Dist. nec. para poner lente en orilla der.
camFrentW = 60+(varillaW*2);
camFrentH = 60+(varillaW*3);

//Distancia entre el lado derecho y orilla del lente
lenLen2R = 15;

//Pos centro final lente
lenXPos = (camXLen/2)-camLW-camHlg-lenLen2R;

//Acho del área del difractor
difrW = 47;
difrPared = 3.8;
empaqueH = 2.5;

//Medidas del lente
lenteW = 54/2;//Lente + error de impresion
lenteH = 10;


difference(){
	cylinder(r=lenteW,empaqueH);

	translate([0,0,-0.1])
	cylinder(r=difrDiam/2,empaqueH+0.2);
	
}




