local ls = require('luasnip')
local snip = ls.snippet
local insert = ls.insert_node
local text = ls.text_node

ls.add_snippets(nil, {
        typescriptreact = {
            snip({
                    trig = 'rfc',
                    namr = 'React function component',
                    dscr = 'React functional component template'
                }, {
                    text({"import React from 'react';"}),
                    text({"const "}), insert(1, "ComponentName"), text({" = ("}), insert(2, "args"), text({") => {"}),
                    insert(3, "body"),
                    text({"}"})
                })
        }
    })
-- snippet dqsa "document.querySelectorAll"
-- document.querySelectorAll($1)$2
-- endsnippet

-- snippet mex "module.exports"
-- module.exports = $1
-- endsnippet

-- snippet dgs "dangerouslySetInnerHTML"
-- <div dangerouslySetInnerHTML={{__html: $1}} />
-- endsnippet

-- snippet req "const lib = require('lib')"
-- const $1 = require("$2")
-- endsnippet


