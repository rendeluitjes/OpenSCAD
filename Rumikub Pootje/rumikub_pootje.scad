thickness = 2.8;
length = 45;
height= 6.7;

linear_extrude(height = height)
{
    square(size = [thickness, length]);
    translate([0, 26, 0])
    {
        rotate(a = -30)
        {
            square(size = [thickness, 16]);
        };
    };
    
}