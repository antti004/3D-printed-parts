// Motor Mount

include <block.scad>;
include <28BYJ-48-Stepper-Motor.scad>;
difference()
{
block(6,2,3,axle_hole=true,reinforcement=true);
translate([-2.5,24,18]) rotate([90,180,90]) stepper28BYJ();
translate([-0.5,24,18]) rotate([0,90,0]) cylinder(r=29/2, h=16.7, $fn=50);
translate([-1,13,25]) rotate([0,0,0]) cube([17,22,10]);

translate([-3,6.5,18]) rotate([0,90,0]) cylinder(r=4/2, h=20, $fn=50);
translate([-3,6.5+35,18]) rotate([0,90,0]) cylinder(r=4/2, h=20, $fn=50);
}

translate([-3,24,18]) rotate([90,180,90]) stepper28BYJ();

difference()
{
translate([0,24,18]) rotate([0,90,0]) cylinder(r=30/2, h=15.7, $fn=50);
translate([-0.5,24,18]) rotate([0,90,0]) cylinder(r=29/2, h=16.7, $fn=50);
translate([-1,13,25]) rotate([0,0,0]) cube([17,22,10]);
}

