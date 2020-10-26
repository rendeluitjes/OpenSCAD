width = 150;
depth = 150;
height = 35;
rows = 4;
columns = 4;
spacing = 20;
xspace = (width - spacing - spacing) / (rows - 1);
yspace = (depth - spacing - spacing) / (columns - 1);
left = -(width / 2);
right = (width / 2);
back = -(depth / 2);
hole_r1 = 5;
hole_r2 = 5.1;

translate([left, back])
{
    difference()
    {
        cube([width, depth, height]);
        
        for (x=[0:rows-1])
        {
            for (y=[0:columns-1])
            {
                translate([spacing + (x * xspace),
                    spacing + (y * yspace), 3])
                {
                    cylinder(h = height, r1 = hole_r1, r2 = hole_r2 + (x/2));
                }
            }
        }           
    }
}