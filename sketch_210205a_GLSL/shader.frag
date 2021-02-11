
#ifdef GL_ES
precision mediump float;
#endif

uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;

struct Ray {
	vec3 pos;
	vec3 dir;
};
	
float distFunc(vec3 pos)
{
	return length(pos) - 5.0;
}

vec3 getNormal(vec3 pos)
{
	const float d = 0.0001;
	return normalize(
		vec3(
			distFunc(pos + vec3(d, 0, 0)) - distFunc(pos - vec3(d, 0, 0)),
			distFunc(pos + vec3(0, d, 0)) - distFunc(pos - vec3(0, d, 0)),
			distFunc(pos + vec3(0, 0, d)) - distFunc(pos - vec3(0, 0, d))
		)
	);
}

void main( void ) {

	vec2 pos = (gl_FragCoord.xy - resolution * 0.5)  / resolution.y + mouse - 0.5;
	Ray ray;
	ray.pos = vec3(0.0, 0.0, -10.0);
	ray.dir = normalize(vec3(pos * 3.0, 1.0));
	float d;
	for(int i = 0; i < 16; ++i)
	{
		d = distFunc(ray.pos);
		ray.pos += d * ray.dir;
		if (abs(d) < 0.001) break;
	}
	if (abs(d) < 0.001)
	{
		float color = (dot(getNormal(ray.pos), vec3(0, 0, 1)) + 1.0) * 4.0;
		gl_FragColor = vec4(vec3(color), 1.0);
	}
	else
		gl_FragColor = vec4(0.3, 0.7, 1.0, 1.0);
}
1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31
32
33
34
35
36
37
38
39
40
41
42
43
44
45
46
47
48
49
50
51
#ifdef GL_ES
precision mediump float;
#endif
 
uniform float time;
uniform vec2 mouse;
uniform vec2 resolution;
 
struct Ray {
	vec3 pos;
	vec3 dir;
};
	
float distFunc(vec3 pos)
{
	return length(pos) - 5.0;
}
 
vec3 getNormal(vec3 pos)
{
	const float d = 0.0001;
	return normalize(
		vec3(
			distFunc(pos + vec3(d, 0, 0)) - distFunc(pos - vec3(d, 0, 0)),
			distFunc(pos + vec3(0, d, 0)) - distFunc(pos - vec3(0, d, 0)),
			distFunc(pos + vec3(0, 0, d)) - distFunc(pos - vec3(0, 0, d))
		)
	);
}
 
void main( void ) {
 
	vec2 pos = (gl_FragCoord.xy - resolution * 0.5)  / resolution.y + mouse - 0.5;
	Ray ray;
	ray.pos = vec3(0.0, 0.0, -10.0);
	ray.dir = normalize(vec3(pos * 3.0, 1.0));
	float d;
	for(int i = 0; i < 16; ++i)
	{
		d = distFunc(ray.pos);
		ray.pos += d * ray.dir;
		if (abs(d) < 0.001) break;
	}
	if (abs(d) < 0.001)
	{
		float color = (dot(getNormal(ray.pos), vec3(0, 0, 1)) + 1.0) * 4.0;
		gl_FragColor = vec4(vec3(color), 1.0);
	}
	else
		gl_FragColor = vec4(0.3, 0.7, 1.0, 1.0);
}