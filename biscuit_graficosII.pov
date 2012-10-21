                                                   //oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo//
//                                                                        //
// Windows users: to start rendering this image, press Alt+G or the 'Run' //
// button on the toobar.                                                  //
//                                                                        //
// Experienced windows users: try right-clicking on the line below ...    //
//                                                                        //
// +w320 +h240
// +w800 +h600 +a0.3 +am2
//                                                                        //
// See the docs for full explanations of new features such as the above.  //
//                                                                        //
//oooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooooo//

// Persistence Of Vision raytracer version 3.5 sample file.
// Copyright 2001 Fabien Mosen

#include "colors.inc"
#include "functions.inc"
#include "logo.inc"

global_settings {max_trace_level 5}

camera {location <20,40,28> direction 2*z look_at <0,2,0>}

light_source {<-140,200,300> rgb <1.0, 1.0, 0.95>*1.5}
light_source {<140,200,-300> rgb <0.9, 0.9, 1.00>*0.8 shadowless}

#declare r1 = seed(0);

//----------------------- THE TABLE    
//Interior de cuadrados: amarillo primero y luego verde
#declare Pig_1 =
pigment {
   gradient z 
   color_map {
      [0.00, rgb <1.00, 0.99, 0.00>]
      [0.10, rgb <1.00, 0.99, 0.00>]
      [0.10, rgb <1.00, 0.75, 0.00>]
      [0.40, rgb <1.00, 0.75, 0.00>]
      [0.40, rgb <1.00, 0.99, 0.00>]
      [0.50, rgb <1.00, 0.99, 0.00>]
      [0.50, rgb <0.70, 0.85, 0.08>]
      [0.60, rgb <0.70, 0.85, 0.08>]
      [0.60, rgb <0.47, 0.75, 0.12>]
      [0.90, rgb <0.47, 0.75, 0.12>] 
      [0.90, rgb <0.70, 0.85, 0.08>] 
      [1.00, rgb <0.70, 0.85, 0.08>] 
   }     
   frequency 0.4    
   scale 0.7  
}
            
//Contorno de cuadrados: amarillo primero y luego verde         
#declare Pig_2 =
pigment {
   gradient z
   color_map {
      [0.00, rgb <1.00, 0.99, 0.00>]
      [0.50, rgb <1.00, 0.99, 0.00>]
      [0.50, rgb <0.70, 0.85, 0.08>]
      [1.00, rgb <0.70, 0.85, 0.08>]
   }     
   frequency 0.4
   scale 0.7
}
  
//Interior de cuadrados: verde primero y luego amarillo
#declare Pig_3 =
pigment {
   gradient z 
   color_map {   
      [0.00, rgb <0.70, 0.85, 0.08>]
      [0.10, rgb <0.70, 0.85, 0.08>]
      [0.10, rgb <0.47, 0.75, 0.12>]
      [0.40, rgb <0.47, 0.75, 0.12>] 
      [0.40, rgb <0.70, 0.85, 0.08>] 
      [0.50, rgb <0.70, 0.85, 0.08>]   
      [0.50, rgb <1.00, 0.99, 0.00>]
      [0.60, rgb <1.00, 0.99, 0.00>]
      [0.60, rgb <1.00, 0.75, 0.00>]
      [0.90, rgb <1.00, 0.75, 0.00>]
      [0.90, rgb <1.00, 0.99, 0.00>]
      [1.00, rgb <1.00, 0.99, 0.00>]
   }     
   frequency 0.4     
   scale 0.7
}
            
//Contorno de cuadrados: verde primero y luego amarillo         
#declare Pig_4 =
pigment {
   gradient z
   color_map {
      [0.00, rgb <0.70, 0.85, 0.08>]
      [0.50, rgb <0.70, 0.85, 0.08>]
      [0.50, rgb <1.00, 0.99, 0.00>]
      [1.00, rgb <1.00, 0.99, 0.00>]
   }     
   frequency 0.4
   scale 0.7
}
  
#declare Nappe =
cylinder {0,y*-1,50
   texture {
      pigment {
         gradient x
         pigment_map {
            [0.0, Pig_2]
            [0.1, Pig_2]
            [0.1, Pig_1]
            [0.4, Pig_1]
            [0.4, Pig_2]
            [0.5, Pig_2]
            [0.5, Pig_4]
            [0.6, Pig_4]
            [0.6, Pig_3]
            [0.9, Pig_3]
            [0.9, Pig_4]
            [1.0, Pig_4]
         }
         warp {turbulence .05 octaves 2}
      }
      normal {quilted 0.6 scale 0.025 warp {turbulence 0.05 octaves 2}}
      scale 5
      translate 10
   }
}     

#declare Pig_4 =
pigment {
   gradient z
   color_map {
      [0.00, rgb <0.70, 0.85, 0.08>]
      [0.50, rgb <0.70, 0.85, 0.08>]
      [0.50, rgb <1.00, 0.99, 0.00>]
      [1.00, rgb <1.00, 0.99, 0.00>]
   }     
   frequency 0.4
   scale 0.7
}

object {Nappe}

