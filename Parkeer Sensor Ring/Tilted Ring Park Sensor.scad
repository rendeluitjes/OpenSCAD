diam=22;
height=8;
rim=1;
tilt=10;

difference()
{
    translate([0, 0, 0])
      difference() {
        cylinder(h = height, r = diam/2);
        translate([0, 0, -1])
            cylinder(h = height+height, 
                r = (diam/2)-rim);
      }
  
    translate([-(diam+rim), -(diam+rim), height])
      {
        rotate([0, tilt, 0])
        cube([diam+diam,
             diam+diam,
             height]);
      }
  }