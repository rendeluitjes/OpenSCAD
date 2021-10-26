hole_rad = 38 / 2;
thick = 4;
gap = 6.5;
depth = 50;
height = 35;
click_diam = 39;
click_width = 7;
width = (2*hole_rad)+(2*thick);
long = 100;
hor_thick = 4;
$fn = 100;
click_height = 39;

// Hanging brade, flat surface.
translate([0, 0, 0])
{
    cube(size=[thick, width, height]);
}

// Clip-part.
translate([0, 0, height])
{
    cube(size=[thick+gap+thick, width, thick]);
}
    
translate([thick+gap, 0, 0])
{
    cube(size=[thick, width, height]);
}
    

intersection()
{
    difference()
    {
        translate([thick+thick+thick, 0, 0])
        {
            cube(size=[long, width, hor_thick]);
        }
        
        center_x = (thick+gap+thick+long)-thick-thick-hole_rad;
        center_y = width / 2;
        translate([center_x, center_y, 0])
        {
            cylinder(h = hor_thick, r = hole_rad);
        }
        
        // Lock clips cutout.
        translate([center_x - (click_width / 2), center_y - (click_diam / 2), thick / 2])
        {
            cube(size = [click_width, click_height, thick / 2]);
        }

    }
    
    // Rounded edge, just for some curveture!
    translate([0, width/2, 0])
    {
        cylinder(h = hor_thick, r = 110);
    }
    
}