// edited 5/7/13 10:07 PM

include <configuration.scad>

module block(width,length,height,axle_hole,reinforcement) {
	overall_length=(length-1)*knob_spacing+knob_diameter+wall_thickness*2;
	overall_width=(width-1)*knob_spacing+knob_diameter+wall_thickness*2;
	start=(knob_diameter/2+knob_spacing/2+wall_thickness);
	translate([-overall_length/2,-overall_width/2,0])
		union() {
			difference() {
				union() {
					cube([overall_length,overall_width,height*block_height]);
					translate([knob_diameter/2+wall_thickness,knob_diameter/2+wall_thickness,0]) 
						for (ycount=[0:width-1])
							for (xcount=[0:length-1]) {
								translate([xcount*knob_spacing,ycount*knob_spacing,0])
									cylinder(r=knob_diameter/2,h=block_height*height+knob_height,$fs=cylinder_precision);
						}
				}
				translate([wall_thickness,wall_thickness,-roof_thickness]) cube([overall_length-wall_thickness*2,overall_width-wall_thickness*2,block_height*height]);
				if (axle_hole==true)
					if (width>1 && length>1) for (ycount=[1:width-1])
						for (xcount=[1:length-1])
							translate([(xcount-1)*knob_spacing+start,(ycount-1)*knob_spacing+start,-block_height/2])  axle(height+1);
			}
	
			if (reinforcement==true && width>1 && length>1)
				difference() {
					for (ycount=[1:width-1])
						for (xcount=[1:length-1])
							translate([(xcount-1)*knob_spacing+start,(ycount-1)*knob_spacing+start,0]) reinforcement(height);
					for (ycount=[1:width-1])
						for (xcount=[1:length-1])
							translate([(xcount-1)*knob_spacing+start,(ycount-1)*knob_spacing+start,-0.5]) cylinder(r=post_diameter/2-0.1, h=height*block_height+0.5, $fs=cylinder_precision);
				}
	
			if (width>1 && length>1) for (ycount=[1:width-1])
				for (xcount=[1:length-1])
					translate([(xcount-1)*knob_spacing+start,(ycount-1)*knob_spacing+start,0]) post(height,axle_hole);
	
			if (width==1 && length!=1)
				for (xcount=[1:length-1])
					translate([(xcount-1)*knob_spacing+start,overall_width/2,0]) cylinder(r=pin_diameter/2,h=block_height*height,$fs=cylinder_precision);
	
			if (length==1 && width!=1)
				for (ycount=[1:width-1])
					translate([overall_length/2,(ycount-1)*knob_spacing+start,0]) cylinder(r=pin_diameter/2,h=block_height*height,$fs=cylinder_precision);
		}
}

module post(height,axle_hole=false) {
	difference() {
		cylinder(r=post_diameter/2, h=height*block_height,$fs=cylinder_precision);
		if (axle_hole==true) {
			translate([0,0,-block_height/2])
				axle(height+1);
		} else {
			translate([0,0,-0.5])
				cylinder(r=knob_diameter/2, h=height*block_height+1,$fs=cylinder_precision);
		}
	}
}

module reinforcement(height) {
	union() {
		translate([0,0,height*block_height/2]) union() {
			cube([reinforcing_width,knob_spacing+knob_diameter+wall_thickness/2,height*block_height],center=true);
			rotate(v=[0,0,1],a=90) cube([reinforcing_width,knob_spacing+knob_diameter+wall_thickness/2,height*block_height], center=true);
		}
	}
}

module axle(height) {
	translate([0,0,height*block_height/2]) union() {
		cube([axle_diameter,axle_spline_width,height*block_height],center=true);
		cube([axle_spline_width,axle_diameter,height*block_height],center=true);
	}
}




