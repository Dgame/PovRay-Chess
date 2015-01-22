global_settings { assumed_gamma 2.2 }

#include "includes/chess.inc"
#include "includes/usings.inc"

#declare USE_W_PAWN_5 = 0;

#include "includes/pieces.inc"



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

#declare startX = 12;
#declare startZ = -20;

object { Ground }
object { Table }
object { Pieces }
object { ChessBoard }
object { Frame }
object {
    WPawn

    #if (clock < 16)
        translate <startX, clock, startZ + clock * 0.30>
    #else
        translate <startX, 30-clock, startZ + clock * 0.30>
    #end
}