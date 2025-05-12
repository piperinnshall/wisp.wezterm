---@class Wisp
local M = {}

---@param opts wisp.Opts
function M.setup(opts)
    require 'wezterm'.log_info("Hello from wisp!")

    local Config = require('wisp.config')
end

return M
