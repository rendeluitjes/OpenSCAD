pico_width = 52;
pico_depth = 22;
pico_height = 5;
m5_diag = 5 / 2;
nr_of_picos = 6;
spacing = 3;
segments = 20;
total_width = spacing + pico_width;
total_depth = spacing + pico_depth + spacing;
total_height = spacing + (nr_of_picos * (pico_height + spacing));

difference()
{
    cube([total_width, total_depth, total_height]);
    
    for (p = [0:nr_of_picos-1])
    {
        translate([spacing, spacing, spacing + (p * (spacing + pico_height))])
        {
            cube([pico_width, pico_depth, pico_height]);
        }
    }
    
    // Vertical vent holes.
    translate([spacing+spacing, spacing+spacing, 0])
    {
        cylinder(h = total_height, r = m5_diag, $fn=segments);
    }
    translate([total_width / 2, spacing+spacing, 0])
    {
        cylinder(h = total_height, r = m5_diag, $fn=segments);
    }
    translate([total_width - spacing - spacing, spacing + spacing, 0])
    {
        cylinder(h = total_height, r = m5_diag, $fn=segments);
    }
    
    translate([spacing + spacing, total_depth - spacing - spacing, 0])
    {
        cylinder(h = total_height, r = m5_diag, $fn=segments);
    }
    translate([total_width / 2, total_depth - spacing - spacing, 0])
    {
        cylinder(h = total_height, r = m5_diag, $fn=segments);
    }
    translate([total_width - spacing - spacing, total_depth - spacing - spacing, 0])
    {
        cylinder(h = total_height, r = m5_diag, $fn=segments);
    }
    
    translate([spacing+spacing, total_depth / 2, 0])
    {
        cylinder(h = total_height, r = m5_diag, $fn=segments);
    }
    translate([total_width / 2, total_depth / 2, 0])
    {
        cylinder(h = total_height, r = m5_diag, $fn=segments);
    }
    translate([total_width - spacing - spacing, total_depth / 2, 0])
    {
        cylinder(h = total_height, r = m5_diag, $fn=segments);
    }


}