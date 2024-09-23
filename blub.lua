local function print_colorized_text(texts)
    for _, txt in ipairs(texts) do
        term.setTextColor(txt[1])
        write(txt[2])
    end
    term.setTextColor(colors.white)
end

local commands = {
    install = {
        usage = "install <version?> ",
        short_desc = "Installs blue language",
        desc = "This command allows you to install blue language\n version = major.minor.patch (e.g. 0.0.1)\n you can add -mini to version (0.0.1-mini) to download minified interpreter"
    },
    uninstall = {
        usage = "uninstall",
        short_desc = "Uninstalls current blue language pack",
        desc = "This command removes your current blue language"
    },
    version = {
        usage = "version",
        short_desc = "Prints version information",
        desc = "This command removes your current blue language"
    },
    help = {
        usage = "help <command?>",
        short_desc = "Prints this information",
        desc = "This command allows you to gain more knowledge about other commands"
    }
}

local function print_help(h)
    if not h then
        print_colorized_text({ { colors.blue, "bLue language installer\n\n" } })
        print_colorized_text({ { colors.green, "Usage: " }, { colors.blue, "blub <command>\n" } })
        print_colorized_text({ { colors.green, "Commands:\n" } })
        local longest_space = 0
        for k, _ in pairs(commands) do
            if #k > longest_space then
                longest_space = #k
            end
        end
        for k, v in pairs(commands) do
            print_colorized_text({ { colors.blue, " "..k..string.rep(" ", longest_space-#k+2) }, { colors.white, v.short_desc.."\n" } })
        end
        print()
        print_colorized_text({ { colors.white, "See '" }, { colors.blue, "blub help <command>" }, { colors.white, "' for more information on a specific command.\n" } })
    else
        if not commands[h] then
            print_help()
        else
            print_colorized_text({ { colors.blue, "bLue language installer\n\n" } })
            print_colorized_text({ { colors.green, "Usage: " }, { colors.blue, "blub "..commands[h].usage.."\n" } })
            print_colorized_text({ { colors.green, "Description:\n" } })
            print_colorized_text({ { colors.white, " "..commands[h].desc.."\n" } })
        end
    end
end

local tArgs = { ... }
if #tArgs > 0 then
    if tArgs[1] == "install" then
        -- TODO: install
        print("Installing...")
    elseif tArgs[1] == "help" then
        print_help(tArgs[2])
    else
        print_help()
    end
else
    print_help()
end
