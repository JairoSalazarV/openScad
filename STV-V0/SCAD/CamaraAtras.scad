include <settingsLenghts.scad>


//torW = 2;//Radio
torH = 12-camP;

pestDispW = 7;

//camD = 21.66;//Si se quiere ajustar

difference(){
	creaCamaraAtras();
	translate([0,2,0])
	creaTornillos();
}




///////////////////
if(true){
	translate([58.5,26.5,30.5])
	rotate([-90,180,0])
	%creaCamFrente();
}

if(false){
	translate([camHlg,camP,camHlg])
	%cube([camW,camD,camH]);
}



module creaTornillos(){

//Tornillo inf. der.
translate([114,25,3])
creaTornillo();

//Tornillo inf. cen.
translate([83,25,3])
creaTornillo();

//Tornillo inf. izq.
translate([3,25,3])
creaTornillo();

//Tornillo sup. der.
translate([114,25,60])
creaTornillo();

//Tornillo sup. izq.
translate([3,25,60])
creaTornillo();
}


module creaTornillo(){
	rotate([90,0,0])
	cylinder(r=torW,torH);
}


module creaCamaraAtras(){

//Pone costado izquierdo
cube([camP+camHlg-2,camD+camP,camH+camHlg]);

//Pone pestaña izquierda
cube([pestDispW,camP,camH+camHlg]);

//Pone la base
cube([camW+camHlg*2,camD+camP,camHlg]);

//Pone la tapa
tapaW = 56;
translate([0,0,camH+camHlg])
cube([tapaW,camD+camP,camP]);

//Pone pestaña inferior
pestInf = 8;
cube([camW+camHlg*2,camP,camP+pestInf]);

//Pone pestaña superior
pestSup = 8;
translate([0,0,camH-camP])
cube([tapaW,camP,camP+pestSup]);

//Pone costado derecho
translate([camW+camHlg*2-camHlg,0,0])
cube([camHlg,camD+camP,camH+camHlg+camP]);

}








module creaCamFrente(){


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
}

































