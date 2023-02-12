require('submodule_sibling')

function confirm_submodule_file_execution()
    mp.osd_message("could exec fn from a file in a sub directory, overall paths: " .. infi_path())
end
