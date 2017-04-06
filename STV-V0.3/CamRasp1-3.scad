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

tmpH = 15;
tmpTuboH = cejaH;

//Ranura
ranuraW = 0.1+0.9;
ranuraH = 16;

tmpTuboW = luzWBig;

slideW = 1.3;
slideH = 14;

rellW = 69;
rellH = 55;
rellD = tmpH-pared;
rellW2 = 33;
rellH2 = 73;
rellW3 = 10;
rellH3 = 73;

camRasp13W = 8+1;//8 mas holgura

difference(){
	//Base de jaula
	creaJaulaBase(tmpH);

	//Deja Paredes
	translate([(-rellW/2)+2.5,-rellH/2,-0.1])
	cube([rellW,rellH,rellD]);
	translate([(-rellW2/2)+7,-rellH2/2,-0.1])
	cube([rellW2,rellH2,rellD]);
	translate([-32,-rellH3/2,-0.1])
	cube([rellW3,rellH3,rellD]);

	//Apertura para cámara Raspberry 1.3
	translate([-camRasp13W/2,-camRasp13W/2,0])
	cube([camRasp13W,camRasp13W,rellD+(pared*2)]);

}