//----------------------- BISCUITS
#declare Tex_Biscuit =
texture {
   pigment {color rgb <0.98, 0.83, 0.58>}
   normal {dents 1.2 scale 0.01}
   finish {phong 0 brilliance 0.7}
}

#declare Base_Biscuit =
union {
   blob {
      threshold 0.7
      #declare I = 0;
      #while (I < 359)
         sphere {<4,0,0>, 1+rand(r1)*0.1, 1 rotate y*I}
         #declare I = I+(360/28);
      #end
   }
   cylinder {<0,0,0>, <0,0.5,0>, 4}
   texture {Tex_Biscuit}
}

#declare Chocolate =
union {
   difference {
      cone {<0,0,0>, 4.2, <0,0.4,0>, 4}
      cone {<0,0.1,0>, 3.6, <0,0.401,0>, 3.75}
   }
   torus {
      3.55, 0.1
      translate y*0.2
      clipped_by {torus {3.55+0.1, 0.1 translate y*0.1}}
   }
   union {
      #declare I = -4;
      #while (I < 4)
         cylinder {<-4,0.1,I>,<4,0.1,I>, 0.05}
         #declare I = I+0.5;
      #end
      clipped_by {cone {<0,0,0>, 4.2, <0,0.4,0>, 4}}
   }
   torus {3.96, 0.04 translate y*0.4}
   torus {3.79, 0.04 translate y*0.4}
}

#declare LogoFun =
object{Povray_Logo_Prism rotate x*90 scale 2.2 translate -0.3*z}

#declare ProjLogo =
blob {
   threshold 0.6
   #declare I = 0;
   #while (I < 1)
      #declare Pos = <-2+rand(r1)*4, 0, -2+rand(r1)*4>;
      #if (inside(LogoFun,Pos))
         sphere {Pos, 0.08, 1}
      #end
      #declare I = I+0.0002;
   #end
}

#declare Black_Chocolate =
texture {
   pigment {color rgb <0.24, 0.10, 0.03>}
   normal {wrinkles 0.2}
   finish {specular 0.3}
   }
#declare Milk_Chocolate =
texture {
   pigment {color rgb <0.48, 0.26, 0.13>}
   normal {wrinkles 0.2}
   finish {specular 0.2}
}
#declare White_Chocolate =
texture {
   pigment {color rgb <0.96, 0.95, 0.75>}
   normal {wrinkles 0.2}
   finish {ambient 0.3 specular 0.01}
}

#declare Icing = texture {
   pigment {rgbf <0.95, 0.95, 1.00, 0.1>*1.2}
   normal {bumps 0.1}
}

#declare Biscuit_1 =
union {
   object {Base_Biscuit }
   object {Chocolate translate y*0.5 
        texture {Black_Chocolate} 
        texture{
                pigment{
                        image_map{ png "img/espol.png"
                                map_type 0 // 0=planar, 1=spherical, 2=cylindrical, 5=torus
                                interpolate 2// 0=none, 1=linear, 2=bilinear, 4=normalized distance
                                once 
                        } // image_map
                } // pigment
               
        scale 6.5 rotate x*-90 translate <-3.2,0.6,3.2>             
        finish { diffuse 0.9 phong 1}
        } 
   }
}
#declare Biscuit_2 =
union {
   object {Base_Biscuit }
   object {Chocolate translate y*0.5 
        texture {Milk_Chocolate} 
        texture{
                pigment{
                        image_map{ png "img/espol.png"
                                map_type 0 // 0=planar, 1=spherical, 2=cylindrical, 5=torus
                                interpolate 2// 0=none, 1=linear, 2=bilinear, 4=normalized distance
                                once 
                        } // image_map
                } // pigment
               
        scale 6.5 rotate x*-90 translate <-3.2,0.6,3.2>             
        finish { diffuse 0.9 phong 1}
        } 
   }
}
#declare Biscuit_3 =
union {
   object {Base_Biscuit }
   object {Chocolate translate y*0.5 
        texture {White_Chocolate} 
        texture{
                pigment{
                        image_map{ png "img/espol.png"
                                map_type 0 // 0=planar, 1=spherical, 2=cylindrical, 5=torus
                                interpolate 2// 0=none, 1=linear, 2=bilinear, 4=normalized distance
                                once 
                        } // image_map
                } // pigment
               
        scale 6.5 rotate x*-90 translate <-3.2,0.6,3.2>             
        finish { diffuse 0.9 phong 1}
        } 
   }
}

object {Biscuit_1 rotate y*-120 translate <3.5,0,-4>}
object {Biscuit_3 rotate x*-4 translate <9.5,1.9,1>}  
object {Biscuit_2 rotate y*-80 translate <-3.5,0,2>}
object {Biscuit_3 rotate y*-160 translate <-7.5,1,8>}

#macro SevenBiscuits (Bisc,Num)
   union {
      #declare I = 0;
      #while (I < Num)
         object {Bisc translate x*9 rotate y*60*I}
         #declare I = I+1;
      #end
      object {Bisc}
   }
#end

//----------------------- CRUMBS
#declare Fun_Sphere = function {x*x + y*y +z*z}

