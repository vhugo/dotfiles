local ls = require 'luasnip'

-- Snippet creator
-- s(<trigger>, <nodes>)
local s = ls.s

-- Format node
-- It takes a format string and a list of node
-- fmt(<fmt_string>, {...nodes})
local fmt = require('luasnip.extras.fmt').fmt

-- Insert node
-- It takes a position (like $1) and optionally some default text
-- i(<position>, [default_text])
local i = ls.insert_node

-- Repeats a node
-- rep(<position>)
local rep = require('luasnip.extras').rep

ls.snippets = {
  all = {
    -- available in any filetype
    ls.parser.parse_snippet("expand", "-- this is what was expanded!"),
  },
  lua = {
    -- Lua specific snippets go here.
    s('req', fmt("local {} = require('{}')", { i(1,"default"), rep(1) })),
  },
}
