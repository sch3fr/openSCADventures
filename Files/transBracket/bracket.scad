module base() {
    cylinder(h = 7, d = 75, center = false, $fn=100);
    cylinder(h = 24, d = 32, center = false, $fn=100);
}

difference() {
    base();
    cylinder(h=80, d = 5, center = true, $fn=100);
}