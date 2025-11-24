// ==========================
// PARAMETERS (easy to edit)
// ==========================

// Main box
BOX_W = 80;      // width  (X)
BOX_L = 120;     // length (Y)
BOX_H = 3;      // total height (Z)
WALL  = 4;       // wall / floor thickness
R     = 6;       // corner & edge radius (fillet)
HOLE_INSET = 10;
HOLE_DIAM = 4.5;
HOLE_FN = 30;

CON_W = 20;
CON_H = 10;

plate_width  = 100;  // X direction
plate_length = 150;  // Y direction
plate_thickness = 5; // Z direction

corner_radius = 8;   // radius of the rounded corners

// Main plate with rounded corners
difference(){
    linear_extrude(BOX_H)
        offset(r = R) 
            offset(r = -corner_radius) 
                square([BOX_W, BOX_L], center = true);
                
                
    // Optional mounting holes (uncomment if you want them)
     translate([ BOX_W/2 - HOLE_INSET,  BOX_L/2 - HOLE_INSET, -0.1]) 
        mounting_hole();
     translate([-BOX_W/2 + HOLE_INSET,  BOX_L/2 - HOLE_INSET, -0.1]) 
        mounting_hole();
     translate([ BOX_W/2 - HOLE_INSET, -BOX_L/2 + HOLE_INSET, -0.1]) 
        mounting_hole();
     translate([-BOX_W/2 + HOLE_INSET, -BOX_L/2 + HOLE_INSET, -0.1]) 
        mounting_hole();
    
    
    
}


module mounting_hole() {
    cylinder(h = BOX_H + 0.2, d = HOLE_DIAM, $fn=HOLE_FN);
}