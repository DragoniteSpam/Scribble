//scribble("Test text!").draw(10, 10);
//scribble("Text\ntext!").draw(210, 10);
//scribble(
//@"Text
//text!").draw(410, 10);

var _demo_string = "[pin_center]Contrary to popular belief,\n\n[fa_justify]Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet...\", comes from a line in section 1.10.32.";
var _wrap_x = mouse_x - 10;
var _wrap_y = mouse_y - 10;

//var _demo_string = "a bc\nd ef";
//var _wrap = 35;

var _element = scribble(_demo_string).wrap(_wrap_x, _wrap_y);

if (mouse_check_button_pressed(mb_left)) page++;
if (mouse_check_button_pressed(mb_right)) page--;

page = clamp(page, 0, _element.get_pages()-1);

_element.page(page);
_element.draw(10, 10);

draw_line(10, 0, 10, room_height);
draw_line(0, 10, room_width, 10);
draw_line(10 + _wrap_x, 0, 10 + _wrap_x, room_height);
draw_line(0, 10 + _wrap_y, room_width, 10 + _wrap_y);