m3_inner_radius = 3.5 / 2;
m3_outer_radius = 7 / 2;
height = 2.3;
$fn = 60;

difference()
{
    cylinder(h = height, r = m3_outer_radius);
    cylinder(h = height, r = m3_inner_radius);

}