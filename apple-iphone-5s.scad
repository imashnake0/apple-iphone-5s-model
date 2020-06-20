module body_crosssection(){
    translate([9.15 - (123.83/2), 9.15 - (58.57/2), 0]){    
        minkowski(){
            square([123.83 - 9.15*2, 58.57 - 9.15*2], true);
            //assuming r = 9.15
            translate([123.83/2 - 9.15, 58.57/2 - 9.15, 0]){
              circle(r = 9.15, $fn = 500);
            }
        }
    }
}
module body(){
    translate([0, 0, -5.8438/2]){
        linear_extrude(height = 5.8438){
            body_crosssection();
        }
    }
    translate([0, 0, 5.8438/2]){
        linear_extrude(height = 0.6431, scale = [0.989613179359, 0.978039952194]){
            body_crosssection();
        }
    }
    mirror([0, 0, 1]){
        translate([0, 0, 5.8438/2]){
            linear_extrude(height = 0.6431, scale = [0.989613179359, 0.978039952194]){
                body_crosssection();
            }
        }
    }
}

//body
difference(){
    difference(){
        difference(){
            body();
            translate([-30.985, -58.57/2, 0]){
                rotate([90, 0,  0]){
                    scale([4.35/4.3, 4.35/4.3, 1]){
                        cylinder(r = 4.3/2, h = 0.58*2, center = true, $fn = 300);
                    }
                }
            }
        }
        translate([-30.985 + 10.29, -58.57/2, 0]){
            rotate([90, 0,  0]){
                scale([4.35/4.3, 4.35/4.3, 1]){
                    cylinder(r = 4.3/2, h = 0.58*2, center = true, $fn = 300);
                }
            }
        }
    }
    //translate([-42.055, -58.57/2, 0]){
        //ringerswitchhole();
    //}
}

//volume up
module volume_up(){
    translate([-30.985, -58.57/2, 0]){
        rotate([90, 0,  0]){
            cylinder(r = 4.3/2, h = 0.58*2, center = true, $fn = 300);
        }
    }
}
volume_up();

//volume down
module volume_down(){
    translate([10.29, 0, 0]){
        volume_up();
    }
}
volume_down();

module ringer_switch(){
translate([-(5.4-1.12)/2, 0, 0]){
    rotate([90, 0, 0]){
        cylinder(r = 1.12/2, h = 0.63*2, $fn = 200, center = true);
    }
}
translate([(5.4-1.12)/2, 0, 0]){
    rotate([90, 0, 0]){
        cylinder(r = 1.12/2, h = 0.63*2, $fn = 200, center = true);
    }
}
cube([5.4 - (1.12), 0.63*2, 1.12], center = true);
}

translate([-42.055, -58.57/2, -0.41]){
    ringer_switch();
}

//DO SOMETHING

translate([0, 0, 0.518888]){
    scale([1, 1.3, 1]){
        ringer_switch();
    }
}