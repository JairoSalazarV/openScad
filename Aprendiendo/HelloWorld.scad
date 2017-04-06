module createRope(){
	linear_extrude(
						height = 5, 
						center = true, 
						twist = 360*3, 
						slices = 200
	){
		translate([12, 0, 0]){
			circle(r = 1.8);
		}
	}
}

translate([0, 0, 3]){
	difference(){
		cylinder(r=13,h=6, center=true);
		cylinder(r=11,h=15, center=true);
	}
}
//createRope();