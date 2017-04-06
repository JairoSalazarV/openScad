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

tmpCubW = 90;
tmpCubPatW = 20;

translate([0,0,3])
rotate([-90,0,0])
funcCreaRaspBase();


module funcCreaRaspBase(){
	translate([-38,0,0])
	cube([81,3,55+tmpH]);

	translate([0,27,0])
	funcPonePatas();
}

module funcPonePatas(){
	difference(){
		funcPoneBases();	
		//Quita sobrantes
		translate([0,20,0])
		translate([-tmpCubW/2,-tmpCubW/2,-0.1])
		cube(tmpCubW,tmpCubW,tmpCubW);
		
		translate([-8,-50,-0.1])
		cube([30,100,80]);

		translate([-55,-50,-0.1])
		cube([30,100,80]);

	}
}



module funcPoneBases(){
	//Base de jaula
	creaJaulaBase(tmpH);

	translate([0,0,55])
	creaJaulaBase(tmpH);
}