module block_hole(width,length,height,axle_hole,reinforcement) {
	overall_length=(length-1)*knob_spacing+knob_diameter+wall_thickness*2;
	overall_width=(width-1)*knob_spacing+knob_diameter+wall_thickness*2;
	start=(knob_diameter/2+knob_spacing/2+wall_thickness);
	translate([-overall_length/2,-overall_width/2,0])
	difference(){
		union() {
			difference() {
				union() {
					cube([overall_length,overall_width,height*block_height]);
					translate([knob_diameter/2+wall_thickness,knob_diameter/2+wall_thickness,0]) 
						for (xcount=[0:length-1]) {
								translate([xcount*knob_spacing,0,0])
									cylinder(r=knob_diameter/2,h=block_height*height+knob_height,$fs=cylinder_precision);
						}
						translate([knob_spacing/2,knob_spacing/2,0])
						for (xcount=[0:length-1]) {
								translate([xcount*knob_spacing,(width-1)*knob_spacing,0])
									cylinder(r=knob_diameter/2,h=block_height*height+knob_height,$fs=cylinder_precision);
						}
translate([knob_spacing/2,knob_spacing/2,0])
						for (ycount=[0:width-1]){
								translate([0,ycount*knob_spacing,0])
									cylinder(r=knob_diameter/2,h=block_height*height+knob_height,$fs=cylinder_precision);
						}
						translate([knob_spacing/2,knob_spacing/2,0])
						for (ycount=[0:width-1]){
								translate([(length-1)*knob_spacing,ycount*knob_spacing,0])
									cylinder(r=knob_diameter/2,h=block_height*height+knob_height,$fs=cylinder_precision);
						}
				}
				translate([wall_thickness,wall_thickness,-roof_thickness]) cube([overall_length-wall_thickness*2,overall_width-wall_thickness*2,block_height*0.5]);
				if (axle_hole==true)
					if (width>1 && length>1) for (ycount=[1:width-1])
						for (xcount=[1:length-1])
							translate([(xcount-1)*knob_spacing+start,(ycount-1)*knob_spacing+start,-block_height/2])  axle(height+1);
			}
	
			if (reinforcement==true && width>1 && length>1)
				difference() {
					for (ycount=[1:width-1])
						for (xcount=[1:length-1])
							translate([(xcount-1)*knob_spacing+start,(ycount-1)*knob_spacing+start,0]) reinforcement(height);
					for (ycount=[1:width-1])
						for (xcount=[1:length-1])
							translate([(xcount-1)*knob_spacing+start,(ycount-1)*knob_spacing+start,-0.5]) cylinder(r=post_diameter/2-0.1, h=height*block_height+0.5, $fs=cylinder_precision);
				}
	
			if (width>1 && length>1) for (ycount=[1:width-1])
				for (xcount=[1:length-1])
					translate([(xcount-1)*knob_spacing+start,(ycount-1)*knob_spacing+start,0]) post(height,axle_hole);
	
			if (width==1 && length!=1)
				for (xcount=[1:length-1])
					translate([(xcount-1)*knob_spacing+start,overall_width/2,0]) cylinder(r=pin_diameter/2,h=block_height*0.5,$fs=cylinder_precision);
	
			if (length==1 && width!=1)
				for (ycount=[1:width-1])
					translate([overall_length/2,(ycount-1)*knob_spacing+start,0]) cylinder(r=pin_diameter/2,h=block_height*0.5,$fs=cylinder_precision);
		}
translate(v=[knob_spacing,knob_spacing,block_height/2]) cube(size=[knob_spacing*(length-2),knob_spacing*(width-2),block_height*(height-0.5)]);
	}
}

module block_no_knobs(width,length,height,axle_hole,reinforcement) {
	overall_length=(length-1)*knob_spacing+knob_diameter+wall_thickness*2;
	overall_width=(width-1)*knob_spacing+knob_diameter+wall_thickness*2;
	start=(knob_diameter/2+knob_spacing/2+wall_thickness);
	translate([-overall_length/2,-overall_width/2,0])
		union() {
			difference() {
				union() {
					cube([overall_length,overall_width,height*block_height]);
					/*translate([knob_diameter/2+wall_thickness,knob_diameter/2+wall_thickness,0]) 
						for (ycount=[0:width-1])
							for (xcount=[0:length-1]) {
								translate([xcount*knob_spacing,ycount*knob_spacing,0])
									cylinder(r=knob_diameter/2,h=block_height*height+knob_height,$fs=cylinder_precision);
						}*/
				}
				translate([wall_thickness,wall_thickness,-roof_thickness]) cube([overall_length-wall_thickness*2,overall_width-wall_thickness*2,block_height*height]);
				if (axle_hole==true)
					if (width>1 && length>1) for (ycount=[1:width-1])
						for (xcount=[1:length-1])
							translate([(xcount-1)*knob_spacing+start,(ycount-1)*knob_spacing+start,-block_height/2])  axle(height+1);
			}
	
			if (reinforcement==true && width>1 && length>1)
				difference() {
					for (ycount=[1:width-1])
						for (xcount=[1:length-1])
							translate([(xcount-1)*knob_spacing+start,(ycount-1)*knob_spacing+start,0]) reinforcement(height);
					for (ycount=[1:width-1])
						for (xcount=[1:length-1])
							translate([(xcount-1)*knob_spacing+start,(ycount-1)*knob_spacing+start,-0.5]) cylinder(r=post_diameter/2-0.1, h=height*block_height+0.5, $fs=cylinder_precision);
				}
	
			if (width>1 && length>1) for (ycount=[1:width-1])
				for (xcount=[1:length-1])
					translate([(xcount-1)*knob_spacing+start,(ycount-1)*knob_spacing+start,0]) post(height,axle_hole);
	
			if (width==1 && length!=1)
				for (xcount=[1:length-1])
					translate([(xcount-1)*knob_spacing+start,overall_width/2,0]) cylinder(r=pin_diameter/2,h=block_height*height,$fs=cylinder_precision);
	
			if (length==1 && width!=1)
				for (ycount=[1:width-1])
					translate([overall_length/2,(ycount-1)*knob_spacing+start,0]) cylinder(r=pin_diameter/2,h=block_height*height,$fs=cylinder_precision);
		}
}
