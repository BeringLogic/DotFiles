return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  opts = {
    keymap = { preset = "enter" },
    completion = {
      documentation = {
        auto_show = true,
      },
    },
      signature = {
        enabled = true,
      },
  },
  opts_extend = {
    "sources.default",
  },
}
