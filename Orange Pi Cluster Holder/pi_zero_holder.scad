thickness = 1.6;

bus_left_height = 20;
bus_right_height = 10;
pcb_thickness = 1.6;
pcb_hole_height = 50;
pcb_hole_y = 40;
pcb_spacing_y = 42;
pcb_spacing_z = 40;
depth = 100;
pi_zeros = 3;
m3_rad = 1.5;

total_width = (pi_zeros * ( bus_left_height + pcb_thickness)) + bus_right_height;
total_depth = 110;
total_height = 100;

translate([0,0,0])
{
    difference()
    {
        cube([total_width + pcb_thickness + pcb_thickness, total_depth, total_height]);
        translate([pcb_thickness, 0, pcb_thickness])
            cube([total_width, total_depth, total_height]);
        translate([0, pcb_hole_y, pcb_hole_height])
            rotate([0, 90, 0])
                cylinder(h = total_width + pcb_thickness + pcb_thickness, 
                    r1 = m3_rad,r2 = m3_rad);
        translate([0, pcb_hole_y + pcb_spacing_y, pcb_hole_height])
            rotate([0, 90, 0])
                cylinder(h = total_width + pcb_thickness + pcb_thickness, 
                    r1 = m3_rad,r2 = m3_rad);
        
        translate([0, pcb_hole_y, pcb_hole_height + pcb_spacing_z])
            rotate([0, 90, 0])
                cylinder(h = total_width + pcb_thickness + pcb_thickness, 
                    r1 = m3_rad,r2 = m3_rad);
        translate([0, pcb_hole_y + pcb_spacing_y, pcb_hole_height + pcb_spacing_z])
            rotate([0, 90, 0])
                cylinder(h = total_width + pcb_thickness + pcb_thickness, 
                    r1 = m3_rad,r2 = m3_rad);
        
    }
}