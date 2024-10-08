led_beam_diam = 2;
led_beam_height = 6;
led_body_diam = 3.5;
led_body_height = 3.5;
led_rand_diam = 5;
led_rand_height = 2;

led_spacing = 2.54;

nr_of_dots = 9;

box_width = 50;
box_depth = 15;
box_height = 20;

slide_width = 26;
slide_height = 0.8;
slide_depth = 10;
slide_thickness = 2;

slide_x = (box_width - slide_width - slide_thickness) / 2;
slide_z = (box_height - slide_height - 2 * slide_thickness) / 2;
slide_outer_width = slide_width + 2 * slide_thickness;

module led(x = 0, y = 0, z = 0)
{
    
    translate([x, y, z])
    {
        // Led rand.
        cylinder(h = led_rand_height, r1 = led_rand_diam / 2, r2 = led_rand_diam / 2, $fn = 50);
        
    } 
        
    // Led body.
    translate([x, y, z + led_rand_height])
    {
        cylinder(h = led_body_height, r1 = led_body_diam / 2, r2 = led_body_diam / 2, $fn = 50);
    }
        
    // lead beam.
    translate([x, y, z + led_rand_height + led_body_height])
    {
        cylinder(h = led_beam_height, r1 = led_beam_diam / 2, r2 = led_beam_diam / 2, $fn = 50);
    }

}

difference()
{
    union()
    { 
        // Main box.
        cube(size = [box_width, box_depth, box_height]);
        
        // Slide left.
        translate([0, -slide_depth, slide_z])
            cube(size = [box_width,
                slide_depth, 
                slide_height + 2 * slide_thickness]);

        // Slide right.
        translate([0, box_depth, slide_z])
            cube(size = [box_width,
                slide_depth, 
                slide_height + 2 * slide_thickness]);
                
    }
    
    slide_x = (box_width - slide_width) / 2;

    // slide opening.
    translate([slide_x,
            -slide_depth, 
            (box_height - slide_height) / 2])
        cube(size = [slide_width, 
            slide_depth + slide_depth + box_depth, slide_height]);
    
    // Row of IR Leds.
    for (x = [slide_x + led_spacing : 2.54 : box_width - slide_x -      led_spacing])
    {
        led(x, box_depth / 2, 0);
        //led_rand_height + led_body_height + led_beam_height);
        
        rotate(a = [180, 0, 0])
            led(x, -(box_depth / 2), -box_height);
        
    }
    
    // Groove for permament dotted line.
    grove_depth = 0.4;
    grove_x = 22.6;
    slide_top = slide_z + slide_thickness + slide_height + slide_thickness;
    slide_bottom = slide_z;
    translate([grove_x, -slide_depth, slide_top - grove_depth])
        cube(size = [grove_depth, slide_depth, grove_depth]);
    translate([grove_x, box_depth, slide_top - grove_depth])
        cube(size = [grove_depth, slide_depth, grove_depth]);

    translate([grove_x, -slide_depth, slide_z + grove_depth])
        cube(size = [grove_depth, slide_depth, grove_depth]);
    translate([grove_x, box_depth, slide_z + grove_depth])
        cube(size = [grove_depth, slide_depth, grove_depth]);

    
}
