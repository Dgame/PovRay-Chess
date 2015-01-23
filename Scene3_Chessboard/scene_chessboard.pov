#include "includes/chess.inc"
#include "includes/usings.inc"
#include "includes/pieces.inc"

global_settings { assumed_gamma 2.2 }

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
    look_at <-3, 3, 5>
    rotate <0, -360 * (clock + 0.000001), 0>
}

light_source {
    <0, 600, 0>
    colour White
}

object { Pieces }
object { Ground }
object { Table }
object { ChessBoard }
