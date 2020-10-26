include <pi_cam.scad>;

difference()
{
    cube([28.5, 30, 10]);
    
    translate([2, 28, 10])
    {
        rotate([180, 0, 0])
        {
            pi_cam();
        }
    }

}
