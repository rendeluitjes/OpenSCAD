u = 44.55;
thickness = 3;
height = 200;
m3 = 3 / 2;
edge = u / 2;
nr_of_holes = 4;
spacing = (height - edge - edge) / (nr_of_holes - 1);

difference()
{
    linear_extrude(height)
    {
        translate([-u, -u - thickness, 0])
        {
            square([u + thickness, thickness]);
        }
        
        translate([0, -u, 0])
        {
             square([thickness, u]);
        }
        
        translate([0, 0, 0])
        {
            square([u + thickness, thickness]);
        }
    }
    
    // Screw-holes.
    for (y =[edge:spacing:height - edge]) 
    translate([(u + thickness) / 2, 0, y])
    {
        rotate([-90, 0, 0])
        {
            cylinder(r = m3, h = thickness);
        }
    }
    
}