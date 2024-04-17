shader_type canvas_item;

uniform float startTime = 0;

const float animTime = 3.0;
const float animSpeed = 1.5/animTime;

void fragment() {
	COLOR = texture(TEXTURE, UV);
	
	if(UV.y <= abs(UV.x-0.5) + 1.0 - (TIME-startTime)*animSpeed) {
		COLOR = vec4(0,0,0,0);
	}
}
