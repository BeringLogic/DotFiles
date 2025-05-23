return {
  "saghen/blink.cmp",
  dependencies = { "rafamadriz/friendly-snippets" },
  version = "1.*",
  opts = {
    keymap = {
      preset = "default",
      ["<Esc>"] = { "hide", "fallback" },
      ["<CR>"] = { "accept", "fallback" },
      ["<Tab>"] = { "accept", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "snippet_backward", "fallback" },
    },
    completion = {
      documentation = {
        auto_show = true,
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = true,
        }
      }
    },
    sources = {
      default = { "dadbod", "lazydev", "lsp", "path", "snippets", "buffer" },
      providers = {
        dadbod = {
          name = "dadbod",
          module = "vim_dadbod_completion.blink"
        },
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
