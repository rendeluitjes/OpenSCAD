total_width = 180;
total_depth = 180;
total_height = 55;
border = 10;

difference()
{
    cube([total_width, total_depth, total_height]);
    translate([border, border, 0])
    {
        cube([(total_width / 2) - border - border, 
              (total_depth / 2) - border - border,
              total_height]);
    }
    translate([border, border + (total_width / 2), 0])
    {
        cube([(total_width / 2) - border - border, 
              (total_depth / 2) - border - border,
              total_height]);
    }
    translate([border + (total_width / 2),
               border, 0])
    {
        cube([(total_width / 2) - border - border, 
              (total_depth / 2) - border - border,
              total_height]);
    }
    translate([border + (total_width / 2),
               border + (total_depth / 2), 0])
    {
        cube([(total_width / 2) - border - border, 
              (total_depth / 2) - border - border,
              total_height]);
    }
}