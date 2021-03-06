#include "includes/chess.inc"
#include "includes/usings.inc"
#include "includes/pieces.inc"

global_settings { assumed_gamma 2.2 }

camera {
    angle 38
    location <200, 100, -55>
    direction <2, 2, 2>
    look_at <-3, -3, 5>
}

light_source {
    <0, 600, 0>
    colour White
}

object { Ground }
object { Table }
object { ChessBoard }
object {
    Pieces
    translate <0, -15 + clock * 15.5, 0>
}
