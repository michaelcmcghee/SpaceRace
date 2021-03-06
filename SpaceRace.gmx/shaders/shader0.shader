/*
    SNES Hires Blend Fix
    by Sp00kyFox, 2015

Filter:    Nearest
Scale:    1x

The original shader has the problem that it blends every horizontal pair of adjacent pixels where it should only blend pairwise disjointed pixel pairs instead.

*/

struct input_a
{
    float video_size;
    float texture_size;
    float output_size;
    float frame_count;
    float frame_direction;
    float frame_rotation;
};

struct out_vertex 
{
    float4 position : POSITION;
    float2 texCoord : TEXCOORD0;
    float4 t1 : TEXCOORD1;
};

/*    VERTEX_SHADER    */
out_vertex main_vertex
(
    float4 position : POSITION,
    float4 color    : COLOR,
    float2 texCoord : TEXCOORD0,

    uniform float4x4 modelViewProj,

    out float4 oPosition : POSITION,
    out float4 oColor    : COLOR,
    out float2 otexCoord : TEXCOORD,

    uniform input_a IN
)
{
    out_vertex OUT;

    OUT.position = mul(modelViewProj, position);

    float2 ps = float2(1.0/IN.texture_size.x, 1.0/IN.texture_size.y);
    float dx = ps.x;
    float dy = ps.y;

    OUT.texCoord = texCoord;
    OUT.t1 = texCoord.xxxy + float4(  -dx,    0,   dx,    0);    // L, C, R

    return OUT;
}

float3 main_fragment(in out_vertex VAR, uniform sampler2D decal : TEXUNIT0, uniform input_a IN) : COLOR
{
    // pixel location
    float fp = round(frac(0.5*VAR.texCoord.x*IN.texture_size.x));

    // reading the texels
    float3 l = tex2D(decal, VAR.t1.xw).xyz;
    float3 c = tex2D(decal, VAR.t1.yw).xyz;
    float3 r = tex2D(decal, VAR.t1.zw).xyz;

    // output
    return (IN.video_size.x > 500) ? (fp == 0 ? lerp(c,r,0.5) : lerp(c,l,0.5)) : c;
}
//######################_==_YOYO_SHADER_MARKER_==_######################@~//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    gl_FragColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
}

