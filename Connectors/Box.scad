$fn=25;
BOX_W = 80; // Box Width
BOX_L = 120;// Box Length
BOX_H = 12; // Box Height

SCREW_SIZE = 1.5; // Screw size radius.

CORNER_RADIUS = 3; // Radius of corners
WALL_THICKNESS = 2;// Wall Thickness

POST_OFFSET=10;

linear_extrude( BOX_H )
    difference(){
        offset(r=CORNER_RADIUS) 
            square( [BOX_W, BOX_L], center=true );
        
        offset( r= CORNER_RADIUS - WALL_THICKNESS )
            square( [BOX_W-WALL_THICKNESS, BOX_L-WALL_THICKNESS], center=true );
    }


coordinates = [ [0,0],[0,BOX_L],[BOX_W,BOX_L],[BOX_W,0] ];

translate ( [-BOX_W/2, -BOX_L/2] )
    hull()
    for (i = coordinates)
        translate(i) sphere(CORNER_RADIUS);

p_w = BOX_W - POST_OFFSET;
p_l = BOX_L - POST_OFFSET;

resize([p_w,p_l,0]) // Move the posts in from the edge
    translate([-BOX_W/2,-BOX_L/2,0])
       for (i = coordinates)
           translate(i)
           scale([BOX_W/p_w,BOX_L/p_l])
               difference(){
                 cylinder(h=BOX_H,r=CORNER_RADIUS);
                 cylinder(h=BOX_H,r=SCREW_SIZE/2);
               }