$fn=25;
BOX_W = 80; // Box Width
BOX_L = 120;// Box Length
BOX_H = 3; // Box Height
SCREW_SIZE = 1.5; // Screw size radius.

CORNER_RADIUS = 3; // Radius of corners
WALL_THICKNESS = 2;// Wall Thickness
//square( [BOX_W, BOX_L] );
//offset(r=CORNER_RADIUS) square( [BOX_W, BOX_L] );


linear_extrude( BOX_H )
    difference(){
        offset(r=CORNER_RADIUS) 
            square( [BOX_W, BOX_L], center=true );
        
        offset( r= CORNER_RADIUS - WALL_THICKNESS )
            square( [15, 30], center=true );
        
        
        
    }




coordinates = [ [0,0],[0,BOX_L],[BOX_W,BOX_L],[BOX_W,0] ];

//translate ( [-BOX_W/2, -BOX_L/2] )
//    hull()
//    for (i = coordinates)
 //       translate(i) sphere(CORNER_RADIUS);
    
    
    
    
    
    
/*    
translate ( [-BOX_W/2, -BOX_L/2] )
hull()
for (i = coordinates)
    translate(i) sphere(CORNER_RADIUS);

  */  
    