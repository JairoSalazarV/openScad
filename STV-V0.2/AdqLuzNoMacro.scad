include <settingsLenghts0-1.scad>
include <creaJaulaBase.scad>
include <funcCreaAdqLuzNoMacro.scad>


//Dist. nec. para poner lente en orilla der.
camFrentW = 60+(varillaW*2);
camFrentH = 60+(varillaW*3);

//Distancia entre el lado derecho y orilla del lente
lenLen2R = 15;

//Pos centro final lente
lenXPos = (camXLen/2)-camLW-camHlg-lenLen2R;

//Acho del área del difractor
difrW = 47;
difrPared = 2;

//Medidas del lente
lenteW = (54+1)/2;//Lente + error de impresion
lenteH = 9;

tmpH = 5;
tmpTuboH = cejaH;

//Ranura
ranuraW = 0.1+0.9;
ranuraH = 16;

//Base de jaula con agujero para macro
difference(){
	// Jaula
	creaJaulaBase(tmpH);

	//Área de la base del macro
	translate([0,0,-0.1])
	cylinder(r=(luzWBig-0.4)/2,luzHBig+0.1);
}

translate([0,0,17])
rotate([0,180,0])
crearBaseAdqLuzNoMacro();





