

camW = 25.2;
camH = 25.4;
camD = 1;

camTW = 2;

lenW = 8.2;
lenH = 8.2;
lenD = 5.5;


//createCamara();

module createCamara(){

difference(){

//Tableta
cube([camW,camH,camD]);


createCamTornillos();


}

//lente
translate([(camW/2)-lenW/2,10-lenW/2,camD-0.1])
cube([lenW+0.1,lenH,lenD]);

//Cable
cableD = 3;
translate([0,0,-cableD+0.1])
cube([camW,6,cableD]);



}


module createCamTornillos(){

//Tornillos
translate([1.9,10,-1])
cylinder(r=camTW/2,5);
translate([1.9+21.4,10,-1])
cylinder(r=camTW/2,5);

translate([1.9,10+13.5,-1])
cylinder(r=camTW/2,5);
translate([1.9+21.4,10+13.5,-1])
cylinder(r=camTW/2,5);

}