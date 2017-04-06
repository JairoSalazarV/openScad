W = 55;
H = 55;

//createBase( 7 );

module createBase( h ){
	difference(){
		translate([-W/2,-H/2,0])
		cube([W,H,h]);
		//Quita tornillos
		translate([-(W/2)+2.5,-(H/2)+2.5,-0.1])
		cylinder( r=1, h*2+0.2 );
		translate([(W/2)-2.5,(H/2)-2.5,-0.1])
		cylinder( r=1, h*2+0.2 );
		translate([+(W/2)-2.5,-(H/2)+2.5,-0.1])
		cylinder( r=1, h*2+0.2 );
		translate([-(W/2)+2.5,(H/2)-2.5,-0.1])
		cylinder( r=1, h*2+0.2 );
	}
}