#include "includes/chess.inc"

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

#declare Fold_Angle = 80 - 90 * clock;

//---------------------------------
object { Ground }
object { Table }
object {
	ChessBoard
    translate <0, 0, 0>
	rotate <0, 0, Fold_Angle>
} //------------------
object {
	ChessBoard
    rotate <0, 0, -Fold_Angle>
} //------------------

