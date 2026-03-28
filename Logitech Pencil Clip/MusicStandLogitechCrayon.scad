depth = 12;
thickness = 2.1;
stand_rad = 12 / 2;
$fn = 100;
box_space = 9;
pen_width = 13;
pen_depth = 8;
clip_offset = -21.5;

difference()
{
    // Outer circle.
    cylinder(h = depth, r = (stand_rad + thickness));
    // Inner cou-out.
    cylinder(h = depth, r = stand_rad);
    translate([(box_space / 2) - thickness, -(box_space / 2), 0])
    {
        cube([box_space, box_space, depth]);
    }
}

translate([clip_offset, -6, 0])
{
    difference()
    {
        // outer box.
        cube([pen_width + thickness, pen_depth + thickness + thickness, depth]);
        translate([0, thickness, 0])
        {
            // Cut-out.
            cube([pen_width, pen_depth, depth]);
        }
    }
}