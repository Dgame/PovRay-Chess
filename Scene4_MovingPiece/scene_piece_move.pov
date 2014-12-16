global_settings { assumed_gamma 2.2 }

#include "includes/chess.inc"
#include "includes/usings.inc"

#declare USE_W_ROOK_2 = 0;

#include "includes/pieces.inc"

#declare JUMP_START  = 0.5;
#declare JUMP_HEIGHT = 7;

camera {
    angle 0
    location <200, 75, 0>
    direction <2, 2, 1>
    look_at <-3, 3, 5>
}

light_source {
    <800, 600, -200>
    colour White
}

#declare startX = 28;
#declare startZ = -28;
#declare endZ = -4;

object { Ground }
object { Table }
object { Pieces }
object { ChessBoard }
object { Frame }
object {
    WRook

    #if (clock < 16)
        translate <startX, clock, startZ + clock * 1.06>
    #else
        translate <startX, 30-clock, startZ + clock * 1.06>
    #end
}