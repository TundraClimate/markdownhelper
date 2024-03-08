local M = {}

local is_markdown = function()
  local name = vim.api.nvim_buf_get_name(0);
  return string.match(name, ".md$")
end

local wrap = function(s)
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { s })
  vim.api.nvim_buf_set_text(0, row - 1, col + 1, row - 1, col + 1, { s })
  vim.api.nvim_win_set_cursor(0, { row, col + string.len(s) })
end

local wrapSide = function(s, bs)
  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { s })
  vim.api.nvim_buf_set_text(0, row - 1, col + 1, row - 1, col + 1, { bs })
  vim.api.nvim_win_set_cursor(0, { row, col + string.len(s) })
end

function M.setup(customConfig)
  local default = { mdOnly = false }
  local newConf = vim.tbl_deep_extend("force", default, customConfig)
  _G.NVIM_MARKDOWN_HELPER_CONFIG = newConf
end

function M.glob()
  if _G.NVIM_MARKDOWN_HELPER_CONFIG.mdOnly and not is_markdown() then return end
  wrap("*")
end

function M.cspan()
  if _G.NVIM_MARKDOWN_HELPER_CONFIG.mdOnly and not is_markdown() then return end
  wrap("`")
end

function M.cblock()
  if _G.NVIM_MARKDOWN_HELPER_CONFIG.mdOnly and not is_markdown() then return end
  wrap("```")
end

function M.stth()
  if _G.NVIM_MARKDOWN_HELPER_CONFIG.mdOnly and not is_markdown() then return end
  wrap("~~")
end

function M.bracket()
  if _G.NVIM_MARKDOWN_HELPER_CONFIG.mdOnly and not is_markdown() then return end
  wrapSide("[", "]")
end

function M.paren()
  if _G.NVIM_MARKDOWN_HELPER_CONFIG.mdOnly and not is_markdown() then return end
  wrapSide("(", ")")
end

return M
