global_settings { assumed_gamma 2.2 }

#include "includes/chess.inc"
#include "includes/pieces.inc"

#declare JUMP_START  = 0.5;
#declare JUMP_HEIGHT = 7;

camera {
    angle 0
    location <200, 75, 0>
    direction <2, 2, 2>
    up <0, 1, 0>
    right x * 2
    look_at <-3, 3, 5>
}

light_source {
    <800, 600, -200>
    colour White
}

object { Ground }
object { Table }
object { Pieces }
object { ChessBoard }
object { Frame }
object {
    #declare startX = 28;
    #declare startZ = -28;
    #declare endZ = -4;

    #if (clock < 16)
        object { WRook   translate < startX, clock, startZ + clock * 1.06> }
    #else
        object { WRook   translate < startX, 30-clock, startZ + clock * 1.06> }
    #end
}