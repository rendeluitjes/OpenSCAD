led_rand_diam = 4.5;
led_rand_height = 4;
led_body_diam = 3;
led_body_height = 4;
led_beam_diam = 1.5;
led_beam_height = 2;

slide_depth = 20;
slide_thickness = 5;

nr_of_dots = 9;

box_width = 50;
box_depth = 20;
box_height = 20;

slid_width = nr_of_dots * led_body_diam + 10;
slid_height = 0.4;
slid_depth = box_depth;

module led(x = 0, y = 0, z = 0)
{
    
    translate([x, y, z])
    {
        // Led rand.
        cylinder(h = led_rand_height, r1 = led_rand_diam / 2, r2 = led_rand_diam / 2);
        
    } 
        
    // Led body.
    translate([x, y, z + led_rand_height])
    {
        cylinder(h = led_body_height, r1 = led_body_diam / 2, r2 = led_body_diam / 2);
    }
        
    // lead beam.
    translate([x, y, z + led_rand_height + led_body_height])
    {
        cylinder(h = led_beam_height, r1 = led_beam_diam / 2, r2 = led_beam_diam / 2);
    }

}

// Slide left.
translate([-10, -10, -10])
cube(size = [slid_width + 2 * slide_thickness,
    slide_depth, slid_height + 2 * slide_thickness]);

// Slide right.

difference()
{
    cube(size = [box_width, box_depth, box_height]);
    
    // slit.
    translate([(box_width - slid_width) / 2, 0, (box_height - slid_height) / 2])
    {    
        cube(size = [slid_width, slid_depth, slid_height]);
        
    }
    
    // Row of IR Leds.
    edge = (box_width - slid_width) / 2;
    for (x = [edge + 6: led_body_diam : box_width - edge - 6])
    {
        led(x, box_depth / 2, 0);
        //led_rand_height + led_body_height + led_beam_height);
        
        rotate(a = [180, 0, 0])
            led(x, -(box_depth / 2), -box_height);
        
    }
    
}
