#include "includes/chess.inc"
#include "includes/usings.inc"

#declare USE_W_PAWN_5 = 0;
#declare USE_B_PAWN_4 = 0;
#declare USE_W_PAWN_6 = 0;
#declare USE_B_QUEEN = 0;

#include "includes/pieces.inc"

global_settings { assumed_gamma 2.2 }

camera {
    angle 0
    location <200, 75, 0>
    direction <2, 2, 1>
    look_at <-3, 3, 5>
    rotate <0, 180, 0>
}

light_source {
    <0, 600, 0>
    colour White
}

#declare startX = -4;
#declare startZ = 28;

object { Pieces }
object { Ground }
object { Table }
object { ChessBoard }
object { WPawn translate <12, 0, -11> }
object { BPawn translate <4, 0, 3.5> }
object { WPawn translate <20, 0, -3.5> }


object {
    BQueen

    #if (clock < 16)
        translate <startX + clock * 1.03, clock, startZ - clock * 1.07>
    #else
        translate <startX + clock * 1.03, 30-clock, startZ - clock * 1.07>
    #end
}