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
    ttf "timrom.ttf" "Tentakel Schach"
    0.2, 0.1*y - (0.1 * clock)
    finish { reflection .25 specular 1 }
    texture{
        pigment{ color rgb <1,0.70,0> } 
        normal { bumps 0.8 scale 0.005 }
        finish { phong 0.1 specular 1 reflection 0.25 }
    }
    translate -3*x
}