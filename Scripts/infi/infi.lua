--[[

Mostly I make global some mpvacious commands for sub timings that otherwise
requires activating their OSD layer.

Note also that I disable global hotkeys by default and only load the commands I
care to have explicitly via input.conf to not have conflicts between different
scripts and to not have my hotkey space polluted.

]]

require('sub_speed_up')
require('mpvacious.subs2srs')

require('test_sibling_file')
require('submodule_tests.test_submodule_file')

local Menu = require('menu')
local switch = require('utils.switch')
local subs_observer = require('subtitles.observer')

function main()
    mp.osd_message("loaded my config fwiw")
end

local imenu = Menu:new {
    hints_state = switch.new { 'hidden', 'menu', 'global', },
}

mp.add_key_binding("4", "mpvacious-sub-begin-observe", imenu:with_update { subs_observer.begin_observing })
mp.add_key_binding("5", "mpvacious-sub-manual-time-start", imenu:with_update { subs_observer.set_manual_timing, 'start' })
mp.add_key_binding("6", "mpvacious-sub-manual-time-end", imenu:with_update { subs_observer.set_manual_timing, 'end' })
mp.add_key_binding("7", "mpvacious-sub-manual-time-to-sub-start", imenu:with_update { subs_observer.set_manual_timing_to_sub, 'start' })
mp.add_key_binding("8", "mpvacious-sub-manual-time-to-sub-end", imenu:with_update { subs_observer.set_manual_timing_to_sub, 'end' })
mp.add_key_binding("0", "mpvacious-sub-clear-timings", imenu:with_update { subs_observer.clear_and_notify })

mp.add_key_binding("Ctrl+Alt+3", "confirm_sibling_execution", confirm_sibling_execution)
mp.add_key_binding("Ctrl+Alt+4", "confirm_submodule_file_execution", confirm_submodule_file_execution)
mp.add_key_binding("Ctrl+Alt+5", "confirm_submodule_sibling_execution", confirm_submodule_sibling_execution)

mp.register_event("file-loaded", main)
