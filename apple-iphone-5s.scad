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
%body();