m3_inner_radius = 3.5 / 2;
m3_outer_radius = 7 / 2;
$fn = 60;

module spacer(x, y, height)
{
    translate([x, y, 0])
    {
        difference()
        {
            cylinder(h = height, r = m3_outer_radius);
            cylinder(h = height, r = m3_inner_radius);
        }
    }  
}

for (height = [2 : 0.5 : 4])
{
    for (y = [-15: 10 : 15])
    {
        spacer(-40 + (height * 20), y, height);
    }
}