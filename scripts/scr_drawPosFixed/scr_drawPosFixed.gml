/// @description  draw_sprite_pos_fixed(sprite,subimg,x1,y1,x2,y2,x3,y3,x4,y4,colour,alpha);
/// @param sprite
/// @param subimg
/// @param x1
/// @param y1
/// @param x2
/// @param y2
/// @param x3
/// @param y3
/// @param x4
/// @param y4
/// @param colour
/// @param alpha
/// @param fadeCorner
vertex_format_begin();
vertex_format_add_colour();
vertex_format_add_position();
vertex_format_add_normal();
global.format_perspective = vertex_format_end();

function draw_sprite_pos_fixed(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12 = 0) {

	var sprite, subimg, colour, alpha, alphaArr, texture, uvs, px, py, ax, ay, bx, by, cx, cy, s, t, q, can, v_buffer, cornerFade;

	sprite = argument0;
	subimg = argument1;
	colour = argument10;
	alpha = argument11;
	cornerFade = argument12;
	texture = sprite_get_texture(sprite, subimg);
	uvs = sprite_get_uvs(sprite, subimg);

	px[0] = argument8;
	py[0] = argument9;
	px[1] = argument6;
	py[1] = argument7;
	px[2] = argument4;
	py[2] = argument5;
	px[3] = argument2;
	py[3] = argument3;

	ax = px[2] - px[0];
	ay = py[2] - py[0];
	bx = px[3] - px[1];
	by = py[3] - py[1];
	
	switch cornerFade {
		 case 1: // left wall fade
			alphaArr[0] = alpha;
			alphaArr[1] = 0;
			alphaArr[2] = alpha;
			alphaArr[3] = 0;
			
			break;
		case 2: // floor fade
			switch global.facing {
				case 0:
					alphaArr[0] = 0;
					alphaArr[1] = 0;
					alphaArr[2] = alpha;
					alphaArr[3] = alpha;
					break;
				case 1: //
					alphaArr[0] = alpha;
					alphaArr[1] = 0;
					alphaArr[2] = alpha;
					alphaArr[3] = 0;
					break;
				case 2:
					alphaArr[0] = alpha;
					alphaArr[1] = alpha;
					alphaArr[2] = 0;
					alphaArr[3] = 0;
					break;
				case 3: //
					alphaArr[0] = 0;
					alphaArr[1] = alpha;
					alphaArr[2] = 0;
					alphaArr[3] = alpha;
					break;						
			}
			break;	
			
		case 3: // right wall fade
			alphaArr[0] = 0;
			alphaArr[1] = alpha;
			alphaArr[2] = 0;
			alphaArr[3] = alpha;
			break;	
		  
		 default: // no fade
			alphaArr[0] = alpha;
			alphaArr[1] = alpha;
			alphaArr[2] = alpha;
			alphaArr[3] = alpha;
			break;			  
			  
	}
	

	can = ax * by - ay * bx;

	if (can != 0) {
	  cx = px[0] - px[1];
	  cy = py[0] - py[1];  
	  s = (ax * cy - ay * cx) / can;  
	  if (s > 0 and s < 1) {
	    t = (bx * cy - by * cx) / can;    
	    if (t > 0 and t < 1) {
	      q[0] = 1 / (1 - t);
	      q[1] = 1 / (1 - s);
	      q[2] = 1 / t;
	      q[3] = 1 / s;
	      v_buffer = vertex_create_buffer();
	      vertex_begin(v_buffer, global.format_perspective);
	      vertex_colour(v_buffer, colour, alphaArr[0]);
	      vertex_position(v_buffer, px[3], py[3]);
	      vertex_normal(v_buffer, q[3]*uvs[0], q[3]*uvs[1], q[3]);
	      vertex_colour(v_buffer, colour, alphaArr[1]);
	      vertex_position(v_buffer, px[2], py[2]);
	      vertex_normal(v_buffer, q[2]*uvs[2], q[2]*uvs[1], q[2]);
	      vertex_colour(v_buffer, colour, alphaArr[2]);
	      vertex_position(v_buffer, px[0], py[0]);
	      vertex_normal(v_buffer, q[0]*uvs[0], q[0]*uvs[3], q[0]);
	      vertex_colour(v_buffer, colour, alphaArr[3]);
	      vertex_position(v_buffer, px[1], py[1]);
	      vertex_normal(v_buffer, q[1]*uvs[2], q[1]*uvs[3], q[1]);
	      vertex_end(v_buffer);
	      shader_set(sh_perspecitve);
	      vertex_submit(v_buffer, pr_trianglestrip, texture);
	      shader_reset();
	      vertex_delete_buffer(v_buffer);
	    }
	  }
	}



}