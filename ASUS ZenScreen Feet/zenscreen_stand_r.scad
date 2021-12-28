width = 60;
height = 15;
thickness = 2;
depth = 14;
leg_depth = 80;
leg_width = 10;
leg_height = 5;
gap_offset_x = 15;
gap_width = 22;
gap_height = 11;
tilt_angle = 5;
leg_front_depth = 20;



translate([0, 0, 0])
{
    difference()
    {
        rotate(-tilt_angle, [1, 0, 0])
        {
            difference()
            {
                union()
                {
                    cube([width, depth, height]);
                    
                    // Pootje naar voren.
                    rotate(tilt_angle, [1, 0, 0])
                    {
                        difference()
                        {
                            // Pootje.
                            translate([width - leg_width, -leg_front_depth, 0])
                            {
                                cube([leg_width, leg_depth + leg_depth, leg_height]);
                            }
                        }
                    }
                }
                
                // Leegmaken scherm-staander.
                translate([0, thickness, thickness])
                {
                    cube([width - thickness, depth - thickness - thickness, height - thickness]); 
                }
                
                // Uitsnede voor aan/uit knop voorkant.
                translate([gap_offset_x, 0, height - gap_height])
                {
                    cube([gap_width, thickness, gap_height]);
                }
            }
        }
        
        translate([0, 0, -5])
        {
            cube([width, depth + 5, 5]);
        }

    }
}
