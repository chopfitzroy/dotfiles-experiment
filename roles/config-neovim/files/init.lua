local fn = vim.fn
local fmt = string.format
local execute = vim.api.nvim_command

local plugin_path = fn.stdpath("data") .. "/lazy"

function ensure (user, repo)
  local install_path = fmt("%s/%s", plugin_path, repo)
  if fn.empty(fn.glob(install_path)) > 0 then
    execute(fmt("!git clone --filter=blob:none --single-branch https://github.com/%s/%s %s", user, repo, install_path))
  end
  vim.opt.runtimepath:prepend(install_path)
end

ensure("folke", "lazy.nvim")
ensure("Olical", "aniseed")

vim.g["aniseed#env"] = {
  module = "rc.init",
  compile = true,
}