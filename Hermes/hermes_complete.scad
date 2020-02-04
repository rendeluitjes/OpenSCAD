thickness = 6;
m3_sinkhole_depth = 3;
m3_sinkhole_diam = 3;
m3_diam = 2;
hermes_depth = 45;
hermes_height = 44;
hermes_width = 44;
hermes_hole_spacing = 34;
backplate_width = 62;
backplate_height = 92;
lip_height = 25;
lip_width = 20;
lip_pos_left_x = 36;
hole_spacing_left = 4;
hole_spacing_height = 5;
hole_depth = thickness + hermes_depth + thickness;
xmount_spacing = 23.5;
xmount_x_offset = thickness + 17;
xmount_y_offset = thickness + hermes_depth + thickness;
xmount_y_offset_sinkhole = thickness + hermes_depth;
xmount_z_offset = 22.5;

// Taken from https://gist.github.com/Stemer114/7e420ea8ad9733c4e0ba
module ring(
        h = 1,
        od = 10,
        id = 5,
        de = 0.1
        ) 
{
    difference() {
        cylinder(h=h, r=od/2);
        translate([0, 0, -de])
            cylinder(h=h+2*de, r=id/2);
    }
}

difference()
{
    // Outer block.
    cube([backplate_width, hermes_depth + thickness +       thickness, backplate_height]);
    
    // Make hollow.
    translate([thickness, thickness, 0])
    {
        cube([backplate_width, hermes_depth, backplate_height]);
    }
    
    // Take top of front-corner.
    translate([0, 0, hermes_height])
    {
       cube([hermes_width + thickness, hermes_depth + thickness, backplate_height]);
    }
    
    // Make front panel less broad.
    translate([thickness + hermes_width, 0, 0])
    {
        cube([hermes_width, thickness, backplate_height]);
    }
    
    // Remove space left of cable-lip.
    translate([0, thickness + hermes_depth, backplate_height - lip_height])
    {
        cube([lip_pos_left_x, thickness, lip_height]);
    }
    
    // Remove space right of cable-lip.
    translate([lip_pos_left_x + lip_width, thickness + hermes_depth, backplate_height - lip_height])
    {
        cube([backplate_width - lip_width, thickness, lip_height]);
    }
    
    // Left-lower screw-hole for Hermes.
    translate([thickness + hole_spacing_left, 0, hole_spacing_height])
    {
        rotate(a = [-90, 0 , 0])
        {
            cylinder(h = hole_depth, r = m3_diam);
            cylinder(h = m3_sinkhole_depth, r = 
m3_sinkhole_diam);
        }
    }
    // Sink-hole.
    translate([thickness + hole_spacing_left, thickness + hermes_depth + m3_sinkhole_depth, hole_spacing_height])
    {
        rotate(a = [-90, 0 , 0])
        {
            cylinder(h = m3_sinkhole_depth, r = m3_sinkhole_diam);
        }
    }
    
    // Lower-right screw-hole for Hermes;
    translate([thickness + hole_spacing_left + hermes_hole_spacing, 0, hole_spacing_height])
    {
        rotate(a = [-90, 0 , 0])
        {
            cylinder(h = hole_depth, r = m3_diam);
            cylinder(h = m3_sinkhole_depth, r = 
m3_sinkhole_diam);
        }
    }
    // Sink-hole.
    translate([thickness + hole_spacing_left + hermes_hole_spacing, thickness + hermes_depth + m3_sinkhole_depth, hole_spacing_height])
    {
        rotate(a = [-90, 0 , 0])
        {
            cylinder(h = m3_sinkhole_depth, r = m3_sinkhole_diam);
        }
    }
    
    // Left-upper screw-hole for Hermes.
    translate([thickness + hole_spacing_left, 0, hole_spacing_height + hermes_hole_spacing])
    {
        rotate(a = [-90, 0 , 0])
        {
            cylinder(h = hole_depth, r = m3_diam);
            cylinder(h = m3_sinkhole_depth, r = 
m3_sinkhole_diam);
        }
    }
    // Sink-hole.
    translate([thickness + hole_spacing_left, thickness + hermes_depth + m3_sinkhole_depth, hole_spacing_height + hermes_hole_spacing])
    {
        rotate(a = [-90, 0 , 0])
        {
            cylinder(h = m3_sinkhole_depth, r = m3_sinkhole_diam);
        }
    }
    
    // Right-upper screw-hole for Hermes.
    translate([thickness + hole_spacing_left + hermes_hole_spacing, 0, hole_spacing_height + hermes_hole_spacing])
    {
        rotate(a = [-90, 0 , 0])
        {
            cylinder(h = hole_depth, r = m3_diam);
            cylinder(h = m3_sinkhole_depth, r = 
m3_sinkhole_diam);
        }
    }
    // Sink-hole.
    translate([thickness + hole_spacing_left + hermes_hole_spacing, thickness + hermes_depth + m3_sinkhole_depth, hole_spacing_height + hermes_hole_spacing])
    {
        rotate(a = [-90, 0 , 0])
        {
            cylinder(h = m3_sinkhole_depth, r = m3_sinkhole_diam);
        }
    }
    
    // Tie-wrap holes in cable-lip, left.
    translate([lip_pos_left_x + hole_spacing_height, thickness + hermes_depth, backplate_height - hole_spacing_height])
    {
        rotate(a = [-90, 0 , 0])
        {
            cylinder(h = hole_depth, r = m3_diam);

        }
    }
    
    // Tie-wrap holes in cable-lip, right.
    translate([lip_pos_left_x + lip_width - hole_spacing_height, thickness + hermes_depth, backplate_height - hole_spacing_height])
    {
        rotate(a = [-90, 0 , 0])
        {
            cylinder(h = hole_depth, r = m3_diam);

        }
    }
    
    // X-mount hole, lower-left.
    translate([xmount_x_offset, xmount_y_offset, xmount_z_offset])
    {
        rotate(a = [90, 0 , 0])
        {
            cylinder(h = thickness, r = m3_diam);
        }
    }
    // Sink-hole.
    translate([xmount_x_offset, xmount_y_offset - thickness, xmount_z_offset])
    {
        rotate(a = [-90, 0 , 0])
        {
            cylinder(h = m3_sinkhole_depth, r = m3_sinkhole_diam);
        }
    }
    
    // X-mount hole, lower-right.
    translate([xmount_x_offset + xmount_spacing, xmount_y_offset, xmount_z_offset])
    {
        rotate(a = [90, 0 , 0])
        {
            cylinder(h = thickness, r = m3_diam);
        }
    }
    // Sink-hole.
    translate([xmount_x_offset + xmount_spacing, xmount_y_offset - thickness, xmount_z_offset])
    {
        rotate(a = [-90, 0 , 0])
        {
            cylinder(h = m3_sinkhole_depth, r = m3_sinkhole_diam);
        }
    }
    
    // X-mount hole, upper-left.
    translate([xmount_x_offset, xmount_y_offset, xmount_z_offset + xmount_spacing])
    {
        rotate(a = [90, 0 , 0])
        {
            cylinder(h = thickness, r = m3_diam);
        }
    }
    // Sink-hole.
    translate([xmount_x_offset, xmount_y_offset - thickness, xmount_z_offset + xmount_spacing])
    {
        rotate(a = [-90, 0 , 0])
        {
            cylinder(h = m3_sinkhole_depth, r = m3_sinkhole_diam);
        }
    }

    // X-mount hole, upper-right.
   translate([xmount_x_offset + xmount_spacing, xmount_y_offset, xmount_z_offset + xmount_spacing])
    {
        rotate(a = [90, 0 , 0])
        {
            cylinder(h = thickness, r = m3_diam);
        }
    }
    // Sink-hole.
    translate([xmount_x_offset + xmount_spacing, xmount_y_offset - thickness, xmount_z_offset + xmount_spacing])
    {
        rotate(a = [-90, 0 , 0])
        {
            cylinder(h = m3_sinkhole_depth, r = m3_sinkhole_diam);
        }
    }

}

// Z-probe ring.
translate([-10, (thickness + hermes_depth + thickness) / 2, 20])
{
    ring(h = thickness, od = 22, id = 12.5, de = 0.1);
}