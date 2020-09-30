width = 20;
height = 45;
depth = 23.5;
as_diam = 8.5;
as_distance = 9.5;
m3_hole = 3.5;
laser_view_hole_diam = 6;
laser_view_hole_depth = 2.5;
laser_housing_hole_diam = 12.5;
m3_nut_depth = 14.5;
m3_nut_width = 6.2;
m3_nut_height = 3;

include <rounded_cube.scad>


difference()
{

    roundedcube([width, depth, height], false, 1, "all");
    
    //cube(size = [width, depth, height]);
   
    // first hole to put arm-axis in.
    translate([width / 2, 0, as_distance])
        rotate([270, 0, 0])
            cylinder(depth, r = (as_diam / 2), center = false);
    
    // second hole to put arm-axis in.
    translate([width / 2, 0, height - as_distance])
        rotate([270, 0, 0])
            cylinder(depth, r = (as_diam / 2), center = false);

    // screw hole.
    translate([width / 2, depth / 2, height / 2])
        rotate([270, 0, 0])
            cylinder(depth / 2, r = (m3_hole / 2), center = false);

    // laser view hole.
    translate([0, depth / 2, height / 2])
        rotate([0, 90, 0])
            cylinder(h = laser_view_hole_depth, r = laser_view_hole_diam / 2, center = false);

    // laser housing hole.
    translate([laser_view_hole_depth, (depth / 2), height / 2])
        rotate([0, 90, 0])
            cylinder(h = width - laser_view_hole_depth, r = laser_housing_hole_diam / 2, center = false);
            
    // m3 nut gap.
    translate([width, 18.8, (height - m3_nut_width) / 2])
        rotate([0, 270, 0])
            cube([m3_nut_width, m3_nut_height, m3_nut_depth]);
    
}  
