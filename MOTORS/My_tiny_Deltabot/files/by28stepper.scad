use <complex.scad>
$fn=20;

module by28_holemask(h=10, s=0) {
    translate([-17.5,0,-.5])cylinder(d=4.2+s,h=h,center=true);
    translate([ 17.5,0,-.5])cylinder(d=4.2+s,h=h,center=true);    
    translate([0,8,0]) cylinder(d=9+s,h=h,center=true);
    
}

module by28_shape(h=10,s=0) {
    cylinder(d=28+s,h=h,center=true,$fn=60);
    translate([0,-14,0])cube([28+s,24+(s*.5),h],center=true);
}

module by28_axis(s=0) {
    difference() {
        cylinder (d=5+s, h=20, center=true);
        translate([2.5+(0.5*s),0,7]) cube([2,5,6.1],center=true);
        translate([-2.5-(0.5*s),0,7]) cube([2,5,6.1],center=true);
    }
}

module by28() {
   
    translate([0,0,-9.5])cylinder(d=28,h=19,center=true,$fn=60);
    translate([0,8,0]) {
            cylinder(d=9,h=3,center=true);
            by28_axis();
    }
    
    difference () {
        hull() {
            translate([-17.5,0,-.5])cylinder(d=7,h=1,center=true);
            translate([ 17.5,0,-.5])cylinder(d=7,h=1,center=true);
        }
            translate([-17.5,0,-.5])cylinder(d=4.2,h=2,center=true);
            translate([ 17.5,0,-.5])cylinder(d=4.2,h=2,center=true);        
    }
    
    translate([0,-14,-7])cube([15,6,14],center=true);
}


by28();
