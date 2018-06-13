height = 51;
inner_diam = 8;
outer_diam = 11.8;

difference()
{
    translate([0, 0, height/2])
        cylinder(h=height, r1=outer_diam, r2=outer_diam, center=true);
    
    translate([0, 0, height/2])
        cylinder(h=height, r1=inner_diam, r2=inner_diam, center=true);
    
    translate([0, -outer_diam, 0])
        cube(size = [2*outer_diam, 2*outer_diam, height], center=false);
    
    
}