module_width = 44;
module_height = 44;
motor_gap = 18;
overall_width = motor_gap + module_width + motor_gap;
overall_height = 150;
thickness = 4;
screw_rad = 2.5 / 2;
corner_width = 75;
corner_angle = 65;
module_hole_rad = 3.5 / 2;
module_hole_dist = 37;

module chamfer_text(text, font, h, ang) {
  d = h*tan(ang);
  minkowski(){
    linear_extrude(height=h*0.0001)
      offset(-d)
        text(text, font=font);
   
    rotate([90,0,0])
      linear_extrude(d) polygon(points=[[-d,0], [d,0],[0,d]]);
  }
}

difference()
{
    cube(size = [overall_width, overall_height, thickness], center = false);

    /*
     * Motor left.
     */
    translate([motor_gap, motor_gap, 0])
    {
        cylinder(h = thickness, r = screw_rad, center = false);
    }
    translate([motor_gap, motor_gap + motor_gap, 0])
    {
        cylinder(h = thickness, r = screw_rad, center = false);
    }
    
    /*
     * Motor right.
     */
    translate([overall_width - motor_gap, motor_gap, 0])
    {
        cylinder(h = thickness, r = screw_rad, center = false);
    }
    translate([overall_width - motor_gap, motor_gap + motor_gap, 0])
    {
        cylinder(h = thickness, r = screw_rad, center = false);
    }
    
    /*
     * Cut of left corner.
     */
    translate([0, 90, 0])
    {
        rotate(corner_angle)
        {
            cube(size = [corner_width, corner_width, thickness]);
        }
    }
    
    /*
     * Cut of right corner.
     */
    translate([overall_width, 90, 0])
    {
        rotate(90 - corner_angle)
        {
            cube(size = [corner_width, corner_width, thickness]);
        }
    }
    
    /* 
     * Mount hole front wheel.
     */
    translate([overall_width / 2, overall_height - motor_gap, 0])
    {
        cylinder(h = thickness, r = module_hole_rad, center = false);
    }
    
    /* 
     * Module mount holes.
     */
    x_offset = (overall_width / 2) - (module_hole_dist / 2);
    y_offset = (overall_height / 2) - (module_hole_dist / 2) + 5;
    translate([x_offset, y_offset, 0])
    {
        cylinder(h = thickness, r = module_hole_rad, center = false);
    } 
    
    translate([x_offset + module_hole_dist, y_offset, 0])
    {
        cylinder(h = thickness, r = module_hole_rad, center = false);
    } 
    
    translate([x_offset + module_hole_dist, y_offset + module_hole_dist, 0])
    {
        cylinder(h = thickness, r = module_hole_rad, center = false);
    } 
    
    translate([x_offset, y_offset + module_hole_dist, 0])
    {
        cylinder(h = thickness, r = module_hole_rad, center = false);
    } 
    
    translate([(overall_width - 7) / 2, 100, 0])
    {
        rotate(-90)
        {
            chamfer_text("rende.nl", "Liberation Sans:style=Bold", 2, 10);
        }
    }

}