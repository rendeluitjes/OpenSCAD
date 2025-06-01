outer_width = 27;
outer_depth = 8.5;
outer_height = 14;

offset_width = 1;
offset_depth = 1;
offset_height = 1;

inner_width = outer_width - offset_width - offset_width;
inner_depth = outer_depth - offset_depth - offset_depth;
inner_height = outer_height - offset_height;

difference()
{
    cube([outer_width, outer_depth, outer_height]);
    
    translate([offset_width, offset_depth, offset_height])
    {
        cube([inner_width, inner_depth, inner_height]);
    }
}
    
    