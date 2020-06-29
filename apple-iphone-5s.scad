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
            difference(){
                difference(){
                    difference(){
                        body();
                        translate([-30.985, -58.57/2, 0]){
                            rotate([90, 0,  0]){
                                cylinder(r = 4.3/2, h = 0.58*2, center = true, $fn = 300);
                            }
                        }
                    }
                    translate([-30.985 + 10.29, -58.57/2, 0]){
                        rotate([90, 0,  0]){
                            cylinder(r = 4.3/2, h = 0.58*2, center = true, $fn = 300);
                        }
                    }
                }
                ringer_switch_hole();
            }
            sleep_wake_button_hole();
        }
        sim_tray_outline();
    }
    sim_tool_insert();
}

//volume up
module volume_up(){
    translate([-30.985, -58.57/2, 0]){
        rotate([90, 0,  0]){
            cylinder(r = 4.23/2, h = 0.42*2, center = true, $fn = 300);
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

//volume button bevels
translate([0, -0.42, 0]){
    translate([-30.985, -58.57/2, 0]){
        rotate([90, 0,  0]){
            linear_extrude(height = 0.16, scale = [0.924, 0.924]){
                circle(r = 4.23/2, $fn = 300);
            }
        }
    }
    translate([-30.985 + 10.29, -58.57/2, 0]){
        rotate([90, 0,  0]){
            linear_extrude(height = 0.16, scale = [0.924, 0.924]){
                circle(r = 4.23/2, $fn = 300);
            }
        }
    }
}
translate([0, 0.1, 0]){
    volume_up();
    volume_down();
}

//ringer switch
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
translate([-42.055, -58.57/2, -0.46]){
    scale([1.03, 0.53/0.63, 1]){    
        ringer_switch();
    }
}

//ringer switch bevel 
translate([-42.055, -58.57/2 - 0.58, -0.46]){   
    scale([1.03, 1, 1]){
        rotate([90, 0, 0]){
            translate([-(5.4-1.12)/2, 0, 0]){
                linear_extrude(height = 0.1, center = true, convexity = 10, scale=[0.821, 0.821]){
                    circle(r = 1.12/2, $fn = 200);
                }
            }
            translate([(5.4-1.12)/2, 0, 0]){
                linear_extrude(height = 0.1, center = true, convexity = 10, scale=[0.821, 0.821]){
                    circle(r = 1.12/2, $fn = 200);
                }
            }
            linear_extrude(height = 0.1, center = true, convexity = 10, scale=[1, 0.821]){
                translate([0, 0, 0]){   
                    square([5.4-1.12, 1.12], center = true);
                }
            }
        }
    }
}
translate([-42.055, -58.57/2 + 0.15, -0.46]){
    scale([1.03, 1, 1]){    
        ringer_switch();
    }
}

//ringer switch hole
module ringer_switch_alt(){
    translate([-(5.4-1.12)/2, 0, 0]){
        rotate([90, 0, 0]){
            cylinder(r = 1.42/2, h = 0.63*2, $fn = 200, center = true);
        }
    }
    translate([(5.4-1.12)/2, 0, 0]){
        rotate([90, 0, 0]){
            cylinder(r = 1.42/2, h = 0.63*2, $fn = 200, center = true);
        }
    }
    cube([5.4 - (1.12), 0.63*2, 1.42], center = true);
}
module ringer_switch_hole(){
    translate([-42.055, -58.57/2, 0]){
        //#cube([5.4, 5, 1.12], center = true);
        hull(){
            translate([0, 0, 0.4]){
                ringer_switch_alt();
            }
            mirror([0, 0, 1]){
                translate([0, 0, 0.4]){
                    ringer_switch_alt();
                }
            }
        }
    }
}

//sleep/wake button
module sleep_wake_button(height, scale){
    hull(){
        translate([0, 3.65, 0]){
            rotate([0, 90 + 180, 0]) {
                linear_extrude(height = height, center = true, convexity = 10, scale = scale, $fn = 100){
                    circle(r = 2.1/2, $fn = 200);
                }
            }
        }
        mirror([0, 1, 0]){
            translate([0, 3.65, 0]){
                rotate([0, 90 +180, 0]) {
                    linear_extrude(height = height, center = true, convexity = 10, scale = scale, $fn = 100){
                        circle(r = 2.1/2, $fn = 200);
                    }
                }
            }
        }
    }
}
translate([-123.83/2 - 0.48/2, 14.735, 0]){
    sleep_wake_button(0.48, 1);
}
translate([-115.83/2, 14.735, 0]){
    sleep_wake_button(0.48, 1);
}
translate([-123.83/2 - 0.48 - 0.1/2, 14.735, 0]){
    sleep_wake_button(0.1, 1.9/2.1);
}

//sleep/wake button hole
module sleep_wake_button_hole(){
    translate([-123.83/2 - 0.48/2, 14.735, 0]){
        scale([2, 9.5/9.4, 2.2/2.1]){
            sleep_wake_button(0.4, 1);
        }
    }
}

//sim tray
module sim_tray(height, scale, radius){
    hull(){
        translate([(15.57 - 2.3 + (radius - 2.3))/2, 0, 0]){
            rotate([90, 0, 0]) {
                linear_extrude(height = height, center = true, convexity = 10, scale = scale, $fn = 100){
                    circle(r = radius/2, $fn = 200);
                }
            }
        }
        mirror([1, 0, 0]){
            translate([(15.57 - 2.3 + (radius - 2.3))/2, 0, 0]){
                rotate([90, 0, 0]) {
                    linear_extrude(height = height, center = true, convexity = 10, scale = scale, $fn = 100){
                        circle(r = radius/2, $fn = 200);
                    }
                }
            }
        }
    }
}
module sim_tray_outline(){
    translate([0, 58.57/2 - 0.249, 0]){
        difference(){
            sim_tray(0.5, 1, 2.32);
            sim_tray(0.51, 1, 2.28);
        }
    }
}
module sim_tool_insert(){
    translate([(15.57 - 2.3)/2, 58.57/2 - 0.1/2 + 0.01, 0]){
        rotate([90, 0, 0]){
            linear_extrude(height = 0.1 /*2.5*/, center = true, convexity = 10, scale = 0.8823, $fn = 100){
                circle(r = 1.69621/2, $fn = 200);
            }
        }
    }
    translate([(15.57 - 2.3)/2, (58.57/2) - (0.1) - (2.4/2) + 0.1, 0]){
        rotate([90, 0, 0]){
            linear_extrude(height = 2.4 /*2.5*/, center = true, convexity = 10, scale = 1, $fn = 100){
                circle(r = (1.69621 - 0.2)/2, $fn = 200);
            }
        }
    }
}
