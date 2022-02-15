avrnano_width = 44;
avrnano_depth = 18.6;
avrnano_height = 20;
m3_diag = 3 / 2;
nr_of_avrnanos = 4;
spacing = 2;
segments = 20;
total_width = spacing + avrnano_width;
total_depth = spacing + avrnano_depth + spacing;
total_height = spacing + (nr_of_avrnanos * (avrnano_height + spacing));

difference()
{
    cube([total_width, total_depth, total_height]);
    
    for (p = [0:nr_of_avrnanos-1])
    {
        translate([spacing, spacing, spacing + (p * (spacing + avrnano_height))])
        {
            cube([avrnano_width, avrnano_depth, avrnano_height]);
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