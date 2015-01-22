#include "includes/chess.inc"
#include "includes/usings.inc"

#declare USE_W_PAWN_5 = 0;
#declare USE_B_PAWN_4 = 0;
#declare USE_W_PAWN_6 = 0;

#include "includes/pieces.inc"

global_settings { assumed_gamma 2.2 }

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

object { Pieces }
object { Ground }
object { Table }
object { ChessBoard }
object { WPawn translate <12, 0, -11> }
object { BPawn translate <4, 0, 3.5> }

#declare startX = 20;
#declare startZ = -20;

object {
    WPawn

    #if (clock < 16)
        translate <startX, clock, startZ + clock * 0.55>
    #else
        translate <startX, 30-clock, startZ + clock * 0.55>
    #end
}