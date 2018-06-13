top_width = 17.4;
top_depth = 13;
top_height = 7;
wall_thickness = 0.8;
bottom_width= 16.4;
bottom_depth = 12.6;
bottom_height = 15;

ridge = 0.5;

difference()
{
    union()
    {
        cube([bottom_width,bottom_depth,bottom_height]);
        
        translate([-((top_width-bottom_width)/2), -((top_depth-bottom_depth)/2),bottom_height])
            cube([top_width,top_depth,top_height]);
        
        translate([(-((top_width-bottom_width)/2))-ridge,-ridge,bottom_height-ridge])
            cube([top_width+ridge+ridge,top_depth+ridge+ridge,ridge]);
            
    }
    
    translate([wall_thickness,wall_thickness,0])
        cube([bottom_width-wall_thickness-wall_thickness, top_depth-wall_thickness-wall_thickness, top_height+bottom_height]);

}