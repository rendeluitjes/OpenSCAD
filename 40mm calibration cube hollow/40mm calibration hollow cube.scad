width = 40;
depth = 40;
height = 40;
thickness = 1;

difference()
{
    cube([width, height, depth]);
    translate([thickness, thickness, thickness])
    {
        cube([width - thickness - thickness, height - thickness - thickness, depth - thickness]);
    }
}