m3_rad = 3 / 2;
mount_hole_hor_dist = 102;
mount_hole_vert_dist = 76;
$fn = 40;
thickness = 5;
alu_height = 15;
lip_height = alu_height + 13 + alu_height;
backlip_width = 45.1;
controller_height = 84;
controller_width = 110;
vert_border = 15;
border = 10;
backlip_angle = 30;
base_x = 18;
base_y = 4;

difference()
{
    union()
    {
        linear_extrude(height = thickness)
        {
            difference()
            {
                // outline.
                polygon(
                    points = [
                        [0, 0],
                        [0, 105],
                        [39, 128],
                        [39, 84],
                        [141, 84],
                        [141, 0],
                        [0, 0]
                        ]);
                
                // Ventilation cut-out.
                polygon(
                    points = [
                        [22, 10],
                        [22, 74],
                        [114, 74],
                        [114, 10],
                        [22, 10]
                        ]);
                  
            }
            
        }
            
        // Mounting holes.
        translate([base_x, base_y, 0])
        {
            cylinder(h = thickness + thickness, r = m3_rad+2);
        }
        translate([base_x + mount_hole_hor_dist, base_y, 0])
        {
            cylinder(h = thickness + thickness, r = m3_rad+2);
        }
        translate([base_x + mount_hole_hor_dist, base_y+ mount_hole_vert_dist, 0])
        {
            cylinder(h = thickness + thickness, r = m3_rad+2);
        }
        translate([base_x, base_y + mount_hole_vert_dist, 0])
        {
            cylinder(h = thickness + thickness, r = m3_rad+2);
        }
    }
    
    // All-through screw holes.
    translate([base_x, base_y, 0])
    {
        cylinder(h = thickness + thickness, r = m3_rad);
    }
    translate([base_x + mount_hole_hor_dist, base_y, 0])
    {
        cylinder(h = thickness + thickness, r = m3_rad);
    }
    translate([base_x + mount_hole_hor_dist, base_y+ mount_hole_vert_dist, 0])
    {
        cylinder(h = thickness + thickness, r = m3_rad);
    }
    translate([base_x, base_y + mount_hole_vert_dist, 0])
    {
        cylinder(h = thickness + thickness, r = m3_rad);
    }
}

// Lip to right of bracket.
difference()
{
    translate([141 - thickness, 0, 0])
    {
        cube(size = [thickness, controller_height, lip_height]);
    }
    
    translate([141 - thickness, 10, vert_border])
    {
        cube(size = [thickness, controller_height - border - border, lip_height - vert_border - vert_border]);
    }
    
    // 15x15 alu screw hole lowest.
    translate([141 - thickness, controller_height / 2, alu_height / 2])
    {
        rotate(a = [0, 90, 0])
        {
            cylinder(h = thickness, r = m3_rad);
        }
    }

    // 15x15 alu screw hole highest.
    translate([141 - thickness, controller_height / 2, lip_height - (alu_height / 2)])
    {
        rotate(a = [0, 90, 0])
        {
            cylinder(h = thickness, r = m3_rad);
        }
    }

}



// Lip to top-end of bracket.
translate([0, 105, 0])
{
    rotate(a = [0, 0, backlip_angle])
    {
        difference()
        {
            cube(size = [backlip_width, thickness, lip_height]);
            
            // Cut-out.
            translate([10, 0, vert_border])
            {
                cube(size = [backlip_width - border - border, thickness, lip_height - vert_border - vert_border]);
                    
            }
            
            // 15x15 alu screw hole lowest.
            translate([backlip_width / 2, thickness, alu_height / 2])
            {
                rotate(a = [90, 0, 0])
                {
                    cylinder(h = thickness, r = m3_rad);
                }
            }

            // 15x15 alu screw hole highest.
            translate([backlip_width / 2, thickness, lip_height - (alu_height / 2)])
            {
                rotate(a = [90, 0, 0])
                {
                    cylinder(h = thickness, r = m3_rad);
                }
            }


        }
    }

}

