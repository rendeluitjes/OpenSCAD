module rpi_camera() {
     color("darkblue")
	  difference() {
	  cube([24,25,1]);
	  translate([2,2,-1]) cylinder(d=2,h=3,$fn=8);
	  translate([2,23,-1]) cylinder(d=2,h=3,$fn=8);
	  translate([14.5,2,-1]) cylinder(d=2,h=3,$fn=8);
	  translate([14.5,23,-1]) cylinder(d=2,h=3,$fn=8);
     }
     color("DimGray") union() {
	  translate([10.25,8.5,1]) cube([8,8,3.25]);
	  translate([10.25+4,12.5,1+3.25]) cylinder(d=7.5,h=1,$fn=16);
	  translate([10.25+4,12.5,1+3.25+0.7]) cylinder(d=5.5,h=0.7,$fn=16);
     }
     color("orange") translate([1.75,8.625,1]) cube([8.5,7.75,1.5]);
     color("brown") translate([24-5.75,2.75,-2.75]) cube([4.5,19.5,2.75]);
     color("black") translate([22.75,2,-2.75]) cube([1.25,21,2.75]);
     color("grey") translate([24,4.25,-1]) cube([10,16.5,0.1]);
}
rpi_camera();