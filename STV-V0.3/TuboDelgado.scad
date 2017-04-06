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
difrPared = 2;

//Medidas del lente
lenteW = (54+1)/2;//Lente + error de impresion
lenteH = 9;

tmpH = 5;
tuboH = 95-tmpH;

tmpAnchoTubo = luzWBig;


difference(){

	//Crea área de base y tubo
	creaTuboYBase();

	//Quita el centro
	translate([0,0,-0.1])
	cylinder(
				r=(tmpAnchoTubo/2)-(pared*0.75),
				tuboH+tmpH+0.2
			);

}







module creaTuboYBase(){

	//Base de jaula
	creaJaulaBase(tmpH);

	//Crea tubo
	translate([0,0,tmpH-0.1])
	cylinder(r=(tmpAnchoTubo/2)+pared,tuboH);

}

