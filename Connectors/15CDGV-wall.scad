// ==========================
// PARAMETERS (easy to edit)
// ==========================

// Main box
BOX_W = 40;      // width  (X)
BOX_L = 100;     // length (Y)
BOX_H = 3;    
BOX_R = 4;
HOLE_INSET = 4.5;
HOLE_DIAM = 4.5;
HOLE_FN = 30;

CON_COUNT = 5;  // items count
CON_PINS = 2;   // pins on connector
MARGIN_Y = 18;



// Main plate with rounded corners
difference(){
    linear_extrude(BOX_H)
        offset(r = BOX_R) 
            offset(r = -BOX_R) 
                square([BOX_W, BOX_L], center = true);
                
    // Optional mounting holes (uncomment if you want them)
     translate([ BOX_W/2 - HOLE_INSET,  BOX_L/2 - HOLE_INSET, -0.1]) 
        hole_M3();
     translate([-BOX_W/2 + HOLE_INSET,  BOX_L/2 - HOLE_INSET, -0.1]) 
        hole_M3();
     translate([ BOX_W/2 - HOLE_INSET, -BOX_L/2 + HOLE_INSET, -0.1]) 
        hole_M3();
     translate([-BOX_W/2 + HOLE_INSET, -BOX_L/2 + HOLE_INSET, -0.1]) 
        hole_M3();

       //center holes
     translate([ BOX_W/2 - HOLE_INSET,  0, -0.1]) 
        hole_M3();
     translate([ -BOX_W/2 + HOLE_INSET,  0, -0.1]) 
        hole_M3();


    
    Y = -(BOX_L / 2)+10;
    
    for (i = [0 : CON_COUNT-1]) {
        y_position = - 5- (CON_COUNT-1) * MARGIN_Y/2 + i * MARGIN_Y;  // centers the whole row
        connector_holes(0, y_position);
        connector_body(0, y_position);
    }
    
/*    
    for( pos_y = [Y:MARGIN_Y:MARGIN_Y*(CON_COUNT-1)]){
        connector_holes(0,pos_y);
        connector_body(0,pos_y);
    }
  */  
}



module connector_holes(xPos,yPos){
    X = xPos;
    Y = yPos;
    holes_between = 3.81*CON_PINS+6.19;
    
    holes_between = 3.81 * (CON_PINS-1)+10+0.2;

    
    translate( [X - holes_between/2, Y -0.1] )
        hole_M2();

    translate( [X + holes_between/2, Y -0.1] )
        hole_M2();
    
    
}


module connector_body(xPos, yPos) {
    body_w = CON_PINS * 3.81 + 9.8;   // total width of the plastic body
    body_l = 8.1;             // depth of the body (Y direction)
    
    y = yPos + 2.55 + body_l/2;
    
    translate([xPos, y, 0])
        linear_extrude(BOX_H)
            translate([-body_w/2, -body_l/2, -0.1])
                square([body_w, body_l]);
}

module connector_body_2(xPos, yPos) {
    body_w = CON_PINS * 3.81 + 10;
    body_l = 8.1;
    
    // body sits below the mounting holes
    translate([xPos, yPos - body_l/2, 0])
        linear_extrude(BOX_H)
            translate([-body_w/2, 0, -0.1])
                square([body_w, body_l]);
}


module hole_M2(){
    cylinder(h = BOX_H + 0.2, d = 2, $fn=15);
}


module hole_M3(){
    cylinder(h = BOX_H + 0.2, d = 3.5, $fn=HOLE_FN);
}


module hole_M4() {
    cylinder(h = BOX_H + 0.2, d = HOLE_DIAM, $fn=HOLE_FN);
}
