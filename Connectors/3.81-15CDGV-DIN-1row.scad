// Main box
BOX_W = 110;      // width  (X)
BOX_L = 45;     // length (Y)
BOX_H = 5;    
BOX_R = 2;
HOLE_PADDING = 5;
HOLE_DIAM = 4.5;
HOLE_FN = 30;

CONNECTOR_PINS = 2;


// Main plate with rounded corners
difference(){
    linear_extrude(BOX_H)
        offset(r = BOX_R) 
            offset(r = -BOX_R) 
                square([BOX_W, BOX_L], center = true);
                
             
    mounting_holes(BOX_W,HOLE_PADDING);
    
    ROW1 = -5;
    POS_X= (BOX_W/2)-20;
//    POS_X = -40;
    echo(POS_X);
    for(x= [0-POS_X:23:BOX_W/2-10]){
        connector(x,ROW1,CONNECTOR_PINS);
    }
 //       connector(0,ROW1,CONNECTOR_PINS);
//        connector(23,ROW1,CONNECTOR_PINS);

    
}

module connector(posX,posY,pins){
    connector_holes(posX,posY,pins);
    connector_body(posX,posY,pins);
}




module connector_holes(xPos,yPos,pins){
    X = xPos;
    Y = yPos;
    //holes_between = 3.81*pins+6.19;
    holes_between = 3.81 * (pins-1)+10+0.2;
    
    translate( [X - holes_between/2, Y -0.1] )
        hole_M2();

    translate( [X + holes_between/2, Y -0.1] )
        hole_M2();
}



module connector_body(xPos, yPos,pins) {
    body_w = pins * 3.81 + 9.8;   // total width of the plastic body
    body_l = 8;  //8.1            // depth of the body (Y direction)
    
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


module hole_M2(){
    cylinder(h = BOX_H + 0.2, d = 2, $fn=15);
}


module hole_M3(){
    cylinder(h = BOX_H + 0.2, d = 3.5, $fn=HOLE_FN);
}