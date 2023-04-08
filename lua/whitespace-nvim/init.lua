local config = {
    highlight = "DiffDelete",
    ignored_filetypes = {"TelescopePrompt", "Trouble", "help"},
    ignored_suffixes = {".class"}
}

local whitespace = {}

function string.ends(String, End)
    return End == "" or string.sub(String, -string.len(End)) == End
end

whitespace.highlight = function()
    if not vim.fn.hlexists(config.highlight) then
        error(string.format("highlight %s does not exist", config.highlight))
    end

    if vim.tbl_contains(config.ignored_filetypes, vim.bo.filetype) then
        return
    end

    local filename = vim.api.nvim_buf_get_name(0)
    for _, value in ipairs(config.ignored_suffixes) do
        if string.ends(filename, value) then
            local command = string.format([[match %s /\s\+$/]], "Normal")
            vim.cmd(command)
            return
        end
    end

    local command = string.format([[match %s /\s\+$/]], config.highlight)
    vim.cmd(command)
end

whitespace.trim = function()
    vim.cmd [[keeppatterns %substitute/\v\s+$//eg]]
end

whitespace.setup = function(options)
    config = vim.tbl_extend("force", config, options or {})

    vim.cmd [[
    augroup whitespace_nvim
      autocmd!
      autocmd FileType * lua require('whitespace-nvim').highlight()
    augroup END
  ]]
end

return whitespace
