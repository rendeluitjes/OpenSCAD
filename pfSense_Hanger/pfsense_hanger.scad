thickness = 2;
pfsense_width = 50;
pfsense_depth = 171;
pfsense_height = 31;
extra_width = 25;
extra_depth = 25;
gap = extra_depth / 2;
m3_rad = 3 / 2;
segments = 20;
air_space = 10;

// Flat space.
difference()
{
    cube([extra_width + pfsense_width,
          extra_depth + pfsense_depth + extra_depth,
          thickness]);
     
    // Screw hole left under.
    translate([gap, gap, 0])
    {
        cylinder(h = thickness, r = m3_rad, $fn = segments);
    }
     
    // Screw hole right under.
    translate([extra_width + pfsense_width - gap, gap, 0])
    {
        cylinder(h = thickness, r = m3_rad, $fn = segments);
    }
     
    // Screw hole left top.
    translate([gap, extra_depth + pfsense_depth + extra_depth - gap, 0])
    {
        cylinder(h = thickness, r = m3_rad, $fn = segments);
    }
     
    // Screw hole right top.
    translate([extra_width + pfsense_width - gap, extra_depth + pfsense_depth + extra_depth - gap, 0])
    {
        cylinder(h = thickness, r = m3_rad, $fn = segments);
    }
        
    // Screw hole center top.
    translate([extra_width + pfsense_width - gap, (extra_depth + pfsense_depth + extra_depth) / 2, 0])
    {
        cylinder(h = thickness, r = m3_rad, $fn = segments);
    }
}
      
// Bucket.
translate([0, extra_depth - thickness, thickness])
{
    difference()
    {
        cube([thickness + pfsense_width, 
            thickness + pfsense_depth + thickness, 
            pfsense_height + thickness]);
        
        // Air opening bottom.
        translate([0, air_space, air_space])
        {
            cube([thickness, pfsense_depth - air_space - air_space, pfsense_height - air_space - air_space]);
        }
        
        translate([thickness, thickness, 0])
        {
            cube([pfsense_width, pfsense_depth, pfsense_height]);
        }
    }
}
    
