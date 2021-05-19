height = 20;
head_rad = 8 / 2;
head_height = 1;
neck_rad = 4 / 2;
hole_rad = 3 / 2;
$fn = 40;

// Head, laying flat.
cylinder(h = head_height, r = head_rad);
translate([0, 0, head_height])
{
    // Neck.
    cylinder(h = height - head_height, r = hole_rad);
}