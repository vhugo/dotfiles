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

ls.add_snippets('all', {
  ls.parser.parse_snippet('expand', '-- this is what was expanded!'),
})

ls.add_snippets('lua', {
  s('req', fmt("local {} = require('{}')", { i(1,'default'), rep(1) })),
})

ls.add_snippets('go', {
  s('tdd', fmt([[
	for _, tc := range []struct {
		name string
	}{
		{
			name: "<>",
		},
	} {
		t.Run(tc.name, func(t *testing.T) {
      <>
		})
	}
  ]], {
    i(1, "empty"), i(2),
  }, {
    delimiters = "<>",
    dedent = false,
  }))
})
