switch_width = 155;
switch_depth = 30;
switch_height = 76;
thickness = 2;
m3 = 4 / 2;
border = 10;
ventilation_rad = 2;
ventilation_spacing = 5;
holding_height = 36;
lid_height = 150;

difference()
{
    cube([switch_width + thickness + thickness, switch_depth + thickness + thickness, lid_height + thickness], center=false);
    
    // Make it hallow.
    translate([thickness, thickness, thickness])
    {
        cube([switch_width, switch_depth, switch_height], center=false);
    }
    
    // Frontal cut-out.
    translate([0, 0, holding_height + thickness])
    {
        cube([switch_width + thickness + thickness, switch_depth + thickness, lid_height], center=false);
    }
    
    // Screw-holes, left.
    translate([border, 0, lid_height - border], center=false)
    {
        rotate(a = -90, v=[1, 0, 0])
        {
            cylinder(h = 100, r1 = m3, r2 = m3, center = true);
        }
    }
    
    // Screw-holes, right.
    translate([lid_height + thickness + thickness - border, 0, lid_height - border], center=false)
    {
        rotate(a = -90, v=[1, 0, 0])
        {
            cylinder(h = 100, r1 = m3, r2 = m3, center = true);
        }
    }
    
    // Screw-holes, midst.
    translate([(lid_height + thickness + thickness ) / 2, 0, lid_height - border], center=false)
    {
        rotate(a = -90, v=[1, 0, 0])
        {
            cylinder(h = 100, r1 = m3, r2 = m3, center=true);
        }
    }
    
    // Led opening, bottom-side.
    translate([20, 5, 0], center=false)
    {
        cube([35, switch_depth + thickness + thickness - 5 - 5, thickness], center=false);
    }
    
    // PSU opening, bottom-side.
    translate([130, (switch_depth + thickness + thickness) / 2, 0], center=false)
    {
        cylinder(h = 137, r1 = 10, r2 = 10, center=true);
    }

    // Ventilation holes.
    for (z = [ventilation_spacing:ventilation_spacing:(switch_height + thickness - ventilation_spacing)])
    {
        for (y = [ventilation_spacing:ventilation_spacing:(switch_depth + thickness - thickness )])
        {
            translate([0, y, z], center=true)
            {
                rotate(a = 90, v=[0, 1, 0])
                {
                    cylinder(h = (switch_width + thickness + thickness), r1 = ventilation_rad, r2 = ventilation_rad, center=false);
                }
            }
        }
    }
}