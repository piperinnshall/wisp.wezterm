---@mod Wisp.Config wisp.wezterm configuration
---
---@brief [[
---
---wisp.wezterm configuration options.
---
---@endbrief

---@class Wisp.Config: Wisp.Opts
local M = {}

---@class Wisp.Opts
---@field modules? (Wisp.Module.Import|Wisp.Module.Inline)[] @Optional list of configuration modules

---@class Wisp.Module.Import: Wisp.Module
---@field import string @Path to a module directory

---@class Wisp.Module.Inline: Wisp.Module
---@field config function @Inline module configuration

---@class Wisp.Module
---@field [string] any @Must be a table

---@type Wisp.Opts
M.opts = {}

---@param opts Wisp.Opts
M.setup = function (opts)
    M.opts = opts
end
