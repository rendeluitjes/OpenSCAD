kop_diam = 14.5;
kop_height = 7.7;
stift_diam = 8.2;
stift_height = 23;

translate([0, 0, 0])
{
    cylinder(h = kop_height, r1 = kop_diam / 2, r2 = kop_diam / 2, center = false);
}

translate([0, 0, kop_height])
{
    cylinder(h = stift_height, r1 = stift_diam / 2, r2 = stift_diam / 2, center = false);
}