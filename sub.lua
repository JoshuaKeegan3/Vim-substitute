
-- Gloabal replace
function ReplaceWordV()
    local old = vim.fn.input("old word > ")

    if old == "" then
        return
    end

    local new = vim.fn.input("new word > ")

    pcall(vim.fn.execute, "'<,'> s/\\<" .. old .. "\\>/" .. new .. "/g")
end

-- Function uses vim motions to replace the current word n on the currentline and n below.
-- This should be a familiar concept to vim users. as it is vim motions
function ReplaceWordN(motion)
    local old_word = vim.fn.expand("<cword>")
    local new_word = vim.fn.input(old_word .. " > ")

    if new_word == "" then
        return
    end

    local current_line = vim.fn.line(".")
    local end_line = vim.fn.line(".") + motion -- Calculate the end line of the motion range

    for line = current_line, end_line do
        pcall(vim.fn.execute, line .. "s/\\<" .. old_word .. "\\>/" .. new_word .. "/g")
    end
end
