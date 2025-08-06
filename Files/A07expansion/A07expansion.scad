//should be parametric
//trying to make 3D printable
//extension for A07 MITX case

pLength = 20;

mainHeight = 223;
mainWidth = 104;

brimSize = 10;
screwOffset = 11;
notchOffset = 11;

module mainBody() {
    difference(){
        cube([mainWidth, mainHeight, pLength]);
        translate([2,2,0])cube([mainWidth-4, mainHeight-4, pLength+2]);
    };
    difference() {
        translate([0,mainHeight-10,0])cube([mainWidth, 10, 2]);
        translate([mainWidth/2,mainHeight-1-brimSize/2,-1])cylinder(h=10,d=3,center=true, $fn=50);
    };
    translate([0,-2,-10])cube([mainWidth,2,20]);
};


module screwHole() {
        rotate([90,0,0])cylinder(h = 10, d = 3, center = true, $fn=50);
};

module notch(){
    cylinder(h=4, d=3, center = true, $fn=50);
    translate([0,-1.5,0])cube([3,3,4], center = true);
};

module topThingy() {
    difference() {
        translate([0, mainHeight-brimSize, pLength-2])cube([mainWidth, brimSize, 2]);
        translate([mainWidth/2,mainHeight-1-brimSize/2,pLength]) cylinder(h=10, d=6, center = true);
        translate([notchOffset, mainHeight-brimSize+3, pLength])notch();
        translate([mainWidth-notchOffset, mainHeight-brimSize+3, pLength])notch();
    };
};

module screwPostAvoidingThing() {
    translate([1,110,pLength-4])cube([mainWidth-2,11,4]);
}

module bottomScrews(){
    translate([screwOffset, 0, pLength-6])screwHole();
    translate([mainWidth-screwOffset, 0, pLength-6])screwHole();
    translate([screwOffset, 0, -6])screwHole();
    translate([mainWidth-screwOffset, 0, -6])screwHole();

};

difference() {
    mainBody();
    bottomScrews();
    screwPostAvoidingThing();
};

topThingy();