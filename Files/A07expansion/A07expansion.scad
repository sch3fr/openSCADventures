//should be parametric
//trying to make 3D printable
//extension for A07 MITX case

pLength = 10;

mainHeight = 223;
mainWidth = 104;

brimSize = 10;

difference(){
    cube([mainWidth, mainHeight, pLength]);
    translate([1,1,0])cube([mainWidth-2, mainHeight-2, pLength+2]);
};
difference() {
    translate([0,mainHeight-10,0])cube([mainWidth, 10, 2]);
    translate([mainWidth/2,mainHeight-1-brimSize/2,-1])cylinder(h=10,d=3,center=true);
};
translate([0,0,-pLength])cube([mainWidth,2,pLength+10]);