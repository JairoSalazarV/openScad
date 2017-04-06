include <settingsLenghts0-1.scad>
include <creaJaulaBase.scad>


//Dist. nec. para poner lente en orilla der.
camFrentW = 60+(varillaW*2);
camFrentH = 60+(varillaW*3);

//Distancia entre el lado derecho y orilla del lente
lenLen2R = 15;

//Pos centro final lente
lenXPos = (camXLen/2)-camLW-camHlg-lenLen2R;


if(false){
	translate([-camW/2,-camH/2,0])
	%cube([camW,camH,camP]);
}
difference(){

	//Pone la base de la cámara	
	creaJaulaBase();
	
	//Quita el área donde entra la cámara
	translate([0,0,-0.1])
	cylinder(r=camLW+0.2	,baseH+0.2);
	
}

//Pone la guia hembra
translate([0,0,baseH-1.4])
creaGuiaHembra(cejaH);









