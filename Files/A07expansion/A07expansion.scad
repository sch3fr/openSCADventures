//should be parametric
//trying to make 3D printable
//extension for A07 MITX case

mainHeight = 223;
mainWidth = 104;

pLength = 10;

difference(){
    cube([mainWidth, mainHeight, pLength]);
    translate([1,1,0])cube([mainWidth-2, mainHeight-2, pLength+2]);
};
translate([0,mainHeight-10,0])cube([mainWidth, 10, 2]);
translate([0,0,-pLength])cube([mainWidth,2,pLength+10]);