total_width = 50;
total_depth = 50;
total_height = 50;
camera_width = 26;
camera_depth = 25;
camera_height = 5;
lens_offset_x = 9;
lens_offset_y = 10;
lens_height = 6;
lens_rad = (7 / 2);
paper_width = 26;
paper_height = 1;

include <pi_cam.scad>;

difference()
{
    cube(size = [total_width, total_depth, total_height], center = false);
    
    // Pi Camera PCB cut-out.
    spacing_x = (total_width - camera_width) / 2;
    spacing_y = (total_depth - camera_depth) / 2;
    spacing_z = (total_height - camera_height); // Not centered.
    
    // Pi Camera cut-out.
    translate([39, 12, total_height])
    {
        rotate([0, -180, 0])
        {
            pi_cam();
        }
    }
    
    // Paper-slit.
    spacing_y = (total_width - paper_width) / 2;
    translate([0, spacing_y, 5])
        cube([total_width, paper_width, paper_height]);
    
    // Light-lock.
    translate([total_width / 2, total_height / 2, 0])
        cylinder(h = total_height - lens_height + 2, r1 = (paper_width / 2) + 5, r2 = lens_rad, center = false, $fn=100);
    
    // Paper-tape slit, left.
    guiding_offset = 10.5;
    translate([0, spacing_y + guiding_offset, 0])
        cube([paper_height, paper_height, 10]);
    
    // Paper-tape slit, right.
    guiding_offset = 10.5;
    translate([total_width - paper_height, spacing_y + guiding_offset, 0])
        cube([paper_height, paper_height, 10]);
    
}

    