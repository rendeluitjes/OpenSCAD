axis_rad = 10 / 2;
block_height = 3 + (22 + axis_rad + axis_rad) + 3;
block_thickness = 10;
rod_displacement = 2.5;
block_width = axis_rad + rod_displacement + 5;
total_width = 30;
lip_offset = 15;
lip_thickness = 4;
lip_height = 33;
lip_screw_hole_x = 14;
lip_screw_hole_spacing = 5;
lip_thickness = 7;
m3_rad = 3 / 2;

$fn = 40;

// Main block to fit arround the two threaded rods.
difference()
{
    cube([block_width, block_height, block_thickness]);
    
    // Bottom threaded-rod cutout.
    translate([-rod_displacement + axis_rad, 3 + axis_rad, 0])
    {
        cylinder(h = block_thickness, r = axis_rad);
    }
    
    // Top threaded-rod cutout.
    translate([-rod_displacement + axis_rad, block_height - 3 - axis_rad, 0])
    {
        cylinder(h = block_thickness, r = axis_rad);
    }
}

// Belt attachment lid.
translate([block_width, (block_height - lip_thickness) / 2, 0])
{
    difference()
    {
        cube([total_width - block_width, lip_thickness, block_thickness]);
        
        // Hole for screwing chain to, #1.
        translate([6, 0, block_thickness / 2])
        {
            rotate(a = [-90, 0, 0])
            {
                cylinder(h = block_thickness, r = m3_rad);
            }
        }

        // Hole for screwing chain to, #2.
        translate([12, 0, block_thickness / 2])
        {
            rotate(a = [-90, 0, 0])
            {
                cylinder(h = block_thickness, r = m3_rad);
            }
        }
    }
}