pole_width = 65;
pole_depth = 65;
cap_neck_height = 29;
cap_overlap = 3.5;

cube([pole_width + cap_overlap + cap_overlap,
      pole_depth + cap_overlap + cap_overlap,
      cap_overlap]);

translate([cap_overlap, cap_overlap, cap_overlap])
{
    difference()
    {
        cube([pole_width, pole_depth, cap_neck_height]);
        translate([cap_overlap,
                   cap_overlap,
                   0])
        {
            cube([pole_width - cap_overlap - cap_overlap,
                  pole_depth - cap_overlap - cap_overlap,
                  cap_neck_height]);
        }
    }
}