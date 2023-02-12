--[[

Just a hack so I can add my own hotkeys for stuff I use without having to
pollute their source directly.

Also a proof of concept for how to deal with submodules in lua which I have to
say is mega annoying.

]]

function script_path()
   local str = debug.getinfo(2, "S").source:sub(2)
   return str:match("(.*/)")
end

function infi_path()
    local submodule_paths = {
        [1] = "submodule_tests/?.lua;",
        [2] = "mpvacious/?.lua;",
        [3] = "mpvacious/platform/?.lua;",
        [4] = "mpvacious/subtitles/?.lua;",
        [5] = "mpvacious/utils/?.lua;"
    }

    local custom_package_path = ""

    local root_path = script_path()

    for _, submodule_path in ipairs(submodule_paths) do
        custom_package_path = custom_package_path .. root_path .. submodule_path
    end

    return custom_package_path
end

package.path = infi_path() .. package.path

require('infi')
