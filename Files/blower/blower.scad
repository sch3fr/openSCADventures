blower_prumer=90;
vyska_ventilatoru=27;
prumer_zahybu=20;
blower_sirka=175;
blower_vyska=90;
screw_spacing=71.5;
blizenci=2;
bay_sirka=146;
bay_vyska=41;
brim=15;

module blower_plate(){
    hull(){ //blower plate
        translate([prumer_zahybu,prumer_zahybu,0])circle(prumer_zahybu);
        translate([blower_sirka-prumer_zahybu,prumer_zahybu,0])circle(prumer_zahybu);
        translate([prumer_zahybu,blower_vyska-prumer_zahybu,0])circle(prumer_zahybu);
        translate([blower_sirka-prumer_zahybu,blower_vyska-prumer_zahybu,0])circle(prumer_zahybu);
    }
}

module fan_hole(){
    translate([40,40,0])circle(38);
    translate([4,4,0])circle(2); //I AM SAD
    translate([76,4,0])circle(2);
    translate([76,76,0])circle(2);
    translate([4,76,0])circle(2);
}

module intake_brim(){
    translate([0,0,-brim]){
        linear_extrude(brim){
            difference(){
                blower_plate();
                offset(-4) {
                    blower_plate();
                }
            }
        }
    }
}

module zaklad(){
    linear_extrude(1){
        difference() {
            blower_plate();
            translate([blower_sirka/2-80,5,0])fan_hole(); //x-80 zajisti zarovnaní 1. díry ke středu
            translate([blower_sirka/2,5,0])fan_hole(); //y=5 protože (blower_vyska-fan_hole)/2
        }
    }

    linear_extrude(vyska_ventilatoru){
        difference(){
            blower_plate();
            offset(-2) {
                blower_plate();
            }
        }
    }
}

module backing(){
    difference(){
        translate([0,0,vyska_ventilatoru]){
            linear_extrude(2){
                blower_plate();
            }
        }
        translate([blower_sirka/2,blower_vyska/2,vyska_ventilatoru])cube([bay_sirka, 2*bay_vyska,4],center=true);
    }
}

module komin(){
    difference(){
        hull(){
            translate([blower_sirka/2,blower_vyska/2,vyska_ventilatoru+2])cube([bay_sirka, 2*bay_vyska,4],center=true);
            translate([blower_sirka/2,blower_vyska/2-bay_vyska/2,vyska_ventilatoru+40])cube([bay_sirka,bay_vyska,2],center=true);
        }
        hull(){
            translate([blower_sirka/2,blower_vyska/2,vyska_ventilatoru+2])cube([bay_sirka-4, 2*bay_vyska-4,4],center=true);
            translate([blower_sirka/2,blower_vyska/2-bay_vyska/2,vyska_ventilatoru+40])cube([bay_sirka-4,bay_vyska-4,2],center=true);
        }
    }
    translate([0,0,vyska_ventilatoru+41])linear_extrude(80){
        difference(){
            translate([blower_sirka/2,blower_vyska/2-bay_vyska/2,0])square([bay_sirka,bay_vyska],center=true);
            offset(-2){translate([blower_sirka/2,blower_vyska/2-bay_vyska/2,0])square([bay_sirka,bay_vyska],center=true);}
        }
    }
}

zaklad();
intake_brim();
backing();
komin();