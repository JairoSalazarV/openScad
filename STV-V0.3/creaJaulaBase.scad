include <settingsLenghts.scad>


//Dist. nec. para poner lente en orilla der.
varillaW  = (6+2.1)/2; //Radio: 6 + 1 para que quepa fácil
camFrentW = 60+(varillaW*2);
camFrentH = 60+(varillaW*3);
camDispW = 50;
camDispH = 60;

//Distancia entre el lado derecho y orilla del lente
lenLen2R = 15;

//Pos centro final lente
lenXPos = (camXLen/2)-camLW-camHlg-lenLen2R;

//creaJaulaBase(20);

module creaJaulaBase(baseH){

	if(false){
		translate([-camW/2,-camH/2,0])
		%cube([camW,camH,baseH]);
	}

	difference(){

		//Pone la base de la cámara	
		translate(
					[
						-(camFrentW+varillaW)/2,
						-(camFrentH+varillaW+5)/2,0
					])
		cube(
				[
					camFrentW+varillaW+5,
					camFrentH+varillaW+5,
					baseH]);
	
		//Pone guia para jaula
		creaVarillaHuecos(baseH);
	
	}

}





module creaVarillaHuecos(baseH){
	//Izq Abajo
	translate(
				[
					-(camFrentW/2)+varillaW+14,
					-(camFrentH/2)+(varillaW/2),
					-0.1
				])
	cylinder(r=varillaW,baseH+0.2);

	//Der Abajo
	translate(
				[
					(camFrentW/2)-varillaW,
					-(camFrentH/2)+(varillaW/2),
					-0.1
				])
	cylinder(r=varillaW,baseH+0.2);

	//Izq Arriba
	translate(
				[
					-(camFrentW/2)+varillaW+14,
					(camFrentH/2)-(varillaW/2)+1,
					-0.1
				])
	cylinder(r=varillaW,baseH+0.2);

	//Der Arriba
	translate(
				[
					(camFrentW/2)-varillaW,
					(camFrentH/2)-(varillaW/2)+1,
					-0.1
				])
	cylinder(r=varillaW,baseH+0.2);

}









