unit = 20;
extend = 10;
thickness = 3;

linear_extrude(height = unit, center = false, convexity = 10, twist = 0)
{
    translate([0, 0, 0])
    {
        polygon(points = [
            [-(unit+extend), 0],
            [-(unit+extend), unit],
            [-extend, unit],
            [-extend, unit+thickness],
            [-(unit+extend)-thickness, unit+thickness],
            [-(unit+extend)-thickness, 0],
            [ (unit+extend)+thickness, 0],
            [ (unit+extend)+thickness, -(unit+extend)-thickness],
            [ extend, -(unit+extend)-thickness],
            [ extend, -(unit+extend)],
            [ (unit+extend), -(unit+extend)],
            [ (unit+extend), -thickness],
            [ -(unit+extend)-thickness, -thickness],
            [ -(unit+extend)-thickness, 0]
        ]);
    }
}