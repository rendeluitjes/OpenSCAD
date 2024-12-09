thickness = 3.5;
drive_width = 147;
total_depth = 135;
total_height = 78;
drive_depth = total_depth;
drive_height = 42;
gap_left = 8;
gap_right = 8;
gap_height = 8;
gap_under_height = 40;
gap_under_depth = 106;
total_width = gap_left + thickness + drive_width + thickness + gap_right;
clip_offset = 5;
clip_height_offset = total_height - 28;
clip_width = 10;
clip_depth = 15;
clip_height = 22;
m3_rad = 3 / 2;

difference()
{
    cube([total_width, total_depth, total_height]);
    
    // Left cut-out.
    translate([0, thickness, 0])
    {
        cube([gap_left, total_depth, total_height]);
    }
    
    // Right cut-out.
    translate([total_width - gap_right, thickness, 0])
    {
        cube([gap_right, total_depth, total_height]);
    }
    
    // Under cut-out.
    translate([0, 0, 0])
    {
        cube([total_width, gap_under_depth, gap_under_height]);
    }
    
    // Drive cut-out.
    translate([gap_left + thickness, 0, gap_under_height + thickness])
    {
        cube([drive_width, drive_depth, drive_height]);
    }
    
    // Left clip cut-out.
    translate([clip_offset, 0, clip_height_offset])
    {
        cube([clip_width, clip_depth, clip_height]);
    }
    
    // Right clip cut-out.
    translate([total_width - clip_offset - clip_width, 0, clip_height_offset])
    {
        cube([clip_width, clip_depth, clip_height]);
    }
    
    // Back cut-out.
    translate([30, 106 + thickness, 0])
    {
        cube([drive_width, drive_depth, total_height]);
    }
    
    // Linker achter-teen.
    translate([0, 106 + thickness, thickness])
    {
       cube([total_width, 100, 44 - thickness]);
    }
    
    // Under linker achter-teen.
    translate([0, 0, 0])
    {
        cube([32, total_depth, 44 - thickness]);
    }
    
    // Right pilar cut-out.
    translate([135, 79, 0])
    {
        cube([40, 80, total_height]);
    }
    
    // Screw-holes front-bottom.
    translate([0, 41, total_height - 27])
    {
        rotate([-90, -90, -90])
        {
            cylinder(h = total_width, r = m3_rad, $fn = 50);
        }
    }
    
    // Screw-holes front-top.
    translate([0, 41, total_height - 15])
    {
        rotate([-90, -90, -90])
        {
            cylinder(h = total_width, r = m3_rad, $fn = 50);
        }
    }
    
    // Screw-holes back-bottom.
    translate([0, 41 + 79, total_height - 27])
    {
        rotate([-90, -90, -90])
        {
            cylinder(h = total_width, r = m3_rad, $fn = 50);
        }
    }
    
   // Screw-holes back-top.
    translate([0, 41 + 79, total_height - 15])
    {
        rotate([-90, -90, -90])
        {
            cylinder(h = total_width, r = m3_rad, $fn = 50);
        }
    }
    
    // Screw hole front-left-top.
    translate([thickness, 0, total_height - thickness])
    {
        rotate([-90, 0, 0])
        {
            cylinder(h = total_depth, r = m3_rad, $fn = 50);
        }
    }
    
    // Screw hole front-left-bottom.
    translate([thickness, 0, total_height - thickness - 27.5])
    {
        rotate([-90, 0, 0])
        {
            cylinder(h = total_depth, r = m3_rad, $fn = 50);
        }
    }
    
    // Screw hole front-right-top.
    translate([total_width - thickness, 0, total_height - thickness])
    {
        rotate([-90, 0, 0])
        {
            cylinder(h = total_depth, r = m3_rad, $fn = 50);
        }
    }
    
    // Screw hole front-right-bottom.
    translate([total_width - thickness, 0, total_height - thickness - 27.5])
    {
        rotate([-90, 0, 0])
        {
            cylinder(h = total_depth, r = m3_rad, $fn = 50);
        }
    }
    
}

// Under-lip front.
translate([gap_left + thickness, 0, gap_under_height - gap_height])
{
    cube([drive_width, thickness, gap_height]);
}


