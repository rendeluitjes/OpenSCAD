length = 100;
thickness = 4;
width = 10;

cube([length, width, thickness]);
translate([thickness, 2, thickness])
{
    linear_extrude(height = 1)
    {
        text("10 cm", font = "Liberation Sans", size = 6, direction = "ltr", spacing = 1 );
    }
}