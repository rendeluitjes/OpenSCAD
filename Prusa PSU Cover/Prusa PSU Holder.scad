thickness = 2;
thickness_half = thickness / 2;

width_inner = 50.5;
depth_inner = 111;
height_inner = 90;

width_outer = width_inner + thickness + thickness;
depth_outer = depth_inner + thickness + thickness;
height_outer = height_inner + thickness;

inner_rim_at = 40;

switch_cutout_height_offset = 6;
switch_cutout_depth_offset = 60.5;
switch_cutout_height = 28;
switch_cutout_depth = 48.5;
switch_cutout_rim = 4;

difference()
{
    // Outer box.
    cube([width_outer, depth_outer, height_outer]);
    
    // Make hollow, lower-part.
    translate([thickness, thickness, thickness])
    {
        cube([width_inner, depth_inner, inner_rim_at]);
    }
    
    // Make hollow, lower-part.
    translate([thickness, thickness, thickness + inner_rim_at + thickness])
    {
        cube([width_inner, depth_inner, 80]);
    }
    
    // Inner cable opening.
    translate([thickness + thickness, thickness + thickness, thickness])
    {
        cube([width_inner - thickness - thickness, depth_inner - thickness - thickness, height_inner]);
    }
    
    // Switch cut-out.
    translate([thickness + width_inner, switch_cutout_depth_offset, switch_cutout_height_offset])
    {
        cube([thickness, switch_cutout_depth, switch_cutout_height]);
    }

    // Switch cut-out rim.
    translate([thickness + width_inner + thickness - thickness_half, switch_cutout_depth_offset - switch_cutout_rim, switch_cutout_height_offset - switch_cutout_rim])
    {
        cube([thickness_half, switch_cutout_rim + switch_cutout_depth + switch_cutout_rim, switch_cutout_rim + switch_cutout_height + switch_cutout_rim]);
    }   
    
    // Cable-opening back.
    translate([15, depth_outer - thickness, 15])
    {
        rotate(a = 270, v = [1, 0, 0])
        {
            cylinder(h = 80, r = 5, center = true);
        }
    }
    
    
}