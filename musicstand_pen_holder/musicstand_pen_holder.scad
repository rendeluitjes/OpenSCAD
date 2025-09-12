height = 14;
depth = 25;
width = 27;
cut_offset_x = 10;
cut_offset_y = 14;
slith_offset_x = 4;
slith_offset_y = 6;
slith_thickness = 0.7;
slith_depth = 25;
pen_offset_x = 20;
pen_offset_y = 7;
pen_rad = 11 / 2;

difference()
{
    cube([width, depth, height]);
    
    translate([cut_offset_x, cut_offset_y, 0])
    {
        cube([width, depth, height]);
    }
    
    translate([slith_offset_x, slith_offset_y, 0])
    {
        cube([slith_thickness, slith_depth, height]);
    }
    
    translate([pen_offset_x, pen_offset_y, 0])
    {
        cylinder(h = height, r = pen_rad, $fn = 100);
    }

}

