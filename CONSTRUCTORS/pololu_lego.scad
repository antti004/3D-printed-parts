include <configuration.scad>
use <lego_block.scad>

servo_connector_width=7.62;
servo_connector_spacing=2.54;

render_body=true;
render_top=false;

if(render_body){
difference()
{
  union(){
    translate(v=[0,-knob_spacing,0])
    block(4,4,2-1/3,axle_hole=false,reinforcement=true);
    color([0,0,1])
    translate(v=[-knob_spacing*2+wall_thickness/2,-3*knob_spacing+wall_thickness,block_height*1/3])
    cube(size=[(knob_spacing)*4-wall_thickness,knob_spacing*4-wall_thickness*2,block_height*(1+1/3)]);
    }
color([1,0,0])
translate(v=[-6,7,-5.75+block_height*1])
rotate(a=[0,90,0])
#render() import("motor.stl", convexity=10);
translate(v=[-knob_spacing-wall_thickness,-3*knob_spacing+wall_thickness*1.05,block_height*1.153/3])
#render() cube(size=[(knob_spacing+wall_thickness)*2,knob_spacing*2,block_height*2]);
    
    translate(v=[knob_spacing*1,knob_spacing*-2.5,+block_height*1.2])
    #render() cube(size=[servo_connector_width*4/3*1.1,knob_spacing*1.1*2/3,servo_connector_spacing]);
    translate(v=[knob_spacing*1,knob_spacing*-2.5,+block_height*0.7])
    #render() cube(size=[servo_connector_width*4/3*1.1,knob_spacing*1.1*2/3,servo_connector_spacing]);
    
    translate(v=[knob_spacing*-2.5,knob_spacing*-2.5,+block_height*1.2])
    #render() cube(size=[servo_connector_width*4/3*1.1,knob_spacing*1.1*2/3,servo_connector_spacing]);
}
}

if(render_top){
        block(4,4,1/3,axle_hole=false,reinforcement=true);
}

