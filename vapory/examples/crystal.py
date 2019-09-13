from vapory import *

__author__ = "Yue-Wen FANG"
__maintainer__ = "Yue-Wen FANG"
__email__ = "fyuewen@gmail.com"
__status__ = "Development"
__creation_date__ = "November 29, 2018"

"""
In this example, I create a scene with 8 spheres.
In particular, glass texture is used.
"""

camera = Camera( 'location', [3,2,-3], 'look_at', [0,1,1] )
light = LightSource( [2,4,-3], 'color', [1.0,1.0,1.0] )
sphere_1 = Sphere( [0,1,2], 0.3, Texture( Pigment( 'color', [1,0,1] )))
sphere_2 = Sphere( [0,0,2], 0.3, Texture( Pigment( 'color', [1,0,1.0] )))
sphere_3 = Sphere( [0,1,0], 0.3, Texture( Pigment( 'color', [1,0,1.0] )))
sphere_4 = Sphere( [0,0,0], 0.3, Texture( Pigment( 'color', [1,0,1.0] )))
sphere_5 = Sphere( [1,1,0], 0.3, Texture( Pigment( 'color', [1,0,0.5] )))
# sphere_6 = Sphere( [1,0,0], 0.3, Texture( Pigment( 'color', [1,0,0.5] )))
sphere_7 = Sphere( [1,0,2], 0.3, Texture( Pigment( 'color', [1,0,0.5] )))
# sphere_8 = Sphere( [1,1,2], 0.3, Texture( Pigment( 'color', [1,0,0.5] )))
sphere_6 = Sphere( [1,0,0], 0.3,
        Texture(
            'T_Glass3',
            Pigment( 'color', [1.0,0.0,0.5]),
            Finish('phong', 0.45, 'reflection', 0.25, 'specular', 0.500)
            ),
        Interior(
            'I_Glass3', 'ior', 1.55
            )
        )
sphere_8 = Sphere( [1,1,2], 0.3,
        Texture(
            'T_Glass3',
            Pigment( 'color', [1.0,0.0,0.5]),
            Finish('phong', 0.45, 'reflection', 0.25, 'specular', 0.500)
            ),
        Interior(
            'I_Glass3', 'ior', 1.55
            )
        )

background = Background("color", [0.0, 0.0, 0.0])

scene = Scene( camera, objects= [light, background, sphere_1, sphere_2, sphere_3, sphere_4,
    sphere_5, sphere_6, sphere_7, sphere_8],
    included = ["colors.inc", "textures.inc", "glass.inc"])
#    defaults = [Finish( 'ambient', 0.1, 'diffuse', 0.9)] )
scene.render("crystal.png", width=900, height=900)
