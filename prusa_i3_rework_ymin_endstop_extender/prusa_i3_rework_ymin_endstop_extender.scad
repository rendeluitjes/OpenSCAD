height = 60;
inner_width = 4.5;
inner_height = 1.5;
outer_width = 6.5;
outer_height = 4;
start_cut_at = 45;

difference()
{
    cube([outer_width, outer_height, height]); 
    translate([(outer_width - inner_width) / 2, (outer_height - inner_height) / 2, 0])
    {
        cube([inner_width, inner_height, height]);
    }
    
    // Cut
    translate([0, outer_height, start_cut_at])
    {
        rotate(a = [15, 0, 0])
        {
            cube([outer_width, outer_height, height]);
        }
    }
}