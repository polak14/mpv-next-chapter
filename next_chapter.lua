function chapter_seek(direction)
    local chapters = mp.get_property_number("chapters")
    if chapters == nil then chapters = 0 end
    local chapter  = mp.get_property_number("chapter")
    if chapter == nil then chapter = 0 end
    if chapter+direction < 0 then
        mp.command("playlist_prev")
        mp.command("show_text ${playlist}")
    elseif chapter+direction >= chapters then
        mp.command("playlist_next")
        mp.command("show_text ${playlist}")
    else
        mp.commandv("add", "chapter", direction)
        mp.command("show_text ${chapter-list}")
    end
end

mp.add_forced_key_binding("MBTN_FORWARD", "chapter_next", function() chapter_seek(1) end)
mp.add_forced_key_binding("MBTN_BACK", "chapter_prev", function() chapter_seek(-1) end)
