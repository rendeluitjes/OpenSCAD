esp8266_width = 60;
esp8266_depth = 35;
esp8266_height = 20;
m3_diag = 3 / 2;
nr_of_esp8266s = 6;
spacing = 2;
segments = 20;
total_width = spacing + esp8266_width;
total_depth = spacing + esp8266_depth + spacing;
total_height = spacing + (nr_of_esp8266s * (esp8266_height + spacing));

difference()
{
    cube([total_width, total_depth, total_height]);
    
    for (p = [0:nr_of_esp8266s-1])
    {
        translate([spacing, spacing, spacing + (p * (spacing + esp8266_height))])
        {
            cube([esp8266_width, esp8266_depth, esp8266_height]);
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