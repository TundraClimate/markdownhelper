package.loaded["lua.markdownhelper"] = nil

local module = require("lua.markdownhelper")

module.setup {
  mdOnly = true
}
module.glob()
module.cspan()
module.cblock()
module.stth()
module.bracket()
module.paren()
