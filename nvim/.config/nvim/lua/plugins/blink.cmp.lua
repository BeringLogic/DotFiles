return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  opts = {
    keymap = { preset = "super-tab" },
    completion = {
      documentation = {
        auto_show = true,
      },
    },
    sources = {
      default = { "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        lazydev = {
          name = "lazydev",
          module = "lazydev.integrations.blink",
          score_offset = 100,
        },
      },
    },
    signature = {
      enabled = true,
    },
  },
}
