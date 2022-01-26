leonardo_width = 70;
leonardo_depth = 59;
leonardo_height = 15;
m3_diag = 3 / 2;
nr_of_leonardos = 4;
spacing = 2;
segments = 20;
total_width = spacing + leonardo_width;
total_depth = spacing + leonardo_depth + spacing;
total_height = spacing + (nr_of_leonardos * (leonardo_height + spacing));

difference()
{
    cube([total_width, total_depth, total_height]);
    
    for (p = [0:nr_of_leonardos-1])
    {
        translate([spacing, spacing, spacing + (p * (spacing + leonardo_height))])
        {
            cube([leonardo_width, leonardo_depth, leonardo_height]);
        }
    }
    
    // Vertical vent holes.
    translate([spacing+spacing, spacing+spacing, 0])
    {
        cylinder(h = total_height, r = m3_diag, $fn=segments);
    }
    translate([total_width / 2, spacing+spacing, 0])
    {
        cylinder(h = total_height, r = m3_diag, $fn=segments);
    }
    translate([total_width - spacing - spacing, spacing + spacing, 0])
    {
        cylinder(h = total_height, r = m3_diag, $fn=segments);
    }
    
    translate([spacing + spacing, total_depth - spacing - spacing, 0])
    {
        cylinder(h = total_height, r = m3_diag, $fn=segments);
    }
    translate([total_width / 2, total_depth - spacing - spacing, 0])
    {
        cylinder(h = total_height, r = m3_diag, $fn=segments);
    }
    translate([total_width - spacing - spacing, total_depth - spacing - spacing, 0])
    {
        cylinder(h = total_height, r = m3_diag, $fn=segments);
    }
    
    translate([spacing+spacing, total_depth / 2, 0])
    {
        cylinder(h = total_height, r = m3_diag, $fn=segments);
    }
    translate([total_width / 2, total_depth / 2, 0])
    {
        cylinder(h = total_height, r = m3_diag, $fn=segments);
    }
    translate([total_width - spacing - spacing, total_depth / 2, 0])
    {
        cylinder(h = total_height, r = m3_diag, $fn=segments);
    }


}