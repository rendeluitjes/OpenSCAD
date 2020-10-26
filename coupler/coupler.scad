height = 25;
vertical_spacing = 3;
cut_height = (height - vertical_spacing) / 2;
diam = 19;
top_diam = 8;
bottom_diam = 6;
center_x = diam / 2;
center_y = diam / 2;

difference()
{
    // Outside cylinder.
    translate([center_x, center_y, height / 2])
        cylinder(height, diam / 2, diam / 2, center = true);
    // Gap for stepper-motor shaft.
    translate([center_x, center_y, 0])
    {
        difference()
        {
            cylinder(cut_height, bottom_diam / 2, bottom_diam / 2, center = false);
            translate([-3, 2, 0])
                cube([10, 10, cut_height], center = false);
        }
    }
    // Gap for lead-screw.
    translate([center_x, center_y, height - cut_height])
        cylinder(cut_height, top_diam / 2, top_diam / 2, center = false);
}
