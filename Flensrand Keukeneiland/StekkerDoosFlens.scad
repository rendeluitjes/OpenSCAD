rim_diam = 110;
rim_rad = rim_diam / 2;

inner_diam = 79;
inner_rad = inner_diam / 2;
inner_height = 15;

thickness = 2;

difference()
{
    union()
    {
        cylinder(h = inner_height, r = inner_rad + thickness, $fn = 500, center = false);
        translate([0, 0, inner_height])
        {
            cylinder(h = thickness, r = rim_rad, $fn = 500, center = false);
        }  
    }

    cylinder(h = inner_height + thickness, r = inner_rad, $fn = 500, center = false);  

}