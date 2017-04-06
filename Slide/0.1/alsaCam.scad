//creaAlsaCamara(5);
alsaCamTorR = 1;

 //creaAlsaCamara(10);

module creaAlsaCamara( intAlsaCamH )
{    
    difference(){

        translate([-13,-2.9,0])
        cube([26,17,intAlsaCamH]);

        //Tornillos camara
        translate([-10,12,-0.1])
        cylinder(r=alsaCamTorR,intAlsaCamH+0.4,$fn=20);
        translate([10,12,-0.1])
        cylinder(r=alsaCamTorR,intAlsaCamH+0.4,$fn=20);
        translate([-10,-1,-0.1])
        cylinder(r=alsaCamTorR,intAlsaCamH+0.4,$fn=20);
        translate([10,-1,-0.1])
        cylinder(r=alsaCamTorR,intAlsaCamH+0.4,$fn=20);

    }
}
