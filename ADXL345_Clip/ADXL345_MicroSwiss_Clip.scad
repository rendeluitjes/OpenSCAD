thickness = 2.5;
gap = 3.5;
adxl_width = 20;
adxl_thickness = 3;
adxl_depth = 13;
m3_rad = 2.75/2;
m3_spacing = 2;

grip_height = 8;

// Flat plate.
difference()
{
    cube([adxl_width, adxl_depth, thickness]);
    translate([m3_spacing, adxl_depth - m3_spacing, 0])
    {
        cylinder(h = thickness, r = m3_rad, $fn = 40);
    }
    translate([adxl_width - m3_spacing, adxl_depth - m3_spacing, 0])
    {
        cylinder(h = thickness, r = m3_rad, $fn = 40);
    }
}

// Front plate.
difference()
{
    translate([0, 0, thickness])
    {
        cube([adxl_width, thickness, grip_height]);
    }
    
    translate([adxl_width / 2, 0, 7])
    {
        rotate(a = [0, -90, -90])
        {
            cylinder(h = thickness, r = m3_rad, $fn = 40);
        }
    }
}

// Back plate.
difference()
{
    translate([0, thickness + gap, thickness])
    {
        cube([adxl_width, thickness, grip_height]);
    }
    
    translate([adxl_width / 2, thickness + gap, 7])
    {
        rotate(a = [0, -90, -90])
        {
            cylinder(h = thickness, r = m3_rad, $fn = 40);
        }
    }
}