#declare Crumb =
isosurface {
   function {Fun_Sphere(x,y,z) + f_noise3d(x*2,y*2,z*2)*1}
   threshold 1
   max_gradient 3.9
   //max_gradient 15
   accuracy 0.01
   contained_by {box {-1,1}}
   scale 0.5
}

#declare r1 = seed(0);

#declare I = 0;
#while (I < 1)
   object {
      Crumb
      rotate rand(r1)*360
      scale 0.2+rand(r1)*0.3
      translate <rand(r1)*10,0,rand(r1)*10>
      texture {Tex_Biscuit}
   }
   object {
      Crumb
      rotate rand(r1)*360
      scale 0.1+rand(r1)*0.15
      translate <rand(r1)*10,0,rand(r1)*10>
      texture {Tex_Biscuit}
   }
   #declare I = I+0.03;
#end

//----------------------- METAL BOX
#declare Pig3 =
pigment {
   gradient y
   color_map {
      [0, rgb <0.1, 0.5, 0.7>]
      [1, rgb <0.7, 0.6, 0.4>]
   }
   scale 0.5
}

#declare Pig4 =
pigment {
   crackle
   color_map {
      [0, rgb <1.0, 0.5, 0.6>]
      [1, rgb <0.0, 0.0, 0.0>]
   }
   scale 0.2
}

#declare MetalBoxPig =
pigment {
   radial frequency 60
   pigment_map {
      [0.0, Pig3]
      [0.5, Pig3]
      [0.5, Pig4]
      [1.0, Pig4]
   }
}

#declare BiscuitBox =
union {
   difference {
      cylinder {<0,0,0>, <0,5,0>, 14}
      cylinder {<0,0.1,0>, <0,5.1,0>, 13.9}
   }
   torus {14, 0.1 translate y*5}
   torus {14, 0.1 translate y*0.1}
   torus {14, 0.1 scale <1,2,1> translate y*4}
  
   texture { 
        pigment{ color rgbf<1,1,1, 0.7>}
                finish { diffuse 0.9 phong 0.5 metallic reflection {0.1, 0.1}}
        }
}

union {
   object {BiscuitBox}
   object {SevenBiscuits (Biscuit_1,6)}
   object {SevenBiscuits (Biscuit_3,6) rotate y*30 translate y*1}
   object {SevenBiscuits (Biscuit_2,5) rotate y*0 translate y*2}
   rotate y*-75 translate <-18,0,-12>
}

//-----------------------CUP OF TEA
#declare TeaCup =
union { 
   //contorno de la taza 
    difference {
      cylinder {<0,1.2,0>, <0,6,0>, 4.2}
      cylinder {<0,1,0>, <0,6.2,0>, 3.8}
   }

   difference {
      cylinder {<0,0.2,0>, <0,2.5,0>, 4}
      torus {2.8, 1 translate y*2.5}
      torus {4, 1 translate y*0}
      cylinder {<0,1.5,0>, <0,2.6,0>, 2.8}
   }

   difference {
      #declare LiquidLevel = 5;
      cylinder {<0,1.4,0>, <0,LiquidLevel,0>, 4}
      torus {3.6, 0.2 translate y*LiquidLevel}
      cylinder {<0,LiquidLevel-0.2,0>,<0,LiquidLevel+0.3,0>,3.6}
      pigment {Orange*0.8 filter 0.6}
      finish {phong 0.7 reflection 0.15}
      normal {bumps 0.05 scale 1}
   }

   torus {4.0, 0.2 translate y*6.0}
   torus {4.0, 0.2 translate y*1.2}
   torus {2.8, 0.2 translate y*0.2}

   union {
      difference {
         cylinder {<0.2,0,0>,<-0.2,0,0>,0.5}
         torus {0.5, 0.2 rotate z*90 translate x*0.2}
         translate y*1.25
      }                                                          
      difference {
         cylinder {<0.2,0,0>,<-0.2,0,0>,0.5}
         torus {0.5, 0.2 rotate z*90 translate x*0.2}
         translate y*-1.25
      }
      torus {1.25, 0.3 rotate x*90 clipped_by {plane {x,0 inverse}} translate x*0.8}
      cylinder {<0,-1.25,0>,<0.8,-1.25,0>,0.3}
      cylinder {<0,1.25,0>,<0.8,1.25,0>,0.3}
      scale <1,1,1.5> translate <4.2,4,0> rotate y*-90
   }                                             
   
   texture{
        pigment{color rgb<1,1,1>}
        finish{phong 1 reflection 0.1}
   }
   texture{
        pigment{
                image_map{ png "img/twitter.png"
                map_type 0 // 0=planar, 1=spherical, 2=cylindrical, 5=torus
                interpolate 2// 0=none, 1=linear, 2=bilinear, 4=normalized distance
                once 
               } // image_map
        } // pigment

        finish {diffuse 0.9 phong 1}
        scale <3,4.5,1> rotate<0,00,6> translate<-4.1,1.00,10>
  }   
}

   object {TeaCup rotate y*50 translate <4,0,-14> }
