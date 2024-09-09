width = 34;
height = 32;
depth = 7;
inner_width = 32;
inner_height = 40;
inner_depth = 5;
thickness = 1;
mini_thickness = 0.5;
slit_1_width = 8;
slit_2_width = 15;
slit_3_width = 8;
slee_width = 1.5;
lower_gap = 5;

module peg(x, y, z)
{
    peg_width = 6;
    peg_height = 5;
    peg_bar_height = 2;
    peg_bar_leg = 2;
    peg_thickness = 2.5;
    
    // Potision T add-on in right position.
    translate([
        x - (peg_width / 2), 
        y - (peg_bar_height + peg_bar_leg), 
        z - (peg_bar_height / 2)])
    {
        difference()
        {
            // Corpus.
            cube([
                peg_width, 
                peg_bar_height + peg_bar_leg, 
                peg_thickness]);
            
            // Left-under T cut-out.
            translate([0, peg_bar_height, 0])
            {
                cube([
                    peg_bar_height, 
                    peg_bar_leg, 
                    peg_thickness]);
            }
           
            // Right-under T cut-out.
            translate([
                peg_width-peg_bar_height, 
                peg_bar_height, 
                0])
            {
                cube([
                    peg_bar_height, 
                    peg_bar_leg, 
                    peg_thickness]);
            }
        }
    }
}



translate([0, 0, 0])
{
    difference()
    {
        // Corpus.
        cube([width, depth, height]);
        
        // Schuifsleuf.
        translate([(width - slee_width) / 2, depth - thickness, 15])
        {
            cube([slee_width, thickness, height]);
        }
        
        // Inkeping 1.
        translate([thickness, thickness, thickness])
        {
            cube([slit_1_width, inner_depth, inner_height]);
        }
        
        // Inkeping 2.
        translate([thickness + slit_1_width + mini_thickness, 
            thickness, thickness])
        {
            cube([slit_2_width, inner_depth, inner_height]);
        }
        
        // Inkeping 3.
        translate([thickness + slit_1_width + mini_thickness + slit_2_width + mini_thickness, thickness, thickness])
        {
            cube([slit_3_width, inner_depth, inner_height]);
        }
        
        // Empty topside.
        translate([
            thickness,
            thickness, 
            height - lower_gap])
        {
            cube([
                width - thickness - thickness,
                depth - thickness - thickness,
                lower_gap]);
        }
    }
}

peg_dist = 7;
peg(peg_dist - 1, 0, peg_dist / 2);
peg(peg_dist - 1, 0, height - (peg_dist / 2));
peg(width - peg_dist + 1, 0, peg_dist / 2);
peg(width - peg_dist + 1, 0, height - (peg_dist / 2));

