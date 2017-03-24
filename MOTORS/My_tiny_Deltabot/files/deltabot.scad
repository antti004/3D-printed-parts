use <by28stepper.scad>

module by28_mount() {
    difference() {
        hull(){
            cylinder(r=25,h=5,center=true);
            translate([0,-10,0])cube([50,30,5],center=true);
        }
    by28_holemask();
    }
    
    translate([0,-25,-17.5])difference() {
        cube([50,6,40],center=true);
        rotate([90,0,0])translate([-18,0,0])hull() {
            translate([0,-5,0])cylinder(r=3,h=7,center=true);
            translate([0, 5,0])cylinder(r=3,h=7,center=true);
        }

        rotate([90,0,0])translate([18,0,0])hull() {
            translate([0,-5,0])cylinder(r=3,h=7,center=true);
            translate([0, 5,0])cylinder(r=3,h=7,center=true);
        }

        rotate([90,0,0])translate([0,-13,0])cylinder(r=3,h=7,center=true);


    }
}

module hook() {
    $fn=20;
    rotate([0,-90,0]) {
        difference() {
            union() {
                cylinder(r=6,h=5,center=true);
                translate([-3.5,-10])cube([5,20,5],center=true);
            }
            cylinder(r=3,h=6,center=true);
        }
    }
    
}
module __gelenk() {
    $fn=20;
    
        translate([0,-20,-3.5])difference() {
            hull() {
                translate([15,0,0])cylinder(r=6,h=5,center=true);
                translate([-15,0,0])cylinder(r=6,h=5,center=true);
            }

                translate([15,0,0])cylinder(r=3,h=6,center=true);
                translate([-15,0,0])cylinder(r=3,h=6,center=true);
        }

        
        translate([-5.5,0,0])hook();
        translate([ 5.5,0,0])hook();

}


module gelenk() {
    $fn=20;
    translate([0,0,-4.5])difference() {
        hull() {
            translate([17,0,0])cylinder(r=12,h=2.5,center=true);
            translate([-17,0,0])cylinder(r=12,h=2.5,center=true);
            cylinder(r=18,h=2.5,center=true);
        }

            translate([0,0,0])cube([6,24,6],center=true);
            translate([22,0,0])cylinder(r=3,h=6,center=true);
            translate([-22,0,0])cylinder(r=3,h=6,center=true);
    }

    translate([0,0,-2])difference() {
        hull() {
            translate([5,0,0])cylinder(r=8,h=3.5,center=true);
            translate([-5,0,0])cylinder(r=8,h=3.5,center=true);
            scale([0.5,1,1])cylinder(r=18,h=3.5,center=true);
        }
            cube([6,24,6],center=true);
            translate([0,0,2.5])rotate([0,90,0]) cylinder(r=3,h=22,center=true);

    }
                    
}

module aktuatorgelenk() {
    $fn=20;
    difference() {
        union() {
            translate([0,0,-4.5])difference() {
                hull() {
                    translate([17,0,0])cylinder(r=12,h=2.5,center=true);
                    translate([-17,0,0])cylinder(r=12,h=2.5,center=true);
                    cylinder(r=18,h=2.5,center=true);
                }

                    translate([0,3,0])cube([6,24,6],center=true);
                    translate([22,0,0])cylinder(r=3,h=6,center=true);
                    translate([-22,0,0])cylinder(r=3,h=6,center=true);
            }

            translate([0,0,-2])difference() {
                hull() {
                    translate([6,6,0])cylinder(r=8,h=3.5,center=true);
                    translate([-6,6,0])cylinder(r=8,h=3.5,center=true);
                    translate([0,-10,0])cylinder(r=8,h=3.5,center=true);
                }
                    translate([0,3,0])cube([6,24,6],center=true);
                    translate([0,0,2.5])rotate([0,90,0]) cylinder(r=3,h=22,center=true);

            }
            
        }
        
        translate([0,18,0])cube([40,10,12],center=true);
    }
    
}
module oberarm() {
    $fn=20;
    difference() {
        hull() {
            cylinder(r=6,h=5,center=true);
            translate([120,0,0])cylinder(r=6,h=5,center=true);
        }

        translate([120,0,0])cylinder(r=3,h=6,center=true);
        
    }
    cylinder(r=12,h=5,center=true);
    
    translate([0,0,2]) difference() {
        cylinder(r=6,h=12);
        translate([0,0,13]) {
            rotate([180,0,0])by28_axis(s=0.6);
        }
        translate([0,0,6]) {
            rotate([0,90,0])cylinder(r=2,h=20,center=true);
        }
    }
    
    cube([3,35,5],center=true);
}

module unterarm() {
    difference() {
        hull() {
            cylinder(r=6,h=5,center=true);
            translate([120,0,0])cylinder(r=6,h=5,center=true);
        }

        translate([120,0,0])cylinder(r=3,h=6,center=true);
        translate([0,0,0])cylinder(r=3,h=6,center=true);
        
    }
}


module arm(u=72,o=21,e=0, h=30) {
    rotate([0,u,0]) {
        rotate([90,0,0])oberarm();
        translate([117,0,0]) rotate([0,45+o,0]) {
            translate([-0,0,1]){
                    rotate([0,0,90])gelenk();
                    rotate([180,0,90])gelenk();
            }
            translate([00, 0,2]) {
                translate([0,-22,-1.5]) rotate([0,0,e])unterarm();
                translate([0, 22,-1.5]) rotate([0,0,e])unterarm();
                
                 rotate([0,0,e])translate([120,0,-1]) rotate([180,0, 90-e]) {
                    translate([0,s0,0]){
                            aktuatorgelenk();
                            rotate([180,0,180])aktuatorgelenk();
                    }
                }
            }
            
                

        }
    }
    
}

module actor() {
    difference() {
        cylinder(r=30,h=5,center=true);
        cylinder(r=8,h=6,center=true);
        for (i = [0:2]) {
            rotate([0,0,120*i]) {
                   translate([12,5,0])cylinder(r=3,h=6,center=true);
                   translate([12,-5,0])cylinder(r=3,h=6,center=true);
                   translate([22,5,0])cylinder(r=3,h=6,center=true);
                   translate([22,-5,0])cylinder(r=3,h=6,center=true);
                
            }
        }
    }

    for (i = [0:2]) {
        rotate([0,180,90+120*i]) {
            translate([0,43,3.5])hook();
        }
    }

}

module complete_robot() {
    for (i = [0:2]) {
        rotate([0,0,120*i]) {
            translate([100,0,0])arm();
            translate([100,-20,8])rotate([-90,0,0]) {
                   by28_mount();
                   translate([0,0,-3])#by28();

            }
            
        }
    }
    translate([0,0,-200])rotate([0,180,0])actor();
}


complete_robot();


//gelenk(); // 6 mal
//aktuatorgelenk(); // 6 mal
//oberarm(); // 3 mal
//unterarm(); // 6 mal
//rotate([180,0,0])by28_mount(); // 3 mal
//rotate([180,0,0])actor(); // 1 mal


