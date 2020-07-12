module body_cross_section(){
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
            body_cross_section();
        }
    }
    translate([0, 0, 5.8438/2]){
        linear_extrude(height = 0.6431, scale = [0.989613179359, 0.978039952194]){
            body_cross_section();
        }
    }
    mirror([0, 0, 1]){
        translate([0, 0, 5.8438/2]){
            linear_extrude(height = 0.6431, scale = [0.989613179359, 0.978039952194]){
                body_cross_section();
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
            lightning(6.6*2, [1, 1]);
        }
        s_hole_diff();
    }
    audio_jack();
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
            rotate([0, 90 + 180, 0]){
                linear_extrude(height = height, center = true, convexity = 10, scale = scale, $fn = 100){
                    circle(r = 2.1/2, $fn = 200);
                }
            }
        }
        mirror([0, 1, 0]){
            translate([0, 3.65, 0]){
                rotate([0, 90 +180, 0]){
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
                rotate([90, 0, 0]){
                    linear_extrude(height = height, center = true, convexity = 10, scale = scale, $fn = 100){
                        circle(r = radius/2, $fn = 200);
                    }
                }
            }
        }
    }
}

//sim tray gap
module sim_tray_outline(){
    translate([0, 58.57/2 - 0.249, 0]){
        difference(){
            sim_tray(0.5, 1, 2.32);
            sim_tray(0.51, 1, 2.21);
        }
    }
}

//sim tool hole
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

//lightning port
module lightning(h, s){
    hull(){
        translate([123.83/2, (9.05/2) - (3.36/2), 0]){
            rotate([0, 90, 0]) {
                linear_extrude(height = h, center = true, convexity = 10, twist = 0, scale = s) {
                    circle(r = 3.36/2, $fn = 200);    
                }
            }
        }
        mirror([0, 1, 0]){
            translate([123.83/2, (9.05/2) - (3.36/2), 0]){
                rotate([0, 90, 0]){
                    linear_extrude(height = h, center = true, convexity = 10, twist = 0, scale = s) {
                        circle(r = 3.36/2, $fn = 200);
                    }
                }
            }
        }
    }
}

//lightnig port case
module lightning_case(h, s, t){
    difference(){
        hull(){
            translate([123.83/2, (9.05/2) - (3.36/2), 0]){
                rotate([0, 90, 0]){
                    linear_extrude(height = h, center = true, convexity = 10, twist = 0, scale = s) {
                        circle(r = 3.36/2, $fn = 200);    
                    }
                }
            }
            mirror([0, 1, 0]){
                translate([123.83/2, (9.05/2) - (3.36/2), 0]){
                    rotate([0, 90, 0]){
                        linear_extrude(height = h, center = true, convexity = 10, twist = 0, scale = s) {
                            circle(r = 3.36/2, $fn = 200);
                        }
                    }
                }
            }
        }
        hull(){
            translate([123.83/2, 5.7/2, 0]){
                rotate([0, 90, 0]){
                    linear_extrude(height = h + 0.01, center = true, convexity = 10, twist = 0, scale = t) {
                        circle(r = 1.49/2, $fn = 200);    
                    }
                }
            }
            mirror([0, 1, 0]){
                translate([123.83/2, 5.7/2, 0]){
                    rotate([0, 90, 0]){
                        linear_extrude(height = h + 0.01, center = true, convexity = 10, twist = 0, scale = t) {
                            circle(r = 1.49/2, $fn = 200);
                        }
                    }
                }
            }
        }
    }
}
translate([-0.125, 0, 0]){
    lightning_case(0.25, [0.95, 0.95], [1.6, 1.6]);    
}
translate([-3.3 - 0.25, 0, 0]){
    lightning_case(6.6, [1, 1], [1.05, 1.05]);    
}

//speaker + bottom mic
module s_hole(r, h){
    for(i = [8.631:1.55375:19.50725]){
        translate([123.83/2 - 0.05 + 0.001, i, 0.753125]){
            rotate([0, 90, 180]){
                linear_extrude(height = h, center = true, convexity = 10, twist = 0, scale = 0.815455594002) {
                    circle(r = r, $fn = 200);
                }
            }
        }
    }
}

module s_hole_diff(){
    s_hole(0.541875, 0.1);
    mirror([0, 0, 1]) {
        s_hole(0.541875, 0.1);
    }
    s_hole(0.491875, 2.5);
    mirror([0, 0, 1]) {
        s_hole(0.491875, 2.5);
    }
    intersection(){
        rotate([180, 0, 0]) {
            s_hole(0.541875, 0.1);
            mirror([0, 0, 1]) {
                s_hole(0.541875, 0.1);
            }
            s_hole(0.491875, 2.5);
            mirror([0, 0, 1]) {
                s_hole(0.491875, 2.5);
            }
        }
        translate([123.83/2, -11.725, 0]){
            cube([10, 7.5, 3], true);    
        }
    }
}

//audio jack
module audio_jack(){
    translate([123.83/2, -58.7/2 + 10.45, 0]){
        rotate([0, 90, 0]) {
            linear_extrude(height = 14.47*2 + 0.1, center = true, convexity = 10, twist = 0, scale = 1) {
                circle(r = 4.83/2, $fn = 200);
            }
        }
    }
}

//audio jack case
module audio_jack_case(h, s, t){
    difference(){
        translate([123.83/2, -58.7/2 + 10.45, 0]){
            rotate([0, 90, 0]) {
                linear_extrude(height = h, center = true, convexity = 10, twist = 0, scale = s) {
                    circle(r = 4.83/2, $fn = 200);
                }
            }
        }
        translate([123.83/2, -58.7/2 + 10.45, 0]){
            rotate([0, 90, 0]) {
                linear_extrude(height = h + 0.01, center = true, convexity = 10, twist = 0, scale = t) {
                    circle(r = (4.83/2) - 0.63, $fn = 200);
                }
            }
        }
    }
}
translate([-0.1, 0, 0]){
    audio_jack_case(0.2, [0.96, 0.96], [1.16, 1.16]);    
}
translate([-(14.47/2) - 0.2/2, 0, 0]){
    audio_jack_case(14.47 - 0.2, [1, 1], [1.005, 1.005]);    
}

//temp screen
translate([0, 0, 7.13/2 + 0.67]){
    %cube([90.39, 51.7, 0.005], true);
}

//screen
module screen(){
    scale([0.982, 0.961, 1]) {
        translate([0, 0, 7.13/2]) {
            linear_extrude(height = 0.57*2, center = true, convexity = 10, twist = 0) {
                body_cross_section();
            }
        }
    }
    scale([0.978, 0.956, 1]) {
        translate([0, 0, 7.13/2]) {
            linear_extrude(height = 0.67*2, center = true, convexity = 10, twist = 0) {
                body_cross_section();
            }
        }
    }
}
difference(){
    screen();
    home_button();
}

//home button
module home_button(){
    rotate([180, 0, 0]){
        translate([52.765, 0, -4.035]){
            linear_extrude(height = 0.401, center = true, convexity = 10, twist = 0, scale = 10/10.9){
                circle(r = 10.9/2, $fn = 200);
            }
            difference(){
            linear_extrude(height = 0.41, center = true, convexity = 10, twist = 0, scale = 1){
                circle(r = 11.0/2, $fn = 200);
            }
            linear_extrude(height = 0.4, center = true, convexity = 10, twist = 0, scale = 1){
                circle(r = 10.9/2, $fn = 200);
            }
            }
        }    
    }
}