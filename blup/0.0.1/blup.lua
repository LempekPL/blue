local blue = require(fs.getDir(select(2, ...) or "") .. "/run")

local function print_colorized_text(texts)
    for _, txt in ipairs(texts) do
        term.setTextColor(txt[1])
        write(txt[2])
    end
    term.setTextColor(colors.white)
end

local commands = {
    -- new = {
    --     usage = "new <path>",
    --     short_desc = "Creates new bLue package",
    --     desc = "This command creates new blup package in the given directory"
    -- },
    -- run = {
    --     usage = "run",
    --     short_desc = "Runs main file in the package",
    --     desc = "This command runs main file in the package",
    -- },
    execute = {
        usage = "execute <file.blu>",
        short_desc = "Executes file",
        desc = "This command interprets selected file"
    },
    -- add = {
    --     usage = "add <dep>",
    --     short_desc = "Adds dependency to manifest file",
    --     desc = "This command adds selected dependency to manifest file"
    -- },
    help = {
        usage = "help <command?>",
        short_desc = "Prints this information",
        desc = "This command allows you to gain more knowledge about other commands"
    }
}

local function print_help(h)
    if not h then
        print_colorized_text({ { colors.blue, "bLue package manager\n\n" } })
        print_colorized_text({ { colors.green, "Usage: " }, { colors.blue, "blup <command>\n" } })
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
        print_colorized_text({ { colors.white, "See '" }, { colors.blue, "blup help <command>" }, { colors.white, "' for more information on a specific command.\n" } })
    else
        if not commands[h] then
            print_help()
        else
            print_colorized_text({ { colors.blue, "bLue package manager\n\n" } })
            print_colorized_text({ { colors.green, "Usage: " }, { colors.blue, "blup "..commands[h].usage.."\n" } })
            print_colorized_text({ { colors.green, "Description:\n" } })
            print_colorized_text({ { colors.white, " "..commands[h].desc.."\n" } })
        end
    end
end

local tArgs = { ... }
if #tArgs > 0 then
    if tArgs[1] == "execute" then
        if type(tArgs[2]) == "string" then
            local file = shell.resolve(tArgs[1])
            if file and not fs.isDir(file) then
                blue.runFile(file)
            end
        end
    elseif tArgs[1] == "help" then
        print_help(tArgs[2])
    else
        print_help()
    end
else
    print_help()
end