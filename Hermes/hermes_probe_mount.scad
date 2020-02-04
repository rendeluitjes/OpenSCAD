// Outer dimensions.
hermes_hole_distance = 34;
m3_hole_diam = 2;
m3_rim_diam = 3;
m3_hole_rim = 3;
hermes_spacing = 5;
block_size = hermes_hole_distance + hermes_spacing + hermes_spacing;
thickness = 6;

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

// Front-clamp with Z-probe ring.
translate([block_size + thickness, -block_size - thickness, block_size])
{
    rotate(a = [180, 0 , 180])
    {
        difference()
        {
            cube([block_size + thickness, block_size + thickness, block_size]);
            translate([0, thickness, 0])
            {
                cube([block_size, block_size, block_size]);
            }
            
            // Mounting hole, Hermes, left-lower.
            translate([hermes_spacing + 2, 0, hermes_spacing])
            {
                rotate(a = [90, 0, 0])
                {
                     cylinder(h = block_size, r = m3_hole_diam, center = true);
                     cylinder(h = m3_hole_rim, r = m3_rim_diam, center = true);
                }
            }
            
            // Mounting hole, Hermes, right-lower.
            translate([hermes_spacing + hermes_hole_distance, 0, hermes_spacing])
            {
                rotate(a = [-90, 0 , 0])
                {
                     cylinder(h = block_size, r = m3_hole_diam, center = true);
                     cylinder(h = m3_hole_rim, r = m3_rim_diam, center = true);
                }
            }
           
            // Mounting hole, Hermes, left-top.
            translate([hermes_spacing + 2, 0, hermes_spacing + hermes_hole_distance])
            {
                rotate(a = [-90, 0 , 0])
                {
                     cylinder(h = block_size, r = m3_hole_diam, center = true);
                     cylinder(h = m3_hole_rim, r = m3_rim_diam, center = true);
                }
            } 

           
            // Mounting hole, Hermes, right-top.
            translate([hermes_spacing + hermes_hole_distance, 0, hermes_spacing + hermes_hole_distance])
            {
                rotate(a = [-90, 0 , 0])
                {
                     cylinder(h = block_size, r = m3_hole_diam, center = true);
                     cylinder(h = m3_hole_rim, r = m3_rim_diam, center = true);
                }
            } 
            
        }

        translate([block_size + thickness + 10, (block_size + thickness) / 2, 20])
        {
            ring(h = thickness, od = 22, id = 12.5, de = 0.1);
        }
    }
}

m3 = 1.75;
m3_sinkhole = 3.5;
sinkhole_height = 4;
border = 6;
thickness = 7;
width = 60; //92;
height = 92;
hermes_hole_distance = 34;
prusa_hole_distance = 23;
prusa_border_x = 17;
prusa_border_y = 23;
cable_lip_width = 20;
cable_lip_height = 25;
cable_lip_gap_right = 4;
cable_lip_distance = 4;
cable_lip_gap_left = width - cable_lip_width - cable_lip_gap_right;

translate([0, thickness, 0])
{
    rotate(a = [90, 0 , 0])
    {
        difference()
        {
            cube([width, height, thickness]);
            
            // Hermes lower left hole.
            translate([border, border, 0])
            {
                cylinder(h = height, r1 = m3, r2 = m3);
                cylinder(h = sinkhole_height, r1 = m3_sinkhole, r2 = m3_sinkhole);   
            }
            
            // Hermes lower right hole.
            translate([border + hermes_hole_distance, border, 0])
            {
                cylinder(h = height, r1 = m3);
                cylinder(h = sinkhole_height, r1 = m3_sinkhole, r2 = m3_sinkhole);
            }
            
            // Hermes higher left hole.
            translate([border, border + hermes_hole_distance, 0])
            {
                cylinder(h = height, r1 = m3);
                cylinder(h = sinkhole_height, r1 = m3_sinkhole, r2 = m3_sinkhole);
            }
            
            // Hermes higher right hole.
            translate([border + hermes_hole_distance, border + hermes_hole_distance, 0])
            {
                cylinder(h = height, r1 = m3);
                cylinder(h = sinkhole_height, r1 = m3_sinkhole, r2 = m3_sinkhole);
            }
            
            // Prusa lower left hole.
            translate([prusa_border_x, prusa_border_y, 0])
            {
                cylinder(h = height, r1 = m3);
                translate([0, 0, thickness / 2])
                {
                    cylinder(h = height, r1 = m3_sinkhole);
                }      
            }
            
            // Prusa lower right hole.
            translate([prusa_border_x + prusa_hole_distance, prusa_border_y, 0])
            {
                cylinder(h = height, r1 = m3);
                translate([0, 0, thickness / 2])
                {
                    cylinder(h = height, r1 = m3_sinkhole);
                }
            }
            
            // Prusa higher left hole.
            translate([prusa_border_x, prusa_border_y + prusa_hole_distance, 0])
            {
                cylinder(h = height, r1 = m3);
                translate([0, 0, thickness / 2])
                {
                    cylinder(h = height, r1 = m3_sinkhole);
                } 
            }
            
            // Prusa higher right hole.
            translate([prusa_border_x + prusa_hole_distance, prusa_border_y + prusa_hole_distance, 0])
            {
                cylinder(h = height, r1 = m3);
                translate([0, 0, thickness / 2])
                {
                    cylinder(h = height, r1 = m3_sinkhole);
                } 
            }   
            
            // Cut-out of top-left corner.
            translate([0, height - cable_lip_height, 0])
            {
                cube([cable_lip_gap_left, cable_lip_height, thickness]);
            }
            
            // Cut-out of right-top corner.
            translate([width - cable_lip_gap_right, height - cable_lip_height, 0])
            {
                cube([cable_lip_gap_right, cable_lip_height, thickness]);
            }
            
            // Hole for tie-wrap, left.
            translate([cable_lip_gap_left + cable_lip_distance, height - cable_lip_distance, 0])
            {
                cylinder(h = height, r1 = m3);
            }
            
            // Hole for tie-wrap, right.
            translate([cable_lip_gap_left + cable_lip_width - cable_lip_distance, height - cable_lip_distance, 0])
            {
                cylinder(h = height, r1 = m3);
            }
            
        }
    }
}