#include "includes/chess.inc"
#include "includes/usings.inc"

#declare USE_W_PAWN_5 = 0;

#include "includes/pieces.inc"

global_settings { assumed_gamma 2.2 }

#declare JUMP_START  = 0.5;
#declare JUMP_HEIGHT = 7;
/*#if (clock < JUMP_START)
   #declare CAM_Y = 100.00;
#else
   #declare CAM_Y = 100.00 + JUMP_HEIGHT * 0.5 * (1 - cos(4 * pi * (clock - JUMP_START)));
#end*/

camera {
    angle 0
    location <200, 75, 0>
    direction <2, 2, 1>
    look_at <-3, 3, 5>
    rotate <0, 6*clock, 0>
}

light_source {
    <0, 600, 0>
    colour White
}

object { Pieces }
object { Ground }
object { Table }
object { ChessBoard }
object { WPawn translate <12, 0, -11> }