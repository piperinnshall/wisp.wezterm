# wisp.wezterm

✨ A lightweight, magical plugin and config manager for WezTerm.

## Installation


```lua
-- Bootstrap wisp.wezterm
local wezterm = require 'wezterm'

local wisppath = (wezterm.target_triple == 'x86_64-pc-windows-msvc' and os.getenv('LOCALAPPDATA')
    or os.getenv('XDG_DATA_HOME') or wezterm.home_dir .. '/.local/share')
.. '/wezterm/wisp/wisp.wezterm'
if not io.open(wisppath, "r") then
  local wisprepo = 'https://github.com/piperinnshall/wisp.wezterm.git'
  local success, stdout, stderr = wezterm.run_child_process{
    'git', 'clone', '--filter=blob:none', '--branch=main', wisprepo, wisppath
  }
  if not success then
    wezterm.log_error("Error cloning repository: " .. stderr)
  end
end
package.path = wisppath .. '/?/init.lua;'

local wisp = require 'wisp'
```
