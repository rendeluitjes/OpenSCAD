width = 120;
depth = 120;
height = 100;
thickness = 3;
corner = 10;
m5 = 1.5;
tilt = 15;
screw_opening = 50;

difference()
{
    cube(size = [ width, depth, height], center = false);
    translate([thickness, thickness, thickness])
        cube(size = [ width - (thickness * 2), depth - (thickness * 2), height], center = false);

    // Slice tilted top of.
    translate([0, 0, height])
        rotate(a = tilt, v = [0, 1, 0])
            cube(size = [ 2* width, 2* depth, 2* height], center = false);    

}
difference()
{
    // lid.
    translate([0, 0, height])
        rotate(a = tilt, v = [0, 1, 0])
            cube(size = [width+corner, depth, thickness], center = false);
    // Cut anything off right of box.
    translate([width, 0, 0])
        cube(size = [ width*2, depth, height ], center = false);
    // Hole left down corner.
    translate([corner, corner, 0])
        cylinder(height, m5, m5, center = false);
    // Hole right down corner.
    translate([width - corner, corner, 0])
        cylinder(height, m5, m5, center = false);
    // Hole left-upper corner.
    translate([corner, depth - (corner), 0])
        cylinder(height, m5, m5, center = false);
    // Hole in right-upper corner.
    translate([width - corner, depth - corner, 0])
        cylinder(height, m5, m5, center = false);
    translate([width / 2, depth / 2, 0])
        cylinder(height, screw_opening, screw_opening, center = false);
}