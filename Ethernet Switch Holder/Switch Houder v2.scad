switch_width = 155;
switch_depth = 30;
switch_height = 76;
thickness = 2;
m3 = 4 / 2;
colar_height = 41;
ventilation_rad = 2;
ventilation_spacing = 5;
border = 20;
sections = 20;
border_offset_x_left = -(border / 2);
border_offset_x_right = thickness + switch_width + thickness + border - (border / 2);
border_offset_y = thickness + switch_depth;
border_offset_z_bottom = (border / 2);
border_offset_z_top = thickness + colar_height + border + (border / 2);

difference()
{

    // Backside border.
    union()
    {
        // Main body.
        cube([thickness + switch_width + thickness,
            thickness + switch_depth + thickness, 
            thickness + colar_height + border]);
        
        // Backside border.
        translate([-border, thickness + switch_depth, 0])
        {
            cube([border + thickness + switch_width + thickness + border,
                thickness,
                thickness + colar_height + border + border]);

        }
    }
    
    // Make it hallow.
    translate([thickness, thickness, thickness])
    {
        cube([switch_width, switch_depth, switch_height], center=false);
    }
    
    // Screw-holes, left-bottom.
    translate([border_offset_x_left, 
        border_offset_y, 
        border_offset_z_bottom])
    {
        rotate(a = -90, v=[1, 0, 0])
        {
            cylinder(h = 100, r1 = m3, r2 = m3, center = true, $fn=sections);
        }
    }
    
    // Screw-holes, left-top.
    translate([border_offset_x_left, 
        border_offset_y, 
        border_offset_z_top])
    {
        rotate(a = -90, v=[1, 0, 0])
        {
            cylinder(h = 100, 
                r1 = m3, 
                r2 = m3, 
                center = true, 
                $fn=sections);
        }
    }
    
    // Screw-holes, right-bottom.
    translate([border_offset_x_right, 
        border_offset_y, 
        border_offset_z_bottom])
    {
        rotate(a = -90, v=[1, 0, 0])
        {
            cylinder(h = 100, 
                r1 = m3, 
                r2 = m3, 
                center = true, 
                $fn=sections);
        }
    }
    
    // Screw-holes, right-top.
    translate([border_offset_x_right, 
        border_offset_y, 
        border_offset_z_top])
    {
        rotate(a = -90, v=[1, 0, 0])
        {
            cylinder(h = 100, 
                r1 = m3, 
                r2 = m3, 
                center = true, 
                $fn=sections);
        }
    }
    
    // Led opening, bottom-side.
    translate([20, 5, 0])
    {
        cube([35, 
            switch_depth + thickness + thickness - 5 - 5, 
            thickness], 
            center=false);
    }
    
    // PSU opening, bottom-side.
    translate([130, 
        (switch_depth + thickness + thickness) / 2, 
        0])
    {
        cylinder(h = 137, 
            r1 = 10, 
            r2 = 10, 
            center=true);
    }

    // Ventilation holes.
    for (z = [ventilation_spacing:ventilation_spacing:(switch_height + thickness - ventilation_spacing)])
    {
        for (y = [ventilation_spacing:ventilation_spacing:(switch_depth + thickness - thickness )])
        {
            translate([0, y, z])
            {
                rotate(a = 90, v=[0, 1, 0])
                {
                    cylinder(h = (switch_width + thickness + thickness),
                        r1 = ventilation_rad, 
                        r2 = ventilation_rad, 
                        center=false, 
                        $fn=sections);
                }
            }
        }
    }
}