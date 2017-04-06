include <settingsLenghts.scad>


/////////////////////////////////////

extH = 45;


//Pone guia macho
creaGuia(cejaH);

//Pone la extensión
translate([0,0,cejaH])
creaPared(extH);


//Pone la guia hembra
translate([0,0,extH + cejaH])
creaGuiaHembra(cejaH);





