global_settings { charset utf8 }

#include "colors.inc"

camera {
    location <-5,.15,-2>
    look_at <.3,.2,1>
    angle 45
}

light_source { <500, 500, -1000> White }

plane {
    y,0
    pigment { checker Black White }
}

text {
    ttf "arial.ttf", "M. Patzwahl",
    0.2 , 0
    texture{
        pigment { color rgb <1, 0.65, 0> }
        normal  { bumps 0.5 scale 0.005 }
        finish  { diffuse 0.8 specular 1 }
    }
    scale <1, 1, 1> * 0.75
    translate <-2, -0.7 + (clock * 3), -0.0>
    rotate <clock * 75, clock * 85, 0>
}

text {
    ttf "arial.ttf", "R. Schütt",
    0.2 , 0
    texture{
        pigment { color rgb <1, 0.65, 0> }
        normal  { bumps 0.5 scale 0.005 }
        finish  { diffuse 0.8 specular 1 }
    }
    scale <1, 1, 1> * 0.75
    translate <-2.5, -0.3 + (clock * 5.5), -0.0>
    rotate <clock * 75, clock * 115, 0>
}