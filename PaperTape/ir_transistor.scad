module ir_transistor(x = 0, y = 0, z = 0)
{
    
    translate([x - (transistor_width / 2), 
               y - (transistor_depth / 2), 
               z])
        cube(size = [transistor_width, transistor_depth,                transistor_box_height]);
    
    translate([x, y, z + transistor_box_height])
        sphere(r = transistor_dome_radius);
    
    translate([x, 
               y - (transistor_depth / 2), 
               z + (transistor_box_height / 2)])
        rotate([90, 0, 0])
            cylinder(h = wire_length, 
                    r1 = wire_radius, 
                    r2 = wire_radius);
                    
    translate([x, y + (transistor_depth / 2), z + (transistor_box_height / 2)])
        rotate([270, 0, 0])
            cylinder(h = wire_length, 
                    r1 = wire_radius, 
                    r2 = wire_radius);
    
} /* End ir_transistor */