card_width = 188;
card_height = 84;
thickness = 4;
total_width = card_width + thickness + thickness;
total_depth = 140;
total_height = card_height + thickness + thickness;
pi_camera_height = 25;
pi_camera_width = 24;
pi_camera_square = 10;

module rpi_camera() 
{
    difference()
    {
	  cube([24,25,1]);
	  translate([2,2,-1]) 
          cylinder(d=2,h=3,$fn=100);
	  translate([2,23,-1]) 
          cylinder(d=2,h=3,$fn=100);
	  translate([14.5,2,-1]) 
          cylinder(d=2,h=3,$fn=100);
	  translate([14.5,23,-1]) 
          cylinder(d=2,h=3,$fn=100);
    }
    
    union()
    {
	    translate([10.25,8.5,1])
            cube([8,8,3.25]);
	    translate([10.25+4,12.5,1+3.25])
            cylinder(d=7.5,h=1,$fn=100);
	    translate([10.25+4,12.5,1+3.25+0.7])
            cylinder(d=5.5,h=0.7,$fn=100);
    }
    
    translate([1.75,8.625,1]) 
        cube([8.5,7.75,1.5]);
    translate([24-5.75,2.75,-2.75]) 
        cube([4.5,19.5,2.75]);
    translate([22.75,2,-2.75]) 
        cube([1.25,21,2.75]);
    translate([24,4.25,-1]) 
        cube([10,16.5,0.1]);

}

difference()
{
    cube([total_width, total_depth, total_height], center = false);

    translate([thickness, thickness, thickness])
    {
        cube([card_width, total_depth - thickness - thickness, card_height + thickness], center = false);
    }
    
    thickness_half = thickness / 2;
    translate([thickness_half, thickness_half, thickness_half])
    {
        cube([card_width + thickness_half + thickness_half, 2, total_height], center = false);
    }
    
    offset_x = (total_width - pi_camera_width) / 2;
    offset_z = (total_height - pi_camera_height) / 2;
    translate([offset_x - 2, total_depth, offset_z])
    {
        rotate([90, 0, 0])
        {
            rpi_camera();
        }
    }
    
}

// Left mirror.
mirror_height = total_height - thickness;
mirror_width = (card_width - pi_camera_square) / 2;
mirror_depth = total_depth - thickness - thickness;
translate([thickness, thickness, thickness])
{
    left_mirror_points = [ [0, 0], [mirror_width, mirror_depth], [0, mirror_depth], [0, 0]];
    linear_extrude(height = mirror_height)
    {
        polygon(left_mirror_points);
    }
    
}

translate([(total_width - thickness + thickness + pi_camera_square) / 2, thickness, thickness])
{
    right_mirror_points = [ [mirror_width, 0], [mirror_width, mirror_depth], [0, mirror_depth], [mirror_width, 0]];
    linear_extrude(height = mirror_height, center = false, convexity = 10)
    {
        polygon(right_mirror_points, 10);
    }
}
