// Tablet dimensions:
tabletX = 210;
tabletY = 127;
tabletZ = 9.5;

walls = 2;
//	⚠️ This is where the clean code ends. ⚠️
//
//	Explore on your own risk.

module base(){
    linear_extrude(walls){
        hull(){
            circle(5);
            translate([-15, -5, 0]) circle(10);
            translate([-15, -tabletY+5, 0]) circle(10);
            #translate([-15, -tabletY-5, 0]) square(20);
        }

        hull(){
            translate([-12.5, -tabletY-5, 0]) square(40);
            translate([tabletX-60, -tabletY-5, 0]) square(40);
        }

        hull(){
            #translate([tabletX-15, 0, 0]) circle(5);
            translate([tabletX, -5, 0]) circle(10);
            #translate([tabletX, -tabletY+5, 0]) circle(10);
            translate([tabletX-20, -tabletY-5, 0]) square(20);
        }
    }
}

module topper(){
    linear_extrude(tabletZ+2){
        square([walls+2, tabletY-20]);
    }

    linear_extrude(tabletZ+2){
        translate([tabletX+31, 0, 0])square([walls+2, tabletY-20]);
    }
}


base();
#translate([-25, -tabletY+10, 0])topper();