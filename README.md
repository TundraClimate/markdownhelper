# markdownhelper

マークダウンのヘルパー

````
local keyset = vim.keymap.set
local mdhelper = require("markdownhelper")

keyset("i", "*", mdhelper.blob())
keyset("i", "`", mdhelper.cspan())
keyset("i", "```", mdhelper.cblock())
keyset("i", "~~", mdhelper.stth())
keyset("i", "[", mdhelper.branket())
keyset("i", "(", mdhelper.paren())
````
