if (scribble_autotype_get(element) == 1)
{
    if (keyboard_check_pressed(vk_anykey))
    {
        scribble_autotype_set(element, SCRIBBLE_TYPEWRITER_PER_CHARACTER, 0.5, 0, false);
    }
}

if (scribble_autotype_get(element) == 2) 
{
    if (keyboard_check_pressed(vk_anykey))
    {
        scribble_autotype_set(element, SCRIBBLE_TYPEWRITER_PER_CHARACTER, 0.5, 0, true);
    }
}