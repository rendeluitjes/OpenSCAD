m2_diam = 2 / 2;
m25_diam = 2.5 /2;
m3_diam = 3 / 2;
m3_height = 3;
m2_height = 3;
segments = 50;
pico_pin_dist_x = 48;
pico_pin_dist_y = 11.5;
thickness = 2;
offset_x = 5;
offset_y = 5;
width = offset_x + pico_pin_dist_x + offset_x;
depth = offset_y + pico_pin_dist_y + offset_y;

difference()
{
    union()
    {
        cube([width, depth, thickness]);

        // Standoff left-down.
        translate([offset_x, offset_y, thickness])
        {
            cylinder(h = m3_height, r = m3_diam, $fn=segments);
        }
        translate([offset_x, offset_y, thickness + m3_height])
        {
            cylinder(h = m2_height + m2_height, r = m2_diam, $fn=segments);
        }

        // Standoff right-down.
        translate([offset_x + pico_pin_dist_x, offset_y, thickness])
        {
            cylinder(h = m3_height, r = m3_diam, $fn=segments);
        }
        translate([offset_x + pico_pin_dist_x, offset_y, thickness + m3_height])
        {
            cylinder(h = m2_height + m2_height, r = m2_diam, $fn=segments);
        }

        // Standoff right-top.
        translate([offset_x + pico_pin_dist_x, offset_y + pico_pin_dist_y, thickness])
        {
            cylinder(h = m3_height, r = m3_diam, $fn=segments);
        }
        translate([offset_x + pico_pin_dist_x, offset_y + pico_pin_dist_y, thickness + m3_height])
        {
            cylinder(h = m2_height + m2_height, r = m2_diam, $fn=segments);
        }

        // Standoff right-down.
        translate([offset_x, offset_y + pico_pin_dist_y, thickness])
        {
            cylinder(h = m3_height, r = m3_diam, $fn=segments);
        }
        translate([offset_x, offset_y + pico_pin_dist_y, thickness + m3_height])
        {
            cylinder(h = m2_height + m2_height, r = m2_diam, $fn=segments);
        }
    }
    
    // Hole left-down.
    translate([offset_x, offset_y, 0])
    {
        cylinder(h = m2_height, r = m2_diam, $fn=segments);
        cylinder(h = thickness, r = m25_diam, $fn=segments);
    }
    
    // Hole right-down.
    translate([offset_x + pico_pin_dist_x, offset_y, 0])
    {
        cylinder(h = m2_height, r = m2_diam, $fn=segments);
        cylinder(h = thickness, r = m25_diam, $fn=segments);
    }
    
    // Hole right-top.
    translate([offset_x +pico_pin_dist_x, offset_y + pico_pin_dist_y, 0])
    {
        cylinder(h = m2_height, r = m2_diam, $fn=segments);
        cylinder(h = thickness, r = m25_diam, $fn=segments);
    }
    
    // Hole left-top.
    translate([offset_x, offset_y + pico_pin_dist_y, 0])
    {
        cylinder(h = m2_height, r = m2_diam, $fn=segments);
        cylinder(h = thickness, r = m25_diam, $fn=segments);
    }
}