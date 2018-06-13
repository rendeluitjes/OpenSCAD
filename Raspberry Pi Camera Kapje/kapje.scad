camera_width = 30.3;
camera_depth = 10.3;
camera_height = 8;
camera_height_extra = 9;

thickness = 2;

difference()
{
    translate([0, 0, 0])
        cube(size = [thickness + camera_width + thickness,
                     thickness + camera_depth + thickness,
                     thickness + camera_height]);
            
    translate([thickness, thickness, thickness])
        cube(size = [camera_width, camera_depth,                    camera_height]);
            
}

translate([0, 0, thickness + camera_height])
    cube(size = [thickness + camera_width + thickness,
            thickness,
            camera_height_extra]);