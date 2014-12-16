#include "includes/chess.inc"
#include "includes/pieces.inc"

global_settings { assumed_gamma 2.2 }

camera {
    angle 38
    location <200, CAM_Y, -55>
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
object { ChessBoard }
object {
    Pieces
    translate <0, -15 + clock * 18, 0>
}
