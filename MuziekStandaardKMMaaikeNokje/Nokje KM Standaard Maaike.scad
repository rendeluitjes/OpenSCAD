width = 10;
height = 18;
depth = 14.5;
cutout_rad = 17;
nut_width = 10;
nut_height = 10;
nut_depth = 5;

difference()
{
    cube([width, depth, height]);
    translate([width / 2, -3, 0])
    {
        cylinder(h = 100, r1 = cutout_rad / 2, r2 = cutout_rad / 2, center=true, $fn = 100);
    }
    translate([(width - nut_width)/ 2, depth - nut_depth, ((height - nut_height) / 2) - 2])
    {
        cube([nut_width, nut_depth, nut_height]);
    }
}