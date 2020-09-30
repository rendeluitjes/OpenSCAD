pcb_width = 24.5;
pcb_depth = 25.5;
pcb_height = 1;
pcb_hole_rad = 1.50 / 2;
pcb_hole_edge = 2.5;
peg_left_offset = 10;
peg_distance = 12.5;
cam_block_offset = 6;
cam_block_width = 17.5;
cam_block_depth = 9.5;
cam_block_height = 4;
lens_offset = 11;
lens_rad = 7.5 / 2;
lens_height = 2.5;
led_cutout_offset_x = 19;
led_cutout_offset_y = 3;
led_cutout_offset_z = 1;
led_cutout_width = 3;
led_cutout_depth = 4;
led_cutout_height = 1;

module pi_cam()
{
    difference()
    {
        cube([pcb_width, pcb_depth, pcb_height]);
    
        // PCB-peg left-under.
        translate([peg_left_offset, pcb_hole_edge, 0])
        {
            cylinder(h = pcb_height, r = pcb_hole_rad, center = false, $fn = 100);
        }

        // PCB-peg right-under.        
        translate([peg_left_offset + peg_distance, pcb_hole_edge, 0])
        {
            cylinder(h = pcb_height, r = pcb_hole_rad, center = false, $fn = 100);
        }
            
        // PCB-peg left-top.
        translate([peg_left_offset, pcb_depth - pcb_hole_edge, 0])
        {
            cylinder(h = pcb_height, r = pcb_hole_rad, center = false, $fn = 100);
        }

        // PCB-peg right-top.
        translate([peg_left_offset + peg_distance, pcb_depth - pcb_hole_edge, 0])
        {
            cylinder(h = pcb_height, r = pcb_hole_rad, center = false, $fn = 100);
        }
    }
    

    
    // LED cut-out.
    translate([led_cutout_offset_x, led_cutout_offset_y, pcb_height])
    {
        cube([led_cutout_width, led_cutout_depth, led_cutout_height]);
    }
    
    translate([cam_block_offset, (pcb_depth - cam_block_depth) / 2, pcb_height])
    {
        cube([cam_block_width, cam_block_depth, cam_block_height]);
    }
    
    translate([lens_offset, pcb_depth / 2, pcb_height + cam_block_height])
    {
        cylinder(h = lens_height, r = lens_rad, center = false, $fn = 100);
    }

}