nr_of_u = 5;
one_u_height = 44.50;
bar_height = nr_of_u * one_u_height;
bar_width = one_u_height;
bar_depth = one_u_height;
thickness = 5;
height_offset_low = 5.5;
height_offset_high = 37;
m12_diam = 12;
m12_rad = m12_diam / 2;
m6_diam = 6;
m6_rad = m6_diam / 2;
front_hole_offset = one_u_height - 17;

difference()
{
    cube([bar_width, bar_depth, bar_height]);
    translate([thickness, thickness, 0])
    {
       cube([bar_width - thickness, bar_depth - thickness, bar_height]);
    }
    
    for (h = [0 : one_u_height : bar_height])
    {
        // Seperator.
        translate([0, 0, h])
        {
            cube([bar_width, 1, 1]);
        }
        
        // Lower hole.
        translate([front_hole_offset, 0, h + height_offset_low])
        {
            rotate(a = [270, 0, 0])
            {
                cylinder(h = bar_depth, r = m12_rad, center = true, $fn = 50);
            }
        }
        
        // Higher hole.
        translate([front_hole_offset, 0, h + height_offset_high])
        {
            rotate(a = [270, 0, 0])
            {
                cylinder(h = bar_depth, r = m12_rad, center = true, $fn = 50);
            }
        }
        
        // Wall drill-hole.
        translate([0, front_hole_offset, h + (one_u_height / 2)])
        {
            rotate(a = [0, 90, 0])
            {
                cylinder(h = bar_depth, r = m6_rad, center = true, $fn = 50);
            }
        }
    }
}