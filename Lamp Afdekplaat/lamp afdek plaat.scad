buiten_radius = 145 / 2;
binnen_radius = 105 / 2;
hobbel_hoogte = 26;
plaat_dikte = 1;
kabelgat_radius = 10 / 2;
ophanggat_radius = 6 / 2;
kabelgat_afstand = 26;
ophanggat_afstand = 41;
beugelgat_radius = 2;

difference()
{
    // Dekplaat.
    union()
    {
        cylinder(h = plaat_dikte, r = buiten_radius);
        cylinder(h = hobbel_hoogte, r = binnen_radius);
    }
    cylinder(h = hobbel_hoogte - plaat_dikte, r = binnen_radius - plaat_dikte);
    
    // Kabelgat links.
    cylinder(h = hobbel_hoogte, r = kabelgat_radius);
    
    // Kabelgat midden.
    translate([-kabelgat_afstand, 0, 0])
    {
        cylinder(h = hobbel_hoogte, r = kabelgat_radius);
    }
    
    // Kabelgat rechts.
    translate([kabelgat_afstand, 0, 0])
    {
        cylinder(h = hobbel_hoogte, r = kabelgat_radius);
    }
    
    // Ophanggat links.
    translate([-ophanggat_afstand, 0, 0])
    {
        cylinder(h = hobbel_hoogte, r = ophanggat_radius);
    }
    
    // Ophanggat_rechts.
    translate([ophanggat_afstand, 0, 0])
    {
        cylinder(h = hobbel_hoogte, r = ophanggat_radius);
    }
    
    // Schroefgaten ophang beugel.
    translate([0, 0, hobbel_hoogte / 2])
    {
        rotate([-90, 0, 0])
        {
            cylinder(h = buiten_radius, r = beugelgat_radius);
        }
        rotate([90, 0, 0])
        {
            cylinder(h = buiten_radius, r = beugelgat_radius);
        }
    }
    
    
    
}