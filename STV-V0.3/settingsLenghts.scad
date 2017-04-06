//Ancho de la pared
pared  = 2;

//Radio del centro hueco
radioC = 11;

//Alto de la capa de apertura
aperH = 5.5;

//Ancho de la apertura
aperW = 6+1.1;//5

//Ancho del lente macro
macroW = 9.3;

//Profundidad del macro
macroH = 3;

//Profundidad parte de atras y delante
profDelante = 6;
profAtras = 6;

//Ceja entre uniones de cilindros
cejaH = 6;
guiaParedW = 2;
tmpHolg = 1.8;

//Diametro del tubo principal
difrDiam = 44;

//Correcc

//
//CÁMARA
camP = 3;//Grueso de la pared del presente modelo
camW = 105;//Ancho de la cámara
camH = 61;//Alto de la cámara
camD = 23.5;//Profundidad de la cámara
camHlg = 6;//Holgura que se deja para los tornillos
camLW = 57/2;//Radio del exterior del lente
torW  = 2;//Radio

//
//Ancho de tubo principal (grande)
mcW = 32;//radio
mcH = 28;

//Dimensiones del difractador
diffW = 51;//Alto y Ancho
diffD=1;//Profundidad del difractador
diffWinW=36;//Ancho de la ventana de difracción
diffWinH=24;//Alto de la ventana de difracción

//
//Adquisición de luz
luzHBig = 10; //donde va el tornillo
luzWBig = 28; //27:diametro donde va el tornillo
luzHBigT = 4; //alto del tornillo
luzWBigT = 6; //6: ancho del tornillo
luzHRosca = 7; //donde va la rosca
luzWRosca = 23; //22:diametro de donde va la rosca


//Cuadro guia para que no se mueva
guiaH = cejaH;
guiaW = 3;



module creaPared(h){
	difference(){
		//Pone el cilindro principal
		cylinder(r=mcW,h);

		//Le quita el contorno exterior
		translate([0,0,-0.1])
		cylinder(r=mcW-pared,h+0.2);
	}
}
module creaGuiaTornilloCentrada(){
	translate([-luzWBigT/2,-luzWBigT/2,0])
	cube([luzWBigT,luzWBigT,luzHBig-1+0.2]);
}
module creaGuiaTornilloCentradaArea(){
	tmpW = luzWBigT + pared;
	tmpH = luzHBig  + pared;
	translate([-tmpW/2,-tmpW/2,0])
	cube([tmpW,tmpW,tmpH]);
}
module creaGuia(h){
	//Pone el circulo soporte
	difference(){
		cylinder(r=mcW,h);
		translate([0,0,-0.1])
		cylinder(r=mcW-pared,h+0.2);
	}
	//Pone la guia1
	translate([0,mcW-pared-(guiaW/2)+0.4,0])
	creaGuiaCentrada(h);
}
module creaGuiaHembra(h){
	//Pone el circulo soporte
	tmpW = mcW-guiaW;	
	creaPared(sopH);
	sopH = 1.35;
	
	//Pone la pared de la guia
	difference(){
		cylinder(r=(mcW-pared),sopH+h);
		translate([0,0,-0.1])
		cylinder(r=(mcW-pared-guiaParedW),sopH+h+0.2);
		//Pone la guia
		translate([-(guiaW/3),tmpW,sopH])
		creaGuiaCentrada(sopH+h+0.2);
		translate([(guiaW/3),tmpW,sopH])
		creaGuiaCentrada(sopH+h+0.2);
	}
}
module creaGuiaCentrada(h){
	translate([-guiaW/2,-guiaW/2,0])
	cube([guiaW,guiaW,h]);
}

