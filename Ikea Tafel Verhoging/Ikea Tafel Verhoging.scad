inner_width = 63;
inner_depth = 63;
inner_height = 30;
rim = 5;

difference()
{
    cube([rim+ inner_width + rim, rim + inner_depth + rim, rim + rim + inner_height]);
    translate([rim, rim, inner_height])
    {
        cube([inner_width, inner_depth, inner_height]);
    }
}