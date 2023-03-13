local status, comment = pcall(require, 'Comment')
if (not status) then return end

comment.setup({
  -- Ignore empty lines
  ignore = "^$",
  toggler = {
    ---Line-comment toggle keymap
    line = '<leader>/',
    ---Block-comment toggle keymap
    block = 'gbc',
  },
  -- LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = '<leader>/',
    block = 'gc\\',
  },
  ---Enable keybindings
  ---NOTE: If given `false` then the plugin won't create any mappings
  mappings = {
    ---Extra mapping; `gco`, `gcO`, `gcA`
    extra = false,
  },
  pre_hook = function(...)
    local loaded, ts_comment = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
    if loaded and ts_comment then
      return ts_comment.create_pre_hook()(...)
    end
  end,
})
