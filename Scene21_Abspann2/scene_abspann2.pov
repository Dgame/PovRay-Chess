#include "colors.inc"
#include "includes/chess.inc"
#include "includes/usings.inc"
#include "includes/pieces.inc"

background { color White }

light_source {
   <10, 100, -100>
   color White
}

light_source {
   <10, 100, 100>
   color White
}

global_settings { ambient_light <1, 1, 1> * 1 }

camera {
   location <100, 100, -120>
   look_at  <0, 0, 0>
}


#if (clock < 0.3)
#declare A = clock * -5;
#declare B = clock * 4;
#declare C = clock * -9;
#declare D = clock * 7;
#else
#declare A = clock * -4;
#declare B = clock * 2;
#declare C = clock * -8;
#declare D = clock * 3;
#end

#declare Tentakel = union {
#declare R = 5;
#declare r = 1;
#declare L = 10;
#declare P = 1;

#declare points = 7;
#declare pt = 0;

    sphere_sweep {
        b_spline points + 1
        <0, 0, 0>, 1
#while (pt < points)
        <R * cos(pt * P + 5 * A) + 5 * R * cos(pt * P * 0.1 * B), pt * L, R * sin(pt * P + 5 * C) + 5 * R * sin(pt * P * 0.1 * D)>, r 
#declare r = r + 0.2;
#declare pt = pt + 1;
#end
    }

    pigment { color Black }
    finish { ambient 0.5 phong 0.7 phong_size 20 reflection { 0.0 } }
}


#declare Viech = merge {
    // Right
    object {
        Tentakel
        rotate 90 * z
        translate <62, -20, 1>
    }

    object {
        Tentakel
        rotate 75 * z
        translate <58, -35, 1>
    }

    sphere {
        <0, 0, 5 + (5 * clock)>, 20
        texture {
            pigment {
                image_map {
                    png
                    "Scene21_Abspann2/Peter.png"
                    map_type 1
                    interpolate 2
                }
                rotate -80 * y
            }
        }
    }

    // Left
    object {
        Tentakel
        rotate -115 * z
        translate <-50, 40, 1>
    }

    object {
        Tentakel
        rotate -95 * z
        translate <-60, 25, 1>
    }
}

#declare trans_y = -20 + (clock * 100);
#if (trans_y > 70)
#declare trans_y = 70;
#end

object {
    Viech
    translate <0, trans_y, 0>
    rotate -50 * y
}
object { Ground }
object { Table }
object { ChessBoard }
object { Pieces }