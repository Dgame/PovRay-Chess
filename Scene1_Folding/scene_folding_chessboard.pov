#include "includes/chess.inc"

global_settings { assumed_gamma 2.2 }

camera {
    angle 38
    location <200, 100, -55>
    look_at <-3, -3, 5>
    rotate 45
}

light_source {
    <0, 600, 0>
    colour White
}

#declare Fold_Angle = 90 - 90 * clock;

//---------------------------------
object { Ground }
object { Table }
object {
	ChessBoard
    translate <0, 0, -2>
	rotate <0, 0, Fold_Angle>
} //------------------
object {
	ChessBoard
    translate <0, 0, -2>
    rotate <0, 0, -Fold_Angle>
} //------------------

