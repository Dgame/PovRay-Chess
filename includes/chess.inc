#include "shapes.inc"
#include "colors.inc"
#include "textures.inc"
#include "skies.inc"
#include "metals.inc"
#include "woods.inc"

#declare Ground = plane {
    y, -80
    pigment { blue 0.65 }
    finish {
        ambient 0.25
        diffuse 0.5
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

#declare Board = box {
    <-32, -1, -32> <32, 0, 32>
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
         translate -20*y
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

#declare ChessBoard = union {
    object { Board }
    object { Frame }
}
