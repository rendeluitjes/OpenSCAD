avrmega_width = 105;
avrmega_depth = 57;
avrmega_height = 16.5;
m4_diag = 4 / 2;
nr_of_avrmegas = 3;
spacing = 2;
segments = 20;
total_width = spacing + avrmega_width;
total_depth = spacing + avrmega_depth + spacing;
total_height = spacing + (nr_of_avrmegas * (avrmega_height + spacing));

difference()
{
    cube([total_width, total_depth, total_height]);
    
    for (p = [0:nr_of_avrmegas-1])
    {
        translate([spacing, spacing, spacing + (p * (spacing + avrmega_height))])
        {
            cube([avrmega_width, avrmega_depth, avrmega_height]);
        }
    }
    
    // Vertical vent holes.
    translate([spacing+spacing, spacing+spacing, 0])
    {
        cylinder(h = total_height, r = m4_diag, $fn=segments);
    }
    translate([total_width / 2, spacing+spacing, 0])
    {
        cylinder(h = total_height, r = m4_diag, $fn=segments);
    }
    translate([total_width - spacing - spacing, spacing + spacing, 0])
    {
        cylinder(h = total_height, r = m4_diag, $fn=segments);
    }
    
    translate([spacing + spacing, total_depth - spacing - spacing, 0])
    {
        cylinder(h = total_height, r = m4_diag, $fn=segments);
    }
    translate([total_width / 2, total_depth - spacing - spacing, 0])
    {
        cylinder(h = total_height, r = m4_diag, $fn=segments);
    }
    translate([total_width - spacing - spacing, total_depth - spacing - spacing, 0])
    {
        cylinder(h = total_height, r = m4_diag, $fn=segments);
    }
    
    translate([spacing+spacing, total_depth / 2, 0])
    {
        cylinder(h = total_height, r = m4_diag, $fn=segments);
    }
    translate([total_width / 2, total_depth / 2, 0])
    {
        cylinder(h = total_height, r = m4_diag, $fn=segments);
    }
    translate([total_width - spacing - spacing, total_depth / 2, 0])
    {
        cylinder(h = total_height, r = m4_diag, $fn=segments);
    }


}