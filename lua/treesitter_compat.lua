-- Compatibility shims for Neovim 0.12+
-- In Neovim 0.12+, Tree-sitter match captures are always arrays of nodes (`table<integer, TSNode[]>`).
-- Legacy plugins (such as nvim-treesitter query predicates and directives) expect single TSNode userdata.

local orig_get_range = vim.treesitter.get_range
vim.treesitter.get_range = function(node, source, metadata)
  if type(node) == "table" and node[1] and type(node[1]) == "userdata" then
    node = node[1]
  end
  return orig_get_range(node, source, metadata)
end

local orig_get_node_text = vim.treesitter.get_node_text
vim.treesitter.get_node_text = function(node, source, opts)
  if type(node) == "table" and node[1] and type(node[1]) == "userdata" then
    node = node[1]
  end
  return orig_get_node_text(node, source, opts)
end

local function normalize_match(match)
  return setmetatable({}, {
    __index = function(_, k)
      local v = match[k]
      if type(v) == "table" and #v == 1 and type(v[1]) == "userdata" then
        return v[1]
      end
      return v
    end,
    __pairs = function(_)
      local function iter(tbl, k)
        local nk, nv = next(tbl, k)
        if nk ~= nil then
          if type(nv) == "table" and #nv == 1 and type(nv[1]) == "userdata" then
            return nk, nv[1]
          end
          return nk, nv
        end
      end
      return iter, match, nil
    end,
  })
end

local orig_add_directive = vim.treesitter.query.add_directive
vim.treesitter.query.add_directive = function(name, handler, opts)
  local wrapped = function(match, pattern, source, pred, metadata)
    return handler(normalize_match(match), pattern, source, pred, metadata)
  end
  return orig_add_directive(name, wrapped, opts)
end

local orig_add_predicate = vim.treesitter.query.add_predicate
vim.treesitter.query.add_predicate = function(name, handler, opts)
  local wrapped = function(match, pattern, source, pred, metadata)
    return handler(normalize_match(match), pattern, source, pred, metadata)
  end
  return orig_add_predicate(name, wrapped, opts)
end
