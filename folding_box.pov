global_settings { assumed_gamma 2.2 }

#include "shapes.inc"
#include "textures.inc"
#include "metals.inc"
#include "woods.inc"
#include "colors.inc"

#declare JUMP_START  = 0.5;
#declare JUMP_HEIGHT = 7;
#if (clock < JUMP_START)
   #declare CAM_Y = 100.00;
#else
   #declare CAM_Y = 100.00 + JUMP_HEIGHT * 0.5 * (1 - cos(4 * pi * (clock - JUMP_START)));
#end

camera {
    angle 38
    location <200, CAM_Y, -55>
    direction <2, 2, 2>
    up <0, 1, 0>
    right x * 2
    look_at <-3, 3, 5>
    rotate<0, -360 * (clock + 0.000001), 0>
}

light_source {
    <800, 600, -200>
    colour White
}

#declare Ground = plane {
    y, -80
    pigment { blue 0.65 }
    finish {
        ambient 0.25
        diffuse 0.5
    }
}

/* Table */
#declare Table = union {
   intersection {
      plane { +y, -3 }
      plane { -y,  8 }
      sphere { <0, -5.5, 0>, 55 }
   }

   intersection {
      plane { y, -8 }
      object {
         Hyperboloid_Y
         scale <10, 20, 10>
         translate -20 * y
      }
   }

   pigment {
      granite
      scale 6
   }
   finish {
      specular 1
      roughness 0.02
      reflection 0.3
   }
}

#declare FramePiece = intersection {
    plane { +y, -0.15 }
    plane { -y, 3 }
    plane { -z, 35 }
    plane { <-1, 0, 1>, 0 }
    plane { < 1, 0, 1>, 0 }
}

#declare Frame = union {
    union {
        object { FramePiece }
        object {
            FramePiece
            rotate 180*y
        }
        texture {
            T_Wood20
            scale 2
            rotate y*87
            translate x*1
            finish {
                specular 1
                roughness 0.02
                ambient 0.35
            }
        }
    }

    union {
        object {
            FramePiece
            rotate -90*y
        }
        object {
            FramePiece
            rotate  90*y
        }
        texture {
            T_Wood20
            scale 2
            rotate y*2
            finish {
                specular 1
                roughness 0.02
                ambient 0.35
            }
        }
    }
}

// -------------------- dimensions
#declare D = 0.00001;
#declare S = 1;

#declare Board = box {
    <-32, -D, -32> <32, D, 32>
    texture {
       tiles {
           texture {
               pigment {
                   wrinkles
                   turbulence 1.0
                   colour_map {
                       [0.0 0.7 colour White
                              colour White]
                       [0.7 0.9 colour White
                              colour red 0.8 green 0.8 blue 0.8]
                       [0.9 1.0 colour red 0.8 green 0.8 blue 0.8
                              colour red 0.5 green 0.5 blue 0.5]
                   }
                   scale <0.6, 1, 0.6>
                   rotate -30*y
               }
               finish {
                   specular 1
                   roughness 0.02
                   reflection 0.25
               }
           }
           tile2
           texture {
               pigment {
                   granite
                   scale <0.3, 1, 0.3>
                   colour_map {
                       [0 1 colour Black
                       colour red 0.5 green 0.5 blue 0.5]
                   }
               }
               finish {
                   specular 1
                   roughness 0.02
                   reflection 0.25
               }
            }
        }
        scale <8, 1, 8>
    }
}

#declare ChessBoard = union {
	object { Board }
	object { Frame }
}

#declare Fold_Angle = 80 - 90 * clock;

//---------------------------------
object { Ground }
object { Table }
object {
	ChessBoard
    translate<-S,0,0>
	rotate<0,0,Fold_Angle>
} //------------------
object {
	ChessBoard
    rotate<0,0,-Fold_Angle>
} //------------------

