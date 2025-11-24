// =============================================================================
// Plate with mounting holes for KF2EDGWB-3.5 (Degson 3.5 mm pluggable terminal)
// =============================================================================

poles          = 2;    // change this: 2, 3, 4, 5, 6, 8, 10, 12, 16 etc.
hole_diameter  = 3.3;  // slightly larger than 3.2 mm for easy M3 screw or self-tapper
plate_width    = 40;
plate_length   = (poles * 3.5) + 20;  // enough space left/right
plate_thickness = 4;
corner_radius  = 5;

// Distance between the two mounting hole centers (official datasheet value)
hole_spacing = poles * 3.5 + 5.8;

difference() {
    // Main plate with rounded corners
    linear_extrude(plate_thickness)
        offset(r=corner_radius) offset(r=-corner_radius)
            square([plate_width, plate_length], center=true);

    // Left mounting hole
    translate([-hole_spacing/2, 0, -0.1])
        cylinder(h=plate_thickness + 0.2, d=hole_diameter, $fn=40);

    // Right mounting hole
    translate([ hole_spacing/2, 0, -0.1])
        cylinder(h=plate_thickness + 0.2, d=hole_diameter, $fn=40);
}

// Optional: visual reference of the terminal block body (comment out if you don't want it)
%translate([0,0,plate_thickness])
    cube([poles*3.5 + 9.5, 9, 10], center=true);  // approximate body size