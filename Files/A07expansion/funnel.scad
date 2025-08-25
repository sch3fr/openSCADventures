module funnel(){

difference(){
    union(){
        cylinder(h=4, d=14, $fn=100);
        translate([-7,0,0]){cube([14,34,4]);};
        translate([0,34,0]){cylinder(h=4, d=14, $fn=100);};
    };
    union(){
        translate([0,0,-1])cylinder(h=6, d=13, $fn=100);
        translate([-6.5,0,-1]){cube([13,34,6]);};
        translate([0,34,-1])cylinder(h=6, d=13, $fn=100);
        
    };
};
};

hull(){
    translate([0,0,2])cylinder(h=0.01, d=12, $fn=100);
    translate([0,34,2])cylinder(h=0.01, d=12, $fn=100);
    translate([-6,0,2])cube([12,34,0.01]);

    translate([-4,0,1])cylinder(h=1, d=12, $fn=100);
    translate([-4,34,1])cylinder(h=1, d=12, $fn=100);
    translate([-10,0,1])cube([12,34,1]);
 
};

translate([-4,0,-3])cylinder(h=5, d=12, $fn=100);
translate([-4,34,-3])cylinder(h=5, d=12, $fn=100);
translate([-10,0,-3])cube([12,34,5]);


module whatever(){
    translate([0,0,0])cylinder(h=2, d=12, $fn=100);
    translate([0,34,0])cylinder(h=2, d=12, $fn=100);
    translate([-6,0,0])cube([12,34,2]);

    translate([-4,0,0])cylinder(h=2, d=12, $fn=100);
    translate([-4,34,0])cylinder(h=2, d=12, $fn=100);
    translate([-10,0,0])cube([12,34,2]);
};