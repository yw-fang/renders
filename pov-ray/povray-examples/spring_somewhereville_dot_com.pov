// created by Friedrich A. Lohmueller, 2003 / 2010 / Jan-2011
// modified by Damian G. Allis, somewhereville.com, Mar-2016, see http://www.somewhereville.com/category/programs-os/povray/
// see  http://www.somewhereville.com/?p=2752 for details
// modified by Yue-Wen FANG, Nov-2018


// #include "textures.inc"

global_settings
	{
	assumed_gamma 1.0
	}

camera
	{
	angle 25                                      //   smaller = closer
    location  < 0.0, 1.0, -5.0 >                  //   -5.0 = distance to spring
    right x * image_width / image_height          //   want it larger --> go less neg.
    look_at < 0.0, 1.0, 0.0 >                     //   want is smaller --> go more neg.
	}

light_source
	{
	< 1500, 2500, -2500 >
	color rgb < 1.0, 1.0, 1.0 >
	}

background 
	{
    color rgb < 1.0, 1.0, 1.0 >
	}

//
// begin the math to make the spring by spiraling a single sphere
//

#declare ampli = 0.50 ;                           // stretches and compresses the spring
#declare min_length = 0.80 ;
#declare mid_length = ampli + min_length ;
#declare time_test = 0.25 ;                       //0.25/0.75 shows max/min extention

#declare sprnglngth = mid_length + ampli * sin((clock + time_test) * 2 * pi) ;

#declare spiral =

union
	{
 	#local n_per_rev = 300 ;                     // spheres per spring revolution
 	#local n_of_rev = 4.00 ;                     // total coil count for the spring
 	#local h_per_ref = sprnglngth / n_of_rev ;   // rise per revolution
 	#local nr = 0 ;                              // start loop
 	#while (nr < n_per_rev * n_of_rev)           // loop the spring sphere until...
    sphere
		{
    	< 0, -0.4, 0 > , 0.05                    // 0.05 adjusts the sphere diameter
    	translate< 0.25, -nr * h_per_ref / n_per_rev, 0.0 >
        rotate< 0, nr * 360 / n_per_rev, 0 >
		texture
			{
			pigment 
				{
				rgb < 0.658824, 0.658824, 0.658824 >*1.2
				}
            finish                               // adjust below to taste
        		{
            	ambient 0.050 
            	diffuse 0.500 
            	phong 0.1 
            	phong_size 2.500 
            	specular 0.500
		        reflection 0.15
		        brilliance 8
		        roughness 0.1
				}
			}
		}
	#local nr = nr + 1 ;
	#end
	} 

//
// end the math to make the spring by spiraling a single sphere
//

object
	{
	spiral translate< 0.0, 2.3, 0.0>             // translates "spiral" on the screen
	}
