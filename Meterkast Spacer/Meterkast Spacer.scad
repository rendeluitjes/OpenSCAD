height = 70;
outer_rad = 30 / 2;
inner_rad = 20 / 2;
screw_rad = 5;

difference()
{
    cylinder(h = height, r = outer_rad, $fn = 100);
    
    translate([0, 0, 0])
    {
        cylinder(h = height, r = screw_rad, $fn = 100);
    }
    
    translate([0, 0, 5])
    {
        cylinder(h = height, r = inner_rad, $fn = 100);
    }
}