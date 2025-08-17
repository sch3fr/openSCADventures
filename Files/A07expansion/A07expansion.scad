//should be parametric
//trying to make 3D printable
//extension for A07 MITX case

pLength = 20;

mainHeight = 223;
mainWidth = 104;

brimSize = 10;
screwOffset = 12;
notchOffset = 12;

module mainBody() {
    difference(){
        cube([mainWidth, mainHeight, pLength]);
        translate([2,2,0])cube([mainWidth-4, mainHeight-4, pLength+2]);
    };
    difference() {
        translate([0,mainHeight-10,0])cube([mainWidth, 10, 2]);
        translate([mainWidth/2+0.5,mainHeight-1-brimSize/2,-1])cylinder(h=10,d=4,center=true, $fn=50);
        translate([mainWidth/2-0.5,mainHeight-1-brimSize/2,-1])cylinder(h=10,d=4,center=true, $fn=50);
        translate([notchOffset, mainHeight-brimSize+3, 0])notch();
        translate([mainWidth-notchOffset, mainHeight-brimSize+3, 0])notch();
    };
    translate([0,-2,-10])cube([mainWidth,2,18]);
};


module screwHole() {
        rotate([90,0,0])cylinder(h = 10, d = 3.5, center = true, $fn=50);
};

module notch(){
    cylinder(h=4, d=4, center = true, $fn=50);
    translate([0,-1.5,0])cube([4,3,4], center = true);
};

module topThingy() {
    difference() {
        #translate([0, mainHeight-brimSize, pLength-1.5])cube([mainWidth, brimSize, 1.5]);
        translate([mainWidth/2,mainHeight-1-brimSize/2,pLength]) cylinder(h=10, d=7, center = true);
        translate([notchOffset, mainHeight-brimSize+3, pLength])notch();
        translate([mainWidth-notchOffset, mainHeight-brimSize+3, pLength])notch();
    };
};

module screwPostAvoidingThing() {
    translate([1,105,pLength-4])cube([mainWidth-2,11,4]);
}

module bottomScrews(){
    translate([screwOffset, 0, pLength-5])screwHole();
    translate([mainWidth-screwOffset, 0, pLength-5 ])screwHole();
    #translate([screwOffset, 0, -5])screwHole();
    #translate([mainWidth-screwOffset, 0, -5])screwHole();

};

module bracing() {
    //braces across
    translate([0,20,pLength-3])cube([mainWidth,3,3]);
    translate([0,60,pLength-3])cube([mainWidth,3,3]);
    translate([0,100,pLength-3])cube([mainWidth,3,3]);
    translate([0,140,pLength-3])cube([mainWidth,3,3]);
    translate([0,180,pLength-3])cube([mainWidth,3,3]);
    
    //side bracing
    translate([mainWidth-5, 0, pLength-10])cube([4,103,10]);
    translate([1, 0, pLength-4])cube([4,103,4]);
    
};

module intakeHoles(){
    rotate([0,90,0])translate([-8,10,0])cylinder(h=10, d=2.5, $fn=50);
    rotate([0,90,0])translate([-8,66,0])cylinder(h=10, d=2.5, $fn=50);
    rotate([0,90,0])translate([-8,21,-2]){
        union(){
            cylinder(h=10, d=14, $fn=100);
            translate([-7,0,0]){
                cube([14,34,10]);
            };
            translate([0,34,0]){
                cylinder(h=10, d=14, $fn=100);
            };
        };
    };
};

module intakeReinforcement() {
    hull(){
        translate([2,10,0]) cube([1,57,0.1]);
        translate([2,10,0]) cube([0.1,57,1]);
    };
};

difference() {
    mainBody();
    bottomScrews();
    screwPostAvoidingThing();
    intakeHoles();
};

bracing();
intakeReinforcement();

topThingy();

hull(){
translate([0,-2,7])cube([mainWidth, 2, 1]);
translate([0,0,8])cube([mainWidth, 1, 3]);
};