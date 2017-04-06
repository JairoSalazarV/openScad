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

//Medidas del lente
lenteW = (54+1)/2;//Lente + error de impresion
lenteH = 10;

//Alto del lente + altoDifractor + pared

creaDifractoYMacro();



module creaDifractoYMacro(){
	if(false){
		translate([-camW/2,-camH/2,0])
		%cube([camW,camH,camP]);
	}
	difference(){

		//Base de jaula	
		creaJaulaBase(cejaH);

		//Quita el área donde irá la guia
		translate([0,0,-0.1])
		cylinder(r=mcW-0.2,cejaH+0.2);		

	
	}
}


//Pone la guia
creaGuia(cejaH+0.1);





