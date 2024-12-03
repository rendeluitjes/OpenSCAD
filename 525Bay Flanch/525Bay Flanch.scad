drive_width = 148;
drive_height = 43;
drive_depth = 140;
lip_width = 5;
thickness = 2;
m3_rad = 3 / 2;
total_width = drive_width + lip_width + thickness + lip_width + thickness;
hole_distance = 8;

difference()
{
    cube([total_width, drive_depth, drive_height]);
    
    // Cutout left.
    translate([0, thickness, thickness])
    {
        cube([lip_width, drive_depth - thickness - thickness, drive_height - thickness - thickness]);
    }
    
    // Drive cutout.
    translate([lip_width + thickness, 0, thickness])
    {
        cube([drive_width, drive_depth, drive_depth]);
    }
    
    // Cutout right.
    translate([drive_width + lip_width + lip_width, thickness, thickness])
    {
        cube([lip_width, drive_depth - thickness - thickness, drive_height - thickness - thickness]);
    }
    
    // Screw hole, under-row, front.
    translate([0, 45, 14 + 2])
    {
        rotate([0, 90, 0])
        {
            cylinder(h = total_width, r = m3_rad, $fn = 50);
        }
    }
    
    // Screw hole, under-row, back.
    translate([0, 45 + 80, 14 + 2])
    {
        rotate([0, 90, 0])
        {
            cylinder(h = total_width, r = m3_rad, $fn = 50);
        }
    }
    
    // Screw hole, top-row, front.
    translate([0, 45, 14 + 13])
    {
        rotate([0, 90, 0])
        {
            cylinder(h = total_width, r = m3_rad, $fn = 50);
        }
    }
    
    // Screw hole, top-row, back.
    translate([0, 45 + 80, 14 + 13])
    {
        rotate([0, 90, 0])
        {
            cylinder(h = total_width, r = m3_rad, $fn = 50);
        }
    }
    
    // Screw-hole left, down.
    translate([(lip_width + thickness)/ 2, 0, hole_distance])
    {
        rotate([-90, 0, 0])
        {
            cylinder(h = drive_depth /2, r = m3_rad, $fn = 50);
        }
    }
    
    // Screw-hole left, top.
    translate([(lip_width + thickness)/ 2, 0, drive_height - hole_distance])
    {
        rotate([-90, 0, 0])
        {
            cylinder(h = drive_depth/ 2, r = m3_rad, $fn = 50);
        }
    }
    
    // Screw-hole right, down.
    translate([total_width - (lip_width / 2), 0, hole_distance])
    {
        rotate([-90, 0, 0])
        {
            cylinder(h = drive_depth /2, r = m3_rad, $fn = 50);
        }
    }
    
    // Screw-hole left, top.
    translate([total_width - (lip_width / 2), 0, drive_height - hole_distance])
    {
        rotate([-90, 0, 0])
        {
            cylinder(h = drive_depth/ 2, r = m3_rad, $fn = 50);
        }
    }
    
}
    