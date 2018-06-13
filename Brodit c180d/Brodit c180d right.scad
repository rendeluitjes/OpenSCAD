thick = 4;
brodit_foot_width = 50;
brodit_foot_height = 42;
corner = 5.5;
hole_diam = 4;
bar_height = 35;
bar_width = 100;
overlap = 30;
lip_width = 20;
lip_height = bar_height + 40;
x_shift = 10;
y_shift = -10;
knob = 10;
knob_height = 15;
hook_width = 10;
hook_height = 20;

translate([-x_shift, -y_shift, 0])
{
    translate([-(bar_width/2),-(bar_height/2),0])
    {
        cube(size=[bar_width,bar_height,thick/2]);
        
    }
    
    // Horizontale onderkant.
    translate([-((bar_width/2)-overlap),-(bar_height/2),thick/2])
    {
        cube(size=[bar_width-overlap,bar_height,thick/2]);
    }
        
    // Verticaal stuk.
    translate([bar_width/2, (bar_height/2) - lip_height, 0])
    {
        cube(size=[lip_width,lip_height,thick]);
    }
    
    // Drukpunt.
    translate([(bar_width/2)-10, 0, thick])
    {
        cylinder(knob_height, 
            r1 = 5, 
            r2 = 5);
    }

}

// Haak.
translate([45,-67, 0])
{
    cube(size=[15,5,thick]);
    
    translate([10,5,0])
    {
        cube(size=[5,15,thick]);
    }

}
