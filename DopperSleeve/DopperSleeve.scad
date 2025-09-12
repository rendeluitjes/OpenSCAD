height = 200;
thickness = 10;
outer_diam = 80;
outer_radius = outer_diam / 2;
inner_diam = outer_diam - thickness;
inner_radius = inner_diam / 2;

difference()
{
    // Main body cylinder.
    cylinder(h = height, r = outer_radius, $fn = 100);
    
    translate([0, 0, thickness])
    {
        // Cut-out.
        cylinder(h = height, r = inner_radius, $fn = 100);
    }
    
    translate([outer_radius - outer_radius, 0, height])
    {
        rotate([0, -155, -180])
        {
            cube([outer_diam,
            outer_diam, 400], center = true);
        }
    }
}
