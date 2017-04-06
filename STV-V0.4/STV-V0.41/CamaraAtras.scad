

pared = 2;

diffW = 51;
diffH = 51;
diffD = 1;

cajaW = 97.3;
cajaH = 25;
cajaD = 10;

// Raspbase
translate([-cajaW/2,0,0])
cube([cajaW,cajaH,cajaD]);

//Cámara atrás
translate([-diffW/2,cajaH-1,0])
cube([diffW+pared,diffH+pared,cajaD]);