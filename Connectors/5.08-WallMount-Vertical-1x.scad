// Main box
BOX_W = 50;      // width  (X)
BOX_L = 65;     // length (Y)
BOX_H = 4;    
BOX_R = 4;
HOLE_PADDING = 6;
HOLE_DIAM = 4.5;
HOLE_FN = 30;
PIN_DIST = 5.08;

CONNECTOR_PINS = 2;


// Main plate with rounded corners
difference(){
    linear_extrude(BOX_H)
        offset(r = BOX_R) 
            offset(r = -BOX_R) 
                square([BOX_W, BOX_L], center = true);
                
             
   // mounting_holes(BOX_W,HOLE_PADDING);
    
     mounting_holes_corner(BOX_W,BOX_L,HOLE_PADDING);

    
    ROW1 = 5;
    ROW2 = -15;
    for ( i = [-23:20:40]) 
        connector(0,i,CONNECTOR_PINS);
    

    
}

module connector(posX,posY,pins){
    connector_holes(posX,posY,pins);
    connector_body(posX,posY,pins);
}




module connector_holes(xPos,yPos,pins){
    X = xPos;
    Y = yPos;
    //holes_dist = PIN_DIST * (pins-1)+10+0.2;
    holes_dist = PIN_DIST * (pins+2);
    
    translate( [X - holes_dist/2, Y -0.1] )
        hole_M3();

    translate( [X + holes_dist/2, Y -0.1] )
        hole_M3();
}



module connector_body(xPos, yPos,pins) {
    body_w = pins * 5.08 + 2.7;   // total width of the plastic body
    body_l = 8.0;             // depth of the body (Y direction)
    
    y = yPos + 2.55 + body_l/2;
    
    translate([xPos, y, 0])
        linear_extrude(BOX_H)
            translate([-body_w/2, -body_l/2, -0.1])
                square([body_w, body_l]);
}



module mounting_holes(w,padding){
    // Right side
    translate([ w/2 - padding,  0, -0.1]) 
    hole_M3();
    
    translate([ w/2 - padding,  25/2, -0.1]) 
    hole_M3();

    translate([ w/2 - padding, 0- 25/2, -0.1]) 
    hole_M3();

    // Left side holes
    translate([ 0- w/2 + padding,  0, -0.1]) 
    hole_M3();
    
    translate([0- w/2 + padding,  25/2, -0.1]) 
    hole_M3();

    translate([0- w/2 + padding, 0- 25/2, -0.1]) 
    hole_M3();

    
}

module mounting_holes_corner(w,h,padding){
    // Right side
    translate([ w/2 - padding, h/2-padding, -0.1]) 
    hole_M3();
    

    translate([ w/2 - padding, 0- (h/2)+padding, -0.1]) 
    hole_M3();

    // Left side holes
    translate([ 0- w/2 + padding,  h/2-padding, -0.1]) 
    hole_M3();
    

    translate([0- w/2 + padding, 0-h/2+padding, -0.1]) 
    hole_M3();

    
}


module hole_M2(){
    cylinder(h = BOX_H + 0.2, d = 2, $fn=15);
}


module hole_M3(){
    cylinder(h = BOX_H + 0.2, d = 3.5, $fn=HOLE_FN);
}