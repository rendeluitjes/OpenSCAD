top_width = 56;
total_width = 78;
total_height = 68;
thickness = 8;
m3_rad = 3.5 /2 ;
m3_nut_rad = 6 / 2;
x_carriage_hole_dist = 23;
x_carriage_space_hor = 17;
x_carriage_space_vert = 23;
hemera_hole_dist = 34;
hemera_space = 4;
$fn = 100;

// Place for bolt towards X-Carriage.
module nut_hole()
{
    cylinder(thickness, r = m3_rad, center = false);
    translate([0, 0, thickness / 2])
    {
        cylinder(thickness / 2, r = m3_nut_rad, center = false);
    }

}

// Place for bolt towards Hemera extruder.
module bolt_hole()
{
    cylinder(thickness, r = m3_rad, center = false);
    translate([0, 0, 0])
    {
        cylinder(thickness / 2, r = m3_nut_rad, center = false);
    }
}

difference()
{
    cube([total_width, total_height, thickness]);
    
    // Left-top
    translate([x_carriage_space_hor, total_height - x_carriage_space_vert, 0])
    {
        nut_hole();
    }
    
    // Right-top.
    translate([x_carriage_space_hor + x_carriage_hole_dist, total_height - x_carriage_space_vert, 0])
    {
        nut_hole();
    }
        
    // Left-bottom.
    translate([x_carriage_space_hor, total_height - x_carriage_space_vert - x_carriage_hole_dist, 0])
    {
        nut_hole();
    }
          
    // Right-bottom.
    translate([x_carriage_space_hor + x_carriage_hole_dist, total_height - x_carriage_space_vert - x_carriage_hole_dist, 0])
    {
        nut_hole();
    }
    
    // Hemera, right-bottom.
    translate([total_width - hemera_space, hemera_space, 0])
    {
        bolt_hole();
    } 
    
    // Hemera, right-top.
    translate([total_width - hemera_space, hemera_space + hemera_hole_dist, 0])
    {
        bolt_hole();
    } 

    // Hemera, left-top.
    translate([total_width - hemera_space - hemera_hole_dist, hemera_space + hemera_hole_dist, 0])
    {
        bolt_hole();
    } 
 
    // Hemera, left-bottom.
    translate([total_width - hemera_space - hemera_hole_dist, hemera_space, 0])
    {
        bolt_hole();
    }    
    
}