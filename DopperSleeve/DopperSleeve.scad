height = 200;
inner_diam = 70;
inner_radius = inner_diam / 2;
outer_diam = 80;
outer_radius = outer_diam / 2;

difference()
{
    // Main body cylinder.
    cylinder(h = height, r = outer_radius, $fn = 100);
    
    // Cut-out.
    cylinder(h = height, r = inner_radius, $fn = 100);
}
