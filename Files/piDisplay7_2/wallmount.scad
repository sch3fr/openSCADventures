bpt = 1.2; //bottom plate thickness
cr = 4; //corner radius
dcr = 8; //display corner radius

frameOuterD = 18;
frameInnerD = 15;

module screwHole() {
    translate([0,0,-1])cylinder(h = 6, r = 4, $fn=100);
    translate([0,8.25,-1])cylinder(h = 6, d = 3.25, $fn=100);
    translate([-3.25/2,0,-1])cube([3.25,8.25,6]);
};

module screwHoleBrace() {
    hull(){
        translate([0,0,bpt])cylinder(1.2, 8, 6);
        translate([0,6,bpt])cylinder(1.2, 8, 6);
    };
};

module bottomPlate() {
    hull(){
        translate([0,0,0]) cylinder(h = bpt, r = cr);
        translate([78-2*cr,0,0]) cylinder(h = bpt, r = cr);
        translate([0,160-2*cr,0]) cylinder(h = bpt, r = cr);
        translate([78-2*cr,160-2*cr,0]) cylinder(h = bpt, r = cr);
    };
};

module bottomBase() {
    bottomPlate();
    
    translate([78/2-4, 24, 0])screwHoleBrace();
    
    translate([78/2-4-20, 160-36, 0])screwHoleBrace();
    translate([78/2-4+20, 160-36, 0])screwHoleBrace();
    translate([78/2-4, 160-35, 0])screwHoleBrace();
    
};

module funnelOutside(){
    hull(){//top full
        translate([-52.25,86.9,0])cylinder(h=1, d=18, $fn=100);
        translate([52.25,86.9,0])cylinder(h=1, d=18, $fn=100);
        translate([-52.25,-86.9,0])cylinder(h=1, d=18, $fn=100);
        translate([52.25,-86.9,0])cylinder(h=1, d=18, $fn=100);
    };
};

module bottomBaseWithScrewholes() {
    difference() {
        bottomBase();
        translate([78/2-4,160-36,0])screwHole();
        translate([78/2-4+20,160-36,0])screwHole();
        translate([78/2-4-20,160-36,0])screwHole();
        translate([78/2-4,24,0])screwHole();
    };
};

translate([-77.88/2+4, -159.94/2+4,0])bottomBaseWithScrewholes();

//import("backplate.stl");
rotate([0,0,90])translate([0,0,40])import("slimframe.stl");

module outerFunnel() {
    hull(){
        hull() {
            translate([-122.5/2+10.22,191.8/2-11.9,40])cylinder(h=1, d=frameOuterD);
            translate([-122.5/2+10.22,-191.8/2-11.9+18,40])cylinder(h=1, d=frameOuterD);
            translate([122.5/2+10.22-18,191.8/2-11.9,40])cylinder(h=1, d=frameOuterD);
            translate([122.5/2+10.22-18,-191.8/2-11.9+18,40])cylinder(h=1, d=frameOuterD);
        };
        #translate([-77.88/2+4, -159.94/2+4,1])bottomBase();
    };
};

module shidBitchFart() {
    hull() {
        translate([-78/2+6,160/2-6,bpt])cylinder(h=1, r=4, $fn=100);
        translate([+78/2-6,160/2-6,bpt])cylinder(h=1, r=4, $fn=100);
        translate([-78/2+6,-160/2+6,bpt])cylinder(h=1, r=4, $fn=100);
        translate([+78/2-6,-160/2+6,bpt])cylinder(h=1, r=4, $fn=100);
    };
    
    
};

shidBitchFart();

outerFunnel();
translate([0,0,40])funnelOutside();