include <cubeX.scad>

tile_dim = 15;
tile_depth = 2;

ridge_depth = 4.18;
ridge_width = 3;

// Tile face
translate([-(tile_dim / 2), -(tile_dim / 2)])
    cube(size = [tile_dim, , tile_dim, tile_depth]);
    
translate([-(tile_dim / 2), -(ridge_width /2), tile_depth])
    cube(size = [tile_dim, ridge_width, ridge_depth]);
    



