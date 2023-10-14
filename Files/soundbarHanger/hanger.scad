$fn=180;

module speakerProfile(diam){
intersection(){
    
    translate([20,0,0])
        circle(d=diam);
	
    rotate([0,0,120])
        translate([20,0,0])
            circle(d=diam);
	
    rotate([0,0,-120])
        translate([20,0,0])
            circle(d=diam);
}
};

difference(){
    speakerProfile(diam=85);
    speakerProfile(diam=70);
}
translate([-38,-15,0])square([20,30]);
