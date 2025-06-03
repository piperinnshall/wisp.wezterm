---@mod Wisp.Utils wisp utility functions
---
---@brief [[
---
---Utility helpers for Wisp
---
---@endbrief

local M = {}

local deep_copy

---Perform a deep copy of a Lua value.
---Tables are copied recursively; other types are returned as-is.
---@param value any     @The value to deep-copy.
---@param seen table?   @Internal table to track already-copied tables.
---@return any          @A deep copy of `value`.
deep_copy = function (value, seen)
    if type(value) ~= 'table' then
        return value
    end
    seen = seen or {}
    if seen[value] then
        return seen[value]
    end

    local copy = {}
    seen[value] = copy

    for k, v in pairs(value) do
        local new_key = deep_copy(k, seen)
        local new_val = deep_copy(v, seen)
        copy[new_key] = new_val
    end

    local mt = getmetatable(value)
    if mt then
        setmetatable(copy, deep_copy(mt, seen))
    end

    return copy
end

---Deep-copy any Lua value (tables recursively).
---@param value any     @The value to deep-copy.
---@return any          @A deep copy of `value`.
M.deep_copy = function (value)
    return deep_copy(value)
end

---Recursively merges table `t2` into `t1`, returning a new table.
---Neither `t1` nor `t2` is mutated.
---@param t1 table      @The base table.
---@param t2 table      @The table whose keys/values should be merged.
---@return table        @A new table containing the merged result.
M.deep_merge = function (t1, t2)
    local result = M.deep_copy(t1 or {})

    for k, v in pairs(t2 or {}) do
        if type(v) == 'table' and type(result[k]) == 'table' then
            result[k] = M.deep_merge(result[k], v)
        else
            result[k] = M.deep_copy(v)
        end
    end

    return result
end

return M
