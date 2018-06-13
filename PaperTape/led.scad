module led(x = 0, y = 0, z = 0)
{

    // Led box.
    translate([x, y - (led_depth / 2), z]) 
        cube(size = [led_width, 
            led_depth, 
            led_cyl_height]);
    
    // Led cylinder.
    translate([x + (led_width / 2), 
            y, 
            z + led_cyl_height])
        cylinder(h = led_cyl_height, 
            r1 = led_radius, 
            r2 = led_radius);
    
    // Led Anode.
    translate([x + (led_width / 2), 
            y - (led_depth / 4), 
            z  - anode_length])
        cylinder(h = anode_length, r1 = wire_radius, r2 = wire_radius, center = false);
    
    // Led Cathode.
    translate([x + (led_width / 2), 
            y + (led_depth / 4), 
            z + -cathode_length])
        cylinder(h = cathode_length, r1 = wire_radius, r2 = wire_radius, center = false);
    
} /* End led */