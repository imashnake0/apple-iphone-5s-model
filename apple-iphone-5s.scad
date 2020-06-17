module body(){
    translate([9.15 - (123.83/2), 9.15 - (58.57/2), 0]){
        scale([1, 1, 0.5]){
            minkowski(){
                cube([123.83 - 9.15*2, 58.57 - 9.15*2, 7.6], true);
                //assuming r = 9.15
                translate([123.83/2 - 9.15, 58.57/2 - 9.15, 0]){
                 cylinder(r = 9.15, h = 7.6, center = true, $fn = 500);
                }
            }
        }
    }
}
body();