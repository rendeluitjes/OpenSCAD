thickness = 2;
width = 115;
outer_width = thickness + width + thickness;
depth = 50;
outer_depth = thickness + depth + thickness;
height = 80;
outer_height = thickness + height;
m3_diam = 3;
hole_offset = 15;
power_220v_diam = 6+1;
power_12v_diam = 5+1;
metal_thickness = 2;
step1 = 10;

difference()
{
    // Outer shell.
    cube([outer_width, outer_depth, outer_height]);
    
    translate([thickness + metal_thickness, thickness + metal_thickness, thickness])
    {
        cube([width - metal_thickness - metal_thickness, depth - metal_thickness - metal_thickness, height]);
    }
    
    translate([thickness, thickness, thickness + step1])
    {
        cube([width, depth, height]);
    }
    
    // Screw-holes to frame.
    translate([0, hole_offset, hole_offset])
    {
        rotate([0, 90, 0])
        {
            cylinder(h = thickness, r = m3_diam / 2, $fn = 100);
        }
    }
    
    translate([0, outer_depth - hole_offset, hole_offset])
    {
        rotate([0, 90, 0])
        {
            cylinder(h = thickness, r = m3_diam / 2, $fn = 100);
        }
    }
    
    translate([0, hole_offset, outer_height - hole_offset])
    {
        rotate([0, 90, 0])
        {
            cylinder(h = thickness, r = m3_diam / 2, $fn = 100);
        }
    }
    
    translate([0, outer_depth - hole_offset, outer_height - hole_offset])
    {
        rotate([0, 90, 0])
        {
            cylinder(h = thickness, r = m3_diam / 2, $fn = 100);
        }
    }
    
    // 220V hole.
    translate([outer_width / 2, 0, thickness + (step1 / 2)])
    {
        rotate([-90, 0, 0])
        {
            cylinder(h = thickness + metal_thickness, r = power_220v_diam / 2, $fn = 100);
        }
    }
    
    // 12V hole.
    translate([outer_width / 2, outer_depth, thickness + (step1 / 2)])
    {
        rotate([90, 0, 0])
        {
            cylinder(h = thickness + metal_thickness, r = power_12v_diam / 2, $fn = 100);
        }
    }
    
}

