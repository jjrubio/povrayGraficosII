#include "colors.inc"
#include "textures.inc"
#include "glass.inc"
#include "woods.inc"
#include "stones.inc"
 
//global_settings { assumed_gamma 2.2 }
// La camara
camera {
  location <0, 15, 35>
  look_at <0, 10, 0>
}
#declare Glass = texture { 
pigment {rgbf < 0.98, 1.0, 0.98, 1> } 
finish { 
specular 1 
roughness 0.001 
ambient 0 
diffuse 0 
reflection { 
0,1 
fresnel 
} 
} 
} 

// Fuente de luz blanca
object {
  light_source {
  <50, 30, 70>
  color White   
  // parallel
  //point_at <1, 0, 0>
  }
}
// Fuente de luz blanca
object {
  light_source {
  <-50, 30, 70>
  color White   
  // parallel
   //point_at <1, 0, 0>
  }
}
 
 // Fuente de luz blanca
object {
  light_source {
  <50, 30, -70>
  color White   
   parallel
  point_at <1, 0, 0>
  }
} 
// Cielo
object {
 sphere { <0, 0, 0> 200000}  // Boveda celeste de gran tamaño
 //texture {Blue_Sky scale <50000, 6000, 50000>} // Estiramos las nubes
 pigment{color rgb<0.3,0.3,1>}
}

// Bola 
sphere { <12, 2, 7> 2   
    texture { P_WoodGrain4A } finish{phong 0.7 reflection 0.2}
}
   
// Bola Azul
sphere { <-10,2,0> 2  
    texture { pigment{color rgb<0.0,0.0,1.0>} 
    finish{
    reflection 0.7
    phong 1.0} }
}      
// Bola
sphere { <10, 2, 0> 2  
    texture { Gold_Metal }
} 
// Bola
sphere { <0, 2, -10> 2  
    texture { T_Stone18 } finish{phong 0.7 reflection 0.5}
}  

// Bola
sphere { <0, 2, 10> 2   
    //texture { P_WoodGrain4A  }
    pigment{gradient <0, 1, 0>   
    turbulence 0.5
    color_map {
      [0.0 color  rgb<0.1,0.3,0.7>]
      [0.25 color rgb<0.5,0.3,0.2>]
      [1.0 color  rgb<0.3,0.1,0.2>]
    }
  scale 3  
  }
     finish{
    phong 1.0 reflection 0.2 refraction 0.9
    }
}     
//Prisma
prism {
    conic_sweep
    linear_spline
    0, // height 1
    1, // height 2
    5, // the number of points making up the shape...
    <4,4>,<-4,4>,<-4,-4>,<4,-4>,<4,4>
    rotate <180, 60, 0>
    translate <0, 3, 0>
    scale <1, 6, 1>
    texture {T_Glass3  }
        finish{      
        phong 0.9
        reflection 0.25 
        //refraction 0.2
        caustics 2.0 
        }
   
  }

// Suelo 
// ------------------------------------------------------------------ 
// A white marble floor 
plane {  
        y, -0.1 
        texture 
        { 
          pigment 
          { 
              marble 
              turbulence 0.5 omega 0.7 rotate -40*y scale 6 
              color_map 
              { 
                [0.50 color rgb 1.0] 
                [0.57 color rgb 0.8] 
                [0.60 color rgb <0.9,0.8,0.7>] 
                [0.63 color rgb 1.0] 
              } 
        } 
        finish {ambient 0.2 reflection 0.3} 
   } 
} 