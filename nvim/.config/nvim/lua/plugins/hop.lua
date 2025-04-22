return {
  "smoka7/hop.nvim",
  version = "*",
  opts = {
    keys = "etovxqpdygfblzhckisuran",
  },
  keys = {
    { "f", function() require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR }) end, desc = "Hop Char1 forward" },
    { "F", function() require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR }) end, desc = "Hop Char1 backwards" },
    { "t", function() require("hop").hint_char1({ direction = require("hop.hint").HintDirection.AFTER_CURSOR, hint_offset = -1 }) end, desc = "Hop Char1 forward -1" },
    { "T", function() require("hop").hint_char1({ direction = require("hop.hint").HintDirection.BEFORE_CURSOR, hint_offset = 1 }) end, desc = "Hop Char1 backwards +1" },
  },
}
