var _i = 0;
repeat(draw_count)
{
    scribble(string(_i) + ": Sphinx of black quartz, judge my vow!").draw(10, 40);
    ++_i;
}

draw_set_font(scribble_fallback_font);
draw_text(10, 10, "repeats = " + string(draw_count));