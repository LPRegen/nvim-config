local status, comment = pcall(require, 'Comment')
if (not status) then return end

comment.setup({
  toggler = {
    ---Line-comment toggle keymap
    line = 'zqas',
    ---Block-comment toggle keymap
    block = 'zqa',
  },
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = '<leader>/',
    ---Block-comment keymap
    block = 'zq',
  },
  ---Enable keybindings
  ---NOTE: If given `false` then the plugin won't create any mappings
  mappings = {
    ---Extra mapping; `gco`, `gcO`, `gcA`
    extra = false,
  },
})
