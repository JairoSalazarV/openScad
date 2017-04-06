include <settingsLenghts.scad>


camXLen = camW+camHlg*2;//Dist. nec. para poner lente en orilla der.
lenLen2R = 15;//Distancia entre el lado derecho y orilla del lente
lenXPos = (camXLen/2)-camLW-camHlg-lenLen2R;//Pos centro final lente

difference(){
	
	//translate([-(camW/2),-(camH/2)+camHlg,0])
	//cube([camW,camH,camP]);

	//Pone la base de la cámara	
	translate([-camXLen/2,-camH/2,0])
	cube([camW+(camHlg*2),camH+camHlg+3,camP]);
	
	//Quita el área donde entra la cámara
	translate([lenXPos,camHlg,-0.1])
	cylinder(r=camLW+0.5,camP+0.2);

	//Tornillo sup. der.
	translate([(camW/2)+(camHlg/2),(camH/2),-0.1])
	cylinder(r=torW,camP+0.2);

	//Tornillo inf. der.
	translate([(camW/2)+(camHlg/2),-((camH/2)-(camHlg/2)),-0.1])
	cylinder(r=torW,camP+0.2);

	//Tornillo sup. izq.
	translate([-(camW/2)-(camHlg/2),(camH/2),-0.1])
	cylinder(r=torW,camP+0.2);

	//Tornillo inf. izq.
	translate([-(camW/2)-(camHlg/2),-(camH/2)+(camHlg/2),-0.1])
	cylinder(r=torW,camP+0.2);

	//Tornillo sup. cent.
	//translate([-25,(camH/2),-0.1])
	//cylinder(r=torW,camP+0.2);

	//Tornillo inf. cent.
	translate([-25,-(camH/2)+(camHlg/2),-0.1])
	cylinder(r=torW,camP+0.2);
	
}

//Pone la guia hembra
translate([lenXPos,camHlg,camP-1.35])
creaGuiaHembra(cejaH);










