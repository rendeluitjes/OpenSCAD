hole_rad = 19;
thick = 4;
gap = 6.5;
depth = 50;
height = 35;
width = (2*hole_rad)+(2*thick);
long = 100;
hor_thick = 4;

translate([0, 0, 0])
    cube(size=[thick, width, height]);
    
translate([0, 0, height])
    cube(size=[thick+gap+thick, width, thick]);
    
translate([thick+gap, 0, 0])
    cube(size=[thick, width, height]);
    

intersection()
{
    difference()
    {
        translate([thick+thick+thick, 0, 0])
            cube(size=[long, width, hor_thick]);
        
        center_x = (thick+gap+thick+long)-thick-thick-hole_rad;
        center_y = width / 2;
        translate([center_x, center_y, 0])
            cylinder(h = hor_thick, 
                r1 = hole_rad, 
                r2 = hole_rad,
        $fn = 100);

    }
    
    translate([0, width/2, 0])
        cylinder(h = hor_thick, r1 = 110, r2 = 110);
    
}