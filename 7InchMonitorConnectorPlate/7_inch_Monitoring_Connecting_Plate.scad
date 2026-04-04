thickness = 2;
margin = 7;
$fn = 100;

hor_gap = 107;
ver_gap = 52;
m4_rad = 4/2;

difference()
{
    cube([margin + hor_gap + margin, margin + ver_gap + margin, thickness]);
    
    translate([margin, margin, 0])
    {
        cylinder(h = thickness, r = m4_rad);
    }
    
    translate([margin, margin + ver_gap, 0])
    {
        cylinder(h = thickness, r = m4_rad);
    }
    
    translate([margin + hor_gap, margin, 0])
    {
        cylinder(h = thickness, r = m4_rad);
    }
    
    translate([margin + hor_gap, margin + ver_gap, 0])
    {
        cylinder(h = thickness, r = m4_rad);
    }
}