naast_elkaar = 6;
achter_elkaar = 10;
thickness = 15;
usb_width = 13;
usb_depth = 5;
usb_height = 13;
x_spacing = 8;
y_spacing = 15;
border_spacing = 10;

total_width = border_spacing + naast_elkaar * (x_spacing + usb_width);
total_depth = border_spacing + achter_elkaar * (y_spacing + usb_depth);

difference()
{
    cube([total_width, total_depth, thickness]);
    
    for (y = [0 : achter_elkaar - 1])
    {
        for (x = [0 : naast_elkaar - 1])
        {
            translate([
                border_spacing + x * (usb_width + x_spacing), 
                border_spacing + y * (usb_depth + y_spacing), 
                thickness - usb_height])
            {
                echo(x, y);
                cube([usb_width, usb_depth, usb_height]);
            }
        }
    }
    
}

