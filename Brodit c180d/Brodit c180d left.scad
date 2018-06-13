thick = 4;
brodit_foot_width = 50;
brodit_foot_height = 42;
corner = 5.5;
hole_diam = 4;
bar_height = 35;
bar_width = 100;
overlap = 30;

translate(
        [-brodit_foot_width,-brodit_foot_height,0])
difference()
{
        cube(
            size=[brodit_foot_width, 
                brodit_foot_height, 
                thick]);
            
        translate([corner, corner, 0])
            cylinder(h = thick, 
                    r1 = hole_diam /2, 
                    r2 = hole_diam /2);
    
        translate([corner, brodit_foot_height -                 corner, 0])
            cylinder(h = thick, 
                    r1 = hole_diam /2, 
                    r2 = hole_diam /2);
    
        translate([brodit_foot_width - corner,              corner, 0])
            cylinder(h = thick, 
                    r1 = hole_diam /2, 
                    r2 = hole_diam /2);
        
        translate([brodit_foot_width - corner,              brodit_foot_height- corner, 0])
            cylinder(h = thick, 
                    r1 = hole_diam /2, 
                    r2 = hole_diam /2);
}

translate([-brodit_foot_width,0,0])
difference()
{
    cube(size=[bar_width,bar_height,thick]);
    
    rotate(a=45)
        cube(size=[60,60,thick]);
    
    translate([bar_width - overlap,0,thick/2])
            cube(size=[overlap,bar_height,thick/2]);
}
