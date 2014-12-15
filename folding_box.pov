#include "textures.inc"
#include "metals.inc"
#include "woods.inc"
#include "colors.inc"

background { White }

camera {
  angle 20
  location<0,2,-10>
  look_at<0,0,0>
}

light_source { <10, 20, -10> color White }

// -------------------- dimensions
#declare D = 0.00001;
#declare S = 1;
// ------------------------- square
// square, Quadrat, quadrato, carré
#declare Quadrat = union{
	// Die Fläche
	box {
		<0,-D,0>, <1,D,1>
		texture { T_Silver_3B }
	}
} // end of union ------------------

#declare Fold_Angle = -99 - 90 * clock;
//---------------------------------

object{ Quadrat   // E ------
    translate<-S,0,0>
	rotate<0,0,Fold_Angle>
} //------------------
object{ Quadrat   // F ------
    rotate<0,0,-Fold_Angle>
} //------------------

