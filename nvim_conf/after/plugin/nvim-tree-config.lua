require("nvim-tree").setup({
   sort = {
     sorter = "case_sensitive",
   },
   view = {
     width = 30,
     -- adaptive_size = true,
   },
   renderer = {
     group_empty = true,
   },
   filters = {
     dotfiles = true,
   },
 })