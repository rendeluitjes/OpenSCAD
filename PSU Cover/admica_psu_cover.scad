// Cover for 12V DC 30A 360W Regulated Switching Power Supply
// Dimension: (215 x 115 x 50)mm / (8.46 x 4.52 x 1.96)inches

$fn=42;
length=115-6;
width=19.5;
height=50-9.5;
hole_d=8.25;
hole_spacing=10;
access_hole_d=6.5;
mount_hole_d=3;

module block()
//big block chevy
{
    difference()
    {
        cube([length,width,height]);
        translate([length*.04, width*.1, height]) cube([length-length*.08,width,height]);
    }
}

module wire_holes()
//holes for wires and perhaps terminal clips/sockets/adapters
//depending on what you have at the end of your wires, i use prongs
{
    #translate([length*.08, width+1, height*.8]) rotate([90,0,0]) cylinder(h=width+2, r=hole_d/2);
    #translate([length*.17, width+1, height*.8]) rotate([90,0,0]) cylinder(h=width+2, r=hole_d/2);
    #translate([length*.26, width+1, height*.8]) rotate([90,0,0]) cylinder(h=width+2, r=hole_d/2);
    #translate([length*.35, width+1, height*.8]) rotate([90,0,0]) cylinder(h=width+2, r=hole_d/2);
    #translate([length*.44, width+1, height*.8]) rotate([90,0,0]) cylinder(h=width+2, r=hole_d/2);
    #translate([length*.53, width+1, height*.8]) rotate([90,0,0]) cylinder(h=width+2, r=hole_d/2);
    #translate([length*.62, width+1, height*.8]) rotate([90,0,0]) cylinder(h=width+2, r=hole_d/2);
    #translate([length*.71, width+1, height*.8]) rotate([90,0,0]) cylinder(h=width+2, r=hole_d/2);
    #translate([length*.80, width+1, height*.8]) rotate([90,0,0]) cylinder(h=width+2, r=hole_d/2);
}

module access_holes()
//holes at the top allow you to access the terminals
//with a screwdriver without removing the cover
{
    #translate([length*.08, width*.5, -1]) cylinder(h=width+2, r=access_hole_d/2);
    #translate([length*.17, width*.5, -1]) cylinder(h=width+2, r=access_hole_d/2);
    #translate([length*.26, width*.5, -1]) cylinder(h=width+2, r=access_hole_d/2);
    #translate([length*.35, width*.5, -1]) cylinder(h=width+2, r=access_hole_d/2);
    #translate([length*.44, width*.5, -1]) cylinder(h=width+2, r=access_hole_d/2);
    #translate([length*.53, width*.5, -1]) cylinder(h=width+2, r=access_hole_d/2);
    #translate([length*.62, width*.5, -1]) cylinder(h=width+2, r=access_hole_d/2);
    #translate([length*.71, width*.5, -1]) cylinder(h=width+2, r=access_hole_d/2);
    #translate([length*.80, width*.5, -1]) cylinder(h=width+2, r=access_hole_d/2);
}

module led_hole()
//big rounded square for easy viewing of the power led from wide angles
{
    translate([length*.862, width+1, height*.75]) minkowski()
    {
        cube([hole_d*1.438, width+1, hole_d*.93]);
        rotate([90,0,0]) cylinder(h=55,r=1.2);
    }
}

module mount_holes()
//optional, could just use wood screws and make your own holes for mounting
{
    translate([-1,width*.4,height*.4]) rotate([0,90,0]) cylinder(h=length+2, r=mount_hole_d/2);
    translate([-1,width*.4,height*.6]) rotate([0,90,0]) cylinder(h=length+2, r=mount_hole_d/2);
}

module circles()
//curved lip along the bottom makes for easy install and it's pretty too...
{
    translate([-1,width*.9,height+width*.5]) rotate([0,90,0]) cylinder(h=length+2, r=width*.8);
}

module extras()
//leaves some extra material along the edges for strength
{
    translate([length*.018,height*.055,height*.1]) cube([length-length*0.036,width,height]);
    translate([length*.04,width*.4, height*.05]) cube([length-length*0.08,width,height*.1]);
}

module beef()
//thicken up some areas
{
	difference()
	{
		translate([length*.95, width*.1, height*.33]) cube([length*.035, width*.45, height*.33]);
		translate([length*.94, width*.2, height*.2]) rotate([0,0,65]) cube([length*.1, width*.5, height*.6]);
	}
}

module cover()
//the basic cover with wire/access holes
{
    difference()
    {
        block();
        wire_holes();
        access_holes();
        led_hole();
        circles();
        extras();
    }
}

module cover_beefy()
//add material to minimize warping and for mounting screw holes
{
	cover();
	beef();
	translate([length*.5,0,0-height*.2236]) scale([.5,1,1]) beef();

	#scale([.6,1,1]) translate([length, 0, ]) mirror([1,0,0]) beef();
	#scale([.6,1,1]) translate([length, 0, 0-height*.25]) mirror([1,0,0]) beef();
}

module grill()
{
	union()
	{
		//horizontal bars
		translate([length*.848, 0, height*.76]) cube([hole_d*1.925, 1.75, .8]);
		translate([length*.848, 0, height*.835]) cube([hole_d*1.925, 1.75, .8]);
		translate([length*.848, 0, height*.91]) cube([hole_d*1.925, 1.75, .8]);

		//vertical bars
		//translate([length*.875, 0, height*.7]) cube([.8, 1.75, hole_d*1.7]);
		//translate([length*.9125, 0, height*.7]) cube([.8, 1.75, hole_d*1.7]);
		//translate([length*.95, 0, height*.7]) cube([.8, 1.75, hole_d*1.7]);
	}
}

module printable()
//make mounting holes go all the way through
{
	grill();
	difference()
	{
		cover_beefy();
		mount_holes();
	}
}

//rotated and centered
translate([0-length/2,height/2,0]) rotate([90,0,0]) printable();
