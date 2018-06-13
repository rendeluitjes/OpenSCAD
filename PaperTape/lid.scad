include <dimensions.scad>

// Top-lid.
translate([-(box_width / 2), -(box_depth / 2), 0])
        cube(size = [box_width, 
             box_depth, 
             lid_height]);