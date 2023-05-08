sirkaTabletu = 203; //209mm + steny - 10mm co nevim kde se vzaly
vyskaTabletu = 129; //127mm + stena
tloustkaTabletu = 9.5;
tloustkaSten = 2;
sirkaDrzaku = 10;

//	
//	⚠️ This is where the clean code ends. ⚠️
//
//	Explore on your own risk.
//

module base(){
	linear_extrude(tloustkaSten){
		square([sirkaDrzaku, vyskaTabletu]);
		square([sirkaTabletu, sirkaDrzaku]);
		translate([sirkaTabletu, 0, 0])square([sirkaDrzaku,vyskaTabletu]);
	}
};

module baseBrace(){
	hull(){
		translate([0, vyskaTabletu - sirkaDrzaku, 0]) square(sirkaDrzaku);
		translate([sirkaTabletu, 0, 0]) square(sirkaDrzaku);
	}
	hull(){
		translate([0, 0, 0]) square(sirkaDrzaku);
		translate([sirkaTabletu, vyskaTabletu - sirkaDrzaku, 0]) square(sirkaDrzaku);
	}
}

module walls(){
	linear_extrude(tloustkaTabletu + tloustkaSten){
		square([tloustkaSten, vyskaTabletu]);
		square([sirkaTabletu + sirkaDrzaku, tloustkaSten]);
		translate([sirkaTabletu + sirkaDrzaku - tloustkaSten, 0, 0])square([tloustkaSten, vyskaTabletu]);
	}
};

module screwHoles(){
	translate([sirkaDrzaku/2, 20]) cylinder(tloustkaSten, 1.5, 3);
	translate([sirkaDrzaku/2, vyskaTabletu - 20]) cylinder(tloustkaSten, 1.5, 3);
}

module singleUpperHole(){
	cylinder(tloustkaSten, 3, 3);
	translate([3, 0, 0]) cube([6, 6, 10], center = true);
}

module upperHoles(){
	translate([sirkaDrzaku/2, 20, tloustkaTabletu + tloustkaSten]) singleUpperHole();
	translate([sirkaDrzaku/2, vyskaTabletu - 20, tloustkaTabletu + tloustkaSten]) singleUpperHole();
	
	translate([sirkaDrzaku/2 + sirkaTabletu, 20, tloustkaTabletu + tloustkaSten]) rotate([0, 0, 180]) singleUpperHole();
	translate([sirkaDrzaku/2 + sirkaTabletu, vyskaTabletu - 20, tloustkaTabletu + tloustkaSten]) rotate([0, 0, 180]) singleUpperHole();
}

// ======================= body =======================

difference(){
	base();
	screwHoles();
	translate([sirkaTabletu, 0, 0])screwHoles();
}

difference(){
	walls();
	translate([-1, 40, tloustkaSten]) cube([4,12,8]);
}

difference(){
	translate([0, 0, tloustkaTabletu + tloustkaSten]) base();
	upperHoles();
};