outer_rad = 150 / 2;
inner_rad = 75 / 2;
thickness = 1;

difference()
{
    cylinder(h = thickness, r = outer_rad, $fn = 100);
    cylinder(h = thickness, r = inner_rad, $fn = 100);
}