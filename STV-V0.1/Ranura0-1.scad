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
tmpTuboH = cejaH;

//Ranura
ranuraW = 0.1+0.9;
ranuraH = 16;

difference(){
	//Base de jaula
	creaJaulaBase(tmpH);

	//Quita ranura
	translate([-ranuraW/2, -ranuraH/2,-0.1])
	cube([ranuraW,ranuraH,tmpH+2]);
}

//Pone el tubo
difference(){	

	//Quita el área donde entra el tubo
	cylinder(
				r=((difrDiam)/2)+pared+pared+1,
				tmpTuboH+tmpH
			 );

	//Pone el área del tubo
	translate([0,0,-0.1])
	cylinder(
				r=((difrDiam+(pared*2)+1)/2),
				tmpTuboH+tmpH+0.2
			  );

}







