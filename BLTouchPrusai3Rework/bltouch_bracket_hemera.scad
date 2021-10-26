thickness = 4;
height = 44;
width = 25;
leg = 10;
m3_rad = 3 / 2;
m4_rad = 4 / 2;

$fn=100;

X=11.54; //Base section X
Y=8;  //Base section Y
M3=2.7;  //Mounting hole
M4=3.8;
OFF=18;  //Distance between mounting holes
BOSS=4;  //Base section rounded ends

module oval()
{
    difference()
    {
        union() 
        {
            hull() 
            {
              color("lime") translate([0,-OFF/2,0]) cylinder(r=BOSS,h=thickness);
              color("gray") translate([0,OFF/2,0]) cylinder(r=BOSS,h=thickness);
              color("green") translate([-X/2,-Y/2,0]) cube([X,Y,thickness]);
            }
        }
        color("purple") translate([0,-OFF/2,0]) cylinder(d=M3,h=thickness);
        color("cyan") translate([0,OFF/2,0]) cylinder(d=M3,h=thickness);
        color("blue") translate([0,0,0]) cylinder(d=M4,h=thickness);
    }

} 
            
difference()
{
    cube(size = [width, height, thickness], center = false);
    
    translate([0, leg, 0])
    {
        cube(size = [width - leg, height - leg - leg, thickness], center = false);
    }
    
    translate([leg / 2, leg / 2, 0])
    {
        cylinder(thickness, r = m3_rad, center = false);
    }

    translate([leg / 2, height - (leg / 2), 0])
    {
        cylinder(thickness, r = m3_rad, center = false);
    }


}

translate([width - (leg / 2), 30, thickness+thickness+1.5])
{
    rotate([90, 90, 0])
    {
        oval();

    }
}

//oval();
