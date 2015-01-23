#include "colors.inc"

background { color White }

light_source {
   <10, 100, -100>
   color White
}

light_source {
   <10, 100, 100>
   color White
}

global_settings { ambient_light <1, 1, 1> * 1 }

camera {
   location <0, 0, -100>
   look_at  <0, 0, 2>
}

#if (clock < 0.5)
#declare A = clock * -5;
#declare B = clock * 4;
#declare C = clock * -9;
#declare D = clock * 7;
#else
#declare A = clock * -5;
#declare B = clock * 2;
#declare C = clock * -9;
#declare D = clock * 3;
#end

#declare Tentakel = union {
#declare R = 5;
#declare r = 1;
#declare L = 10;
#declare P = 1;

#declare points = 7;
#declare pt = 0;

   sphere_sweep {
      b_spline points + 1
      <0, 0, 0>, 1
#while (pt < points)
      <R * cos(pt * P + 5 * A) + 5 * R * cos(pt * P * 0.1 * B), pt * L, R * sin(pt * P + 5 * C) + 5 * R * sin(pt * P * 0.1 * D)>, r 
#declare r = r + 0.2;
#declare pt = pt + 1;
#end
   }

   pigment { color Yellow }
   finish { ambient 0.5 phong 0.7 phong_size 20 reflection { 0.0 } }
}


#declare Viech = union {
   object {
      Tentakel
      rotate 90 * z
      translate <62, -15, 1>
   }

   object {
      Tentakel
      rotate 75 * z
      translate <58, -33, 1>
   }

   sphere {
      <0, 0, 0>, 20
      pigment { color Yellow }
   }

   object {
      Tentakel
      rotate -115 * z
      translate <-50, 40, 1>
   }

   object {
      Tentakel
      rotate -95 * z
      translate <-60, 20, 1>
   }
}

object { Viech }