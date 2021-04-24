$fn=100;
plate_thickness = 1.5;
length = 100;
width = 15;

module clip(height)
{

    difference()
    {
        union()
        {
            difference()
            {
                cube([width, width, height]);
                translate([plate_thickness, plate_thickness, 0])
                {
                    cube([width - plate_thickness - plate_thickness, width - plate_thickness - plate_thickness, height]);
                
                }
                
            }
       
            hull()
            {
                translate([(width / 2) - 0.8, 0, 0])
                {
                    cylinder(h = height, r = 0.5);
                }
                translate([(width / 2) - (2.6/2), -2,0])
                {
                    cylinder(h = height, r = 0.6);
                }
            }
            
            hull()
            {
                translate([(width / 2) + 0.8, 0, 0])
                {
                    cylinder(h = height, r=0.5);
                }
                translate([(width / 2) + (2.6 / 2), -2, 0])
                {
                    cylinder(h = height, r = 0.6);
                }
            } 
        } 
        translate([width / 2,0.3,0])
        {
            cylinder(h = height + 1, r = 0.6);
        }
    }
}

clip(100);
//translate([20, 0, 0])
//{
//    clip(150);
//}
//translate([40, 0, 0])
//{
//    clip(200);
//}

