//should be parametric
//trying to make 3D printable
//extension for A07 MITX case

pLength = 10;

mainHeight = 223;
mainWidth = 104;

brimSize = 10;
screwOffset = 8;
notchOffset = 10;

module mainBody() {
    difference(){
        cube([mainWidth, mainHeight, pLength]);
        translate([1,1,0])cube([mainWidth-2, mainHeight-2, pLength+2]);
    };
    difference() {
        translate([0,mainHeight-10,0])cube([mainWidth, 10, 2]);
        translate([mainWidth/2,mainHeight-1-brimSize/2,-1])cylinder(h=10,d=3,center=true, $fn=50);
    };
    translate([0,0,-pLength])cube([mainWidth,2,pLength+10]);
}

module topThingy() {
    difference() {
        translate([0, mainHeight-brimSize, pLength-1])cube([mainWidth, brimSize, 1]);
        translate([mainWidth/2,mainHeight-1-brimSize/2,-1]) cylinder(h=10, d=5, center = true);
}

module screwHole() {
        rotate([90,0,0])cylinder(h = 10, d = 3, center = true, $fn=50);
};

module notch(){
    cylinder(h=4, d=3, center = true, $fn=50);
    translate([0,-1.5,0])cube([3,3,4], center = true);
};

module screwsAndNotches(){
    translate([screwOffset, 0, 4])screwHole();
    translate([mainWidth-screwOffset, 0, 4])screwHole();
    translate([screwOffset, 0, -6])screwHole();
    translate([mainWidth-screwOffset, 0, -6])screwHole();

};

difference() {
    mainBody();
    screwsAndNotches();
};

topThingy();