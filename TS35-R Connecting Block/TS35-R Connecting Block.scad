plug_diam = (15 / 2);
plug_diam_extra = 0.1;
plug_depth = 10;
connecting_block_width = 20;
connecting_block_height = 20;
connecting_block_depth = 20;
m3_diam = 3 / 2;
$fn = 100;

difference()
{
    union()
    {
        cube([connecting_block_width, connecting_block_depth, connecting_block_height]);

        translate([plug_depth, -plug_depth, connecting_block_height / 2])
        {
            difference()
            {
                rotate(a = [-90, 0, 0])
                {
                    cylinder(h = plug_depth, r = plug_diam + plug_diam_extra, center = false);
                    
                }
            }
        }
    }
    
    translate([connecting_block_width - plug_depth, connecting_block_depth / 2, connecting_block_height / 2])
    {
        rotate([0, 90, 0])
        {
            cylinder(h = plug_depth, r = plug_diam, center = false);
        }
    }
    
    translate([plug_depth, -plug_depth, connecting_block_height / 2])
    {    
        rotate(a = [-90, 0, 0])
        {
            cylinder(h = plug_depth + connecting_block_depth, r = m3_diam, center = false);
        }
    }
 
    translate([0, connecting_block_depth / 2, connecting_block_height / 2])
    {    
        rotate(a = [0, 90, 0])
        {
            cylinder(h = connecting_block_depth, r = m3_diam, center = false);
        }
    }
    
}
