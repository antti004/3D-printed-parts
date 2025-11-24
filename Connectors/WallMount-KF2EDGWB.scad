// ==========================
// PARAMETERS (easy to edit)
// ==========================

// Main box
BOX_W = 40;      // width  (X)
BOX_L = 30;     // length (Y)
BOX_H = 3;    
BOX_R = 4;
HOLE_INSET = 10;
HOLE_DIAM = 4.5;
HOLE_FN = 30;

CON_PINS = 2;



// Main plate with rounded corners
difference(){
    linear_extrude(BOX_H)
        offset(r = BOX_R) 
            offset(r = -BOX_R) 
                square([BOX_W, BOX_L], center = true);
                
/*                
    // Optional mounting holes (uncomment if you want them)
     translate([ BOX_W/2 - HOLE_INSET,  BOX_L/2 - HOLE_INSET, -0.1]) 
        hole_M4();
     translate([-BOX_W/2 + HOLE_INSET,  BOX_L/2 - HOLE_INSET, -0.1]) 
        hole_M4();
     translate([ BOX_W/2 - HOLE_INSET, -BOX_L/2 + HOLE_INSET, -0.1]) 
        hole_M4();
     translate([-BOX_W/2 + HOLE_INSET, -BOX_L/2 + HOLE_INSET, -0.1]) 
        hole_M4();
   */ 
    Y = -5;
    connector_holes(0,Y);
    connector_body(0,Y);
}



module connector_holes(xPos,yPos){
    X = xPos;
    Y = yPos;
    holes_between = 3.81*CON_PINS+6.19;
    
    translate( [X - holes_between/2, Y -0.1] )
        hole_M2();

    translate( [X + holes_between/2, Y -0.1] )
        hole_M2();
    
    
}

module connector_body(xPos,yPos){
    body_w = 3.81*CON_PINS+10.89;
    body_w = (CON_PINS-1)*3.5+10;
    
    body_l = 8.1;
    body_y = yPos - body_l/2;
    
    //2.55 disance between hole center and top side of body
    y = yPos + (body_l/2)+2.55;
    y = yPos+2.55;
    linear_extrude(BOX_H)
        translate( [ xPos - body_w/2, y, -0.1 ])
            square([body_w,body_l], center = false);
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
