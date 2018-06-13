include <dimensions.scad>
include <led.scad>
include <ir_transistor.scad>

// Top part of the device.
difference()
{
    
    // Outside box.
    translate([box_left, 
               box_front, 
               0])
        cube(size = [box_width, 
             box_depth, 
             box_height]);
     
    // Cut tape-track out, front.
    translate([-(slid_width / 2),
               box_front,
               box_height - slid_height])
        cube(size = [slid_width,
                    box_depth,
                    slid_height]);
    
    // Hollow out box.
    translate([box_left + ridge_width,
              box_front + ridge_width, 
              0])
        cube(size = [box_width - 2*                 ridge_width, 
                    box_depth - 2 * ridge_width,                box_height - ridge_width]);
    
    for (x = [ -(slid_width / 2) + 1: 3 : (slid_width / 2) - 1])
    {
        led(x, 
            0, 
        box_height - slid_height - led_box_height - led_cyl_height);
    }
    
};

    // Peg's on all corners.
    translate([box_left + corner + corner,
            box_front + corner + corner,
            box_height])
        cylinder(h = peg_height, 
                r1 = corner, 
                r2 =  corner);

    translate([box_right - corner - corner,
            box_front + corner + corner,
            box_height])
        cylinder(h = peg_height, 
                r1 = corner, 
                r2 = corner);

    translate([box_left + corner + corner,
            box_back - corner - corner,
            box_height])
        cylinder(h = peg_height, 
                r1 = corner, 
                r2 = corner);

    translate([box_right - corner - corner,
            box_back - corner - corner,
            box_height])
        cylinder(h = peg_height, 
                r1 = corner, 
                r2 = corner);

