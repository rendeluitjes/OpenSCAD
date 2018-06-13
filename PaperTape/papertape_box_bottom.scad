include <dimensions.scad>
include <led.scad>
include <ir_transistor.scad>

// Bottom part of the device.
rotate(a=[0,180,0])
translate([0, 0, -box_height])
difference()
{
    
    // Outside box.
    translate([box_left, 
               box_front, 
               0])
        cube(size = [box_width, 
             box_depth, 
             box_height]);
     
    // Hollow out box.
    translate([box_left + ridge_width,
              box_front + ridge_width, 
              0])
        cube(size = [box_width - 2* ridge_width, 
              box_depth - 2 * ridge_width,
              box_height - ridge_width]);

    // Put IR Transistors.
    for (x = [ -(slid_width / 2) + 1: 3 : (slid_width / 2) - 1])
    {
        ir_transistor(x, 
                0, 
                box_height - transistor_box_height);
        
    }
    
    // Leave holes for top-part pegs.
    translate([box_left + corner + corner,
            box_front + corner + corner,
            box_height - corner])
        cylinder(h = peg_height, 
            r1 = corner, 
            r2 = corner);

    translate([box_right - corner - corner,
            box_front + corner + corner,
            box_height - corner])
        cylinder(h = peg_height, 
            r1 = corner, 
            r2 = corner);

    translate([box_left + corner + corner,
            box_back - corner - corner,
            box_height- corner])
        cylinder(h = peg_height, 
            r1 = corner, 
            r2 = corner);

    translate([box_right - corner - corner,
            box_back - corner - corner,
            box_height - corner])
        cylinder(h = peg_height, 
            r1 = corner, 
            r2 = corner);
            
}



