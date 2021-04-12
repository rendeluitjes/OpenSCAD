height = 13;
outer_diam = 10.5 / 2;
inner_diam = 8.5 / 2;

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