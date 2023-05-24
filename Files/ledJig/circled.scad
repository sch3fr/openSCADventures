linear_extrude(2){

difference(){
    circle(23, $fn=50);
    circle(17, $fn=50);
    for (angle=[0:30:360]) {
        rotate([0, 0, angle]) translate([20, 0, 0]) circle(1.8, $fn=50);
    }
}
}