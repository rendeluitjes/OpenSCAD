dim = 100;
thickness = 0.5;
ridge = 2;

difference()
{
    cube([dim, dim, thickness]);
    translate([ridge, ridge, 0])
    {
        cube([dim - ridge - ridge, dim - ridge - ridge, thickness]);
    }
}