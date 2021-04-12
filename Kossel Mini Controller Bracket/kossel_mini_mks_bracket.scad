m3_rad = 3 / 2;
mount_hole_hor_dist = 102;
mount_hole_vert_dist = 76;
$fn = 40;
thickness = 5;
ril_dim = 3;
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
top_ridge_correction = 1;

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
                        [0, 100],
                        [39, 123],
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
        union()
        {
            cube(size = [thickness, controller_height, lip_height]);
            // top ril.
            translate([thickness, 0, lip_height - (alu_height / 2) - (ril_dim / 2)+top_ridge_correction])
            {
                cube(size = [ril_dim, controller_height, ril_dim]);
            }
            // bottom ril.
            translate([thickness, 0, (alu_height / 2) - (ril_dim / 2)])
            {
                cube(size = [ril_dim, controller_height, ril_dim]);
            }
        }
    }
    
    translate([141 - thickness, border, vert_border])
    {
        union()
        {
            cube(size = [thickness, controller_height - border - border, lip_height - vert_border - vert_border]);
            translate([thickness, 0, lip_height - (alu_height / 2) - (ril_dim / 2)])
            {
                cube(size = [ril_dim, controller_height, ril_dim]);
            }
        }
    }
    
    // 15x15 alu screw hole lowest.
    translate([141 - thickness, controller_height / 2, alu_height / 2])
    {
        rotate(a = [0, 90, 0])
        {
            cylinder(h = thickness + ril_dim, r = m3_rad);
        }
    }

    // 15x15 alu screw hole highest.
    translate([141 - thickness, controller_height / 2, lip_height - (alu_height / 2)+top_ridge_correction])
    {
        rotate(a = [0, 90, 0])
        {
            cylinder(h = thickness + ril_dim, r = m3_rad);
        }
    }

}

// Lip to top-end of bracket.
translate([0, 100, 0])
{
    rotate(a = [0, 0, backlip_angle])
    {
        difference()
        {
            union()
            {
                cube(size = [backlip_width, thickness, lip_height]);

                // top ril.
                translate([0, thickness, lip_height - (alu_height / 2) - (ril_dim / 2)+top_ridge_correction])
                {
                    cube(size = [backlip_width, ril_dim, ril_dim]);
                }
                // bottom ril.
                translate([0, thickness, (alu_height / 2) - (ril_dim / 2)])
                {
                    cube(size = [backlip_width, ril_dim, ril_dim]);
                }
            }
            
            // Cut-out.
            translate([border, 0, vert_border])
            {
                cube(size = [backlip_width - border - border, thickness, lip_height - vert_border - vert_border]);
                    
            }
            
            // 15x15 alu screw hole highest.
            translate([backlip_width / 2, 0, lip_height - (alu_height / 2)+top_ridge_correction])
            {
                rotate(a = [-90, 0, 0])
                {
                    cylinder(h = thickness + ril_dim, r = m3_rad);
                }
            }
            
            // 15x15 alu screw hole lowest.
            translate([backlip_width / 2, 0, alu_height / 2])
            {
                rotate(a = [-90, 0, 0])
                {
                    cylinder(h = thickness + ril_dim, r = m3_rad);
                }
            }
        }
    }

}

