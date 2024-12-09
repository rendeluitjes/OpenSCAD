floor_thickness = 9;
flanch_width = 11;
normal_thickness = 3;
drive_width = 147;
drive_height = 43;
drive_depth = 135;
front_width = flanch_width + drive_width + flanch_width;
front_depth = normal_thickness + drive_depth;
front_height = normal_thickness + drive_height;
zijkant_offset_x = 5;
zijkant_offset_z = 18;
zijkant_width = 6;
zijkant_depth = 15;
zijkant_height = 22;
m3_rad = 3/2;

difference()
{
    cube([front_width, front_depth, front_height]);
    
    // Drive cut-out.
    translate([flanch_width, 0, floor_thickness])
    {
       cube([drive_width, front_depth, drive_height]);
    }
    
    // Rear cut-out, #1
    translate([flanch_width, normal_thickness + 135, 0])
    {
        cube([26, 26, front_height]);
    }

    // Rear cut-out, #2
    translate([flanch_width + 26, normal_thickness + 135 - 28, 0])
    {
        cube([97, 40, front_height]);
    }
    
    // Rear, cout-out #3
    translate([flanch_width + 26 + 97, normal_thickness + 135 - 28 - 30, 0])
    {
        cube([30, 30 + 28, front_height]);
    }
    
    // Left cut-out.
    translate([0, normal_thickness, 0])
    {
        cube([flanch_width - normal_thickness, front_depth, front_height]);
    }
    
    // Right cut-out.
    translate([front_width - (flanch_width - normal_thickness), normal_thickness, 0])
    {
        cube([flanch_width - normal_thickness, front_depth, front_height]);
    }
    
    // Left cut-out flanch left.
    translate([zijkant_offset_x, 0, zijkant_offset_z])
    {
        cube([zijkant_width, zijkant_depth, zijkant_height]);
    }
    
    // Right cut-out flanch right.
    translate([front_width - flanch_width, 0, zijkant_offset_z])
    {
        cube([zijkant_width, zijkant_depth, zijkant_height]);
    }
    
    // Screw-holes, front, left.
    translate([4, 0, 16])
    {
        rotate([-90, 0, 0])
        {
            cylinder(r = m3_rad, front_depth, $fn = 50);
        }
    }
    
    translate([4, 0, 43])
    {
        rotate([-90, 0, 0])
        {
            cylinder(r = m3_rad, front_depth, $fn = 50);
        }
    }
    
    // Screw-holes, front, right.
    translate([front_width - 4, 0, 16])
    {
        rotate([-90, 0, 0])
        {
            cylinder(r = m3_rad, front_depth, $fn = 50);
        }
    }
    
    translate([front_width - 4, 0, 43])
    {
        rotate([-90, 0, 0])
        {
            cylinder(r = m3_rad, front_depth, $fn = 50);
        }
    }
    
    // Screw hole drive, low front.
    translate([0, 41, 20])
    {
        rotate([0, 90, 0])
        {
            cylinder(r = m3_rad, h = front_width, $fn = 50);
        }
    }
    
    // Screw hole drive, top front. 
    translate([0, 41, 32])
    {
        rotate([0, 90, 0])
        {
            cylinder(r = m3_rad, h = front_width, $fn = 50);
        }
    }
    
    // Screw hole drive, low back.
    translate([0, 120, 20])
    {
        rotate([0, 90, 0])
        {
            cylinder(r = m3_rad, h = front_width, $fn = 50);
        }
    }
    
    // Screw hole drive, top back.
    translate([0, 120, 32])
    {
        rotate([0, 90, 0])
        {
            cylinder(r = m3_rad, h = front_width, $fn = 50);
        }
    }
    
    // Whole in back for optional stand.
    translate([23, 133, 0])
    {
        rotate([0, 0, 90])
        {
            cylinder(r = m3_rad, h = drive_height, $fn = 50);
        }
    }
    
}


 
