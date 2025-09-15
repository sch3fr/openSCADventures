bpt = 1.2; //bottom plate thickness
cr = 4; //corner radius

module screwHole() {
    translate([0,0,-1])cylinder(h = 6, r = 4, $fn=100);
    translate([0,8.25,-1])cylinder(h = 6, d = 3.25, $fn=100);
    translate([-3.25/2,0,-1])cube([3.25,8.25,6]);
};


module bottomBase() {
    hull(){
        translate([0,0,0]) cylinder(h = bpt, r = cr);
        translate([78-2*cr,0,0]) cylinder(h = bpt, r = cr);
        translate([0,160-2*cr,0]) cylinder(h = bpt, r = cr);
        translate([78-2*cr,160-2*cr,0]) cylinder(h = bpt, r = cr);
    };
};

difference() {
    bottomBase();
    translate([78/2-4,160-36,0])screwHole();
    translate([78/2-4+20,160-36,0])screwHole();
    translate([78/2-4-20,160-36,0])screwHole();
    translate([78/2-4,24,0])screwHole();
};
//import("backplate.stl");