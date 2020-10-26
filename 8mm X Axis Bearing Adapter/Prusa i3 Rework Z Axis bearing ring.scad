outer_diam = 24.5;
inner_diam = 22.5;
outer_rad = outer_diam / 2;
inner_rad = inner_diam / 2;
height = 7.5;

difference()
{
    cylinder(h = height, r = outer_rad, center = false, $fn = 100);
    cylinder(h = height, r = inner_rad, center = false, $fn = 100);
}