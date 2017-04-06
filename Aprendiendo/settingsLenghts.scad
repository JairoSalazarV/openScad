//Ancho de la pared
pared  = 2;
//Radio del centro hueco
radioC = 11;
//Alto de la capa de apertura
aperH = 6;
//Ancho de la apertura
aperW = 5;
//Ancho del lente macro
macroW = 9.3;
//Profundidad del macro
macroH = 3;
//Profundidad parte de atras y delante
profDelante = 6;
profAtras = 6;
//Ceja entre uniones de cilindros
cejaH = 6;


//
//Ancho de tubo principal (grande)
mcW = 32;//radio
mcH = 25;

//
//Adquisición de luz
luzHBig = 10; //donde va el tornillo
luzWBig = 27; //diametro donde va el tornillo
luzHBigT = 4; //alto del tornillo
luzWBigT = 6; //ancho del tornillo
luzHRosca = 7; //donde va la rosca
luzWRosca = 22; //diametro de donde va la rosca



//Cuadro guia para que no se mueva
guiaH = 10;
guiaW = 2.5;

module creaGuiaCentrada(){
	translate([-guiaW/2,-guiaW/2,h-guiaH])
	cube([guiaW,guiaW,guiaH]);
}

module creaGuiaTornilloCentrada(){
	translate([-luzWBigT/2,-luzWBigT/2,0])
	cube([luzWBigT,luzWBigT,luzHBig+0.2]);
}
module creaGuiaTornilloCentradaArea(){
	tmpW = luzWBigT + pared;
	tmpH = luzHBig  + pared;
	translate([-tmpW/2,-tmpW/2,0])
	cube([tmpW,tmpW,tmpH]);
}
