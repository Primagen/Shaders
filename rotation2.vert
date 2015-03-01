#version 430

vec4 my_rotation(vec4 v, float radians)
{
    float temp_x = v.x;
    float costh = cos(radians);
    float sinth = sin(radians);

    return vec4 (
        costh*temp_x + -sinth*v.y,
        sinth*temp_x +  costh*v.y,
        v.z,
        v.w
    );
}

vec4 my_rotation2(vec4 v, float radians)
{
    float temp_z = v.z;
    float costh = cos(radians);
    float sinth = sin(radians);

    return vec4 (
        v.x,
        sinth*temp_z +  costh*v.y,
        costh*temp_z + -sinth*v.y,
        v.w
    );
}

in layout(location=0) vec4 position;
in layout(location=1) vec4 vertexColor;
uniform float t;

out vec4 theColor;

void main()
{  
    gl_Position = vec4(0.5*my_rotation2(my_rotation(position, t), t).xyz, 1.0);
    //gl_Position = vec4( vec3(position.x*cos(t), position.y, position.z), 1.0);
             // = vec4(0.5*position.xyz, 1.0);
    
    // pass data, for fragment shader    
    theColor = vertexColor;                 
}