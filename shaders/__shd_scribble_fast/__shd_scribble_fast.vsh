//   @jujuadams   v8.3.0   2023-01-14
precision highp float;

#define BLEND_SPRITES true



//--------------------------------------------------------------------------------------------------------
// Attributes, Varyings, and Uniforms

attribute vec3   in_Position;     //{X, Y, Sprite data}
attribute vec4   in_Colour;       //Colour
attribute vec2   in_TextureCoord; //UVs
attribute float  in_Colour2;      //Scale

varying vec2   v_vTexcoord;
varying vec4   v_vColour;
varying float  v_fTextScale;

uniform vec4   u_vColourBlend;
uniform float  u_fTime;



//--------------------------------------------------------------------------------------------------------



float filterSprite(float spriteData)
{
    float imageSpeed = floor(spriteData / 4096.0);
    float imageMax   = floor((spriteData - 4096.0*imageSpeed) / 64.0);
    float image      = spriteData - (4096.0*imageSpeed + 64.0*imageMax);
    
    float displayImage = floor(mod(imageSpeed*u_fTime/1024.0, imageMax));
    return ((abs(image-displayImage) < 1.0/255.0)? 1.0 : 0.0);
}

void main()
{
    v_fTextScale = in_Colour2;
    
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION]*vec4(in_Position.xy, 0.0, 1.0);
    
    v_vColour = in_Colour;
    
    if (!BLEND_SPRITES && (in_Position.z > 0.0))
    {
        //If we're not RGB blending sprites and this *is* a sprite then only modify the alpha channel
        v_vColour.a *= u_vColourBlend.a;
    }
    else
    {
        //And then blend with the blend colour/alpha
        v_vColour *= u_vColourBlend;
    }
    
    if (in_Position.z > 0.0) v_vColour.a *= filterSprite(in_Position.z - 1.0); //Use packed sprite data to filter out sprite frames that we don't want
    
    v_vTexcoord = in_TextureCoord;
}