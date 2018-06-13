thick = 4;
brodit_foot_width = 50;
brodit_foot_height = 42;
corner = 5.5;
hole_diam = 4;
bar_height = 35;
bar_width = 120;
overlap = 30;

translate([-(bar_width/2),-(bar_height/2),0])
{
    cube(size=[bar_width,bar_height,thick/2]);
    
}

translate([-((bar_width/2)-overlap),-(bar_height/2),thick/2])
{
    cube(size=[bar_width-(2*overlap),bar_height,thick/2]);
    
}