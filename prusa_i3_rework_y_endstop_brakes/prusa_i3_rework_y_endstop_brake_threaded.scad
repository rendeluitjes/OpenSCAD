height = 35;
outer_diam = 12 / 2;
inner_diam = 10 / 2;

$fn = 100;

difference()
{
    cylinder(h = height, r = outer_diam);
    cylinder(h = height, r = inner_diam);
    translate([3, -outer_diam, 0])
    {
        cube(size = [outer_diam, 2*outer_diam, height]);
    }
}