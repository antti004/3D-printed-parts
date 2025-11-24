// ==========================
// PARAMETERS (easy to edit)
// ==========================

// Main box
BOX_W = 80;      // width  (X)
BOX_L = 120;     // length (Y)
BOX_H = 30;      // total height (Z)
WALL  = 4;       // wall / floor thickness
R     = 6;       // corner & edge radius (fillet)

// First inner boss / extruded box
INNER1_W = 20;
INNER1_L = 30;
INNER1_H = 15;  // height above the floor
INNER1_X = -20;  // position from center
INNER1_Y =  20;

// Second inner boss / extruded box
INNER2_W = 25;
INNER2_L = 25;
INNER2_H = 20;
INNER2_X =  25;
INNER2_Y = -25;

// ==========================
// MAIN MODEL
// ==========================

// Main rounded box (hollow with thick walls/floor)
difference() {
    // Outer rounded shell
    rounded_box(BOX_W, BOX_L, BOX_H, R);
    
    // Hollow it out (cut everything above floor + walls)
    translate([0,0,WALL])
        rounded_box(BOX_W - 2*WALL, 
                    BOX_L - 2*WALL, 
                    BOX_H,          // cut all the way up + a bit more
                    R - WALL);      // inner radius is reduced by wall thickness
}

// First inner extruded box / pillar
translate([INNER1_X, INNER1_Y, WALL])
    cube([INNER1_W, INNER1_L, INNER1_H], center=true);

// Second inner extruded box / pillar
translate([INNER2_X, INNER2_Y, WALL])
    cube([INNER2_W, INNER2_L, INNER2_H], center=true);

// ==========================
// MODULE: fully rounded box centered on origin
// ==========================
module rounded_box(w, l, h, r) {
    // Corner positions (8 corners of the box)
    corners = [
        [ -w/2, -l/2, -h/2 ],
        [  w/2, -l/2, -h/2 ],
        [  w/2,  l/2, -h/2 ],
        [ -w/2,  l/2, -h/2 ],
        [ -w/2, -l/2,  h/2 ],
        [  w/2, -l/2,  h/2 ],
        [  w/2,  l/2,  h/2 ],
        [ -w/2,  l/2,  h/2 ]
    ];
    
    hull()
        for (pos = corners)
            translate(pos)
                sphere(r = r, $fn=48);
}

// ==========================
// PREVIEW
// ==========================