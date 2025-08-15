module outerShell () {
hull() {
    translate([8,12,18]){ // 8, 10, 18 bez offsetu na extension piece
        rotate([90,0,0]){
            union() {
                cylinder(h=10, d=16, $fn=100);
                translate([-8,0,0]){
                    cube([16,34,10]);
                };
                translate([0,34,0]){
                    cylinder(h=10, d=16, $fn=100);
    }; }; }; };
 
    translate([-23,43,20]){
        rotate([0,90,0]){
            cylinder(h=5, d=40, $fn=100);
}; }; };
    
};

module bore () {
hull() {
    translate([8,12,18]){ //8, 10, 18 bez offsetu na extension piece
        rotate([90,0,0]){
            union() {
                cylinder(h=10, d=14, $fn=100);
                translate([-7,0,0]){
                    cube([14,34,10]);
                };
                translate([0,34,0]){
                    cylinder(h=10, d=14, $fn=100);
    }; }; }; };
 
    translate([-23,43,20]){
        rotate([0,90,0]){
            cylinder(h=5, d=38, $fn=100);
}; }; };
};

module screwHoles() {
    translate([8,4,8]){
        rotate([90,0,0]){
            difference(){
                union() {
                    translate([0,2,0]){
                        cylinder(h=2, d=16, $fn=100);
                    };
                    translate([-8,2,0]){
                        cube([16,50,2]);
                        };
                    translate([0,52,0]){
                        cylinder(h=2, d=16, $fn=100);
                    };
                };
                translate([0,-1,0]){
                    cylinder(h=2,d=3,$fn=100);
                };
                translate([0,55,0]){
                    cylinder(h=2, d=3, $fn=100);
                };
            };
        };
    };
};


 
  /*
 translate([-23,23,0]){
 cube([20,40,40]);
 };
 */

/*
    translate([8,1,18]){
        rotate([90,0,0]){
            union() {
                cylinder(h=1, d=16);
                translate([-8,0,0]){
                    cube([16,24,1]);
                };
                translate([0,24,0]){
                    cylinder(h=1, d=16);
}; }; }; };
*/
module fanMount() {
    union() {
        difference(){
            translate([-26,23,0]){cube([3,40,40]);};
            translate([-30,27,4]){rotate([0,90,0])cylinder(h=10, d=4, $fn=50);};
            translate([-30,59,4]){rotate([0,90,0])cylinder(h=10, d=4, $fn=50);};
            translate([-30,27,36]){rotate([0,90,0])cylinder(h=10, d=4, $fn=50);};
            translate([-30,59,36]){rotate([0,90,0])cylinder(h=10, d=4, $fn=50);};
            translate([-28,43,20]){rotate([0,90,0])cylinder(h=10, d=38, $fn=50);};
        };
    };
};



difference(){
    outerShell();
    bore();
};
difference(){
    screwHoles();
    bore();
};
fanMount